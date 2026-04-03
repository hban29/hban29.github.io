#!/bin/bash
set -euo pipefail

echo "Entry point script running"

CONFIG_FILE=_config.yml

# Preserve tracked lockfiles and allow ignored local lockfiles used by Docker.
manage_gemfile_lock() {
    git config --global --add safe.directory '*' || true
    if ! command -v git &> /dev/null || [ ! -f Gemfile.lock ]; then
        return
    fi

    if git ls-files --error-unmatch Gemfile.lock &> /dev/null; then
        echo "Gemfile.lock is tracked by git, keeping it intact"
        git restore Gemfile.lock 2>/dev/null || true
    else
        echo "Gemfile.lock is ignored/untracked, preserving local bundle state"
    fi
}

ensure_bundle_dependencies() {
    if bundle check > /dev/null 2>&1; then
        echo "Bundle dependencies already satisfied"
        return
    fi

    echo "Installing bundle dependencies"
    bundle install
}

start_jekyll() {
    manage_gemfile_lock
    ensure_bundle_dependencies
    bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling &
}

start_jekyll

while true; do
    inotifywait -q -e modify,move,create,delete $CONFIG_FILE
    if [ $? -eq 0 ]; then
        echo "Change detected to $CONFIG_FILE, restarting Jekyll"
        jekyll_pid=$(pgrep -f jekyll)
        kill -KILL $jekyll_pid
        start_jekyll
    fi
done
