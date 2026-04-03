---
layout: about
title: Home
permalink: /
subtitle: Professor, Department of Electrical Engineering and Computer Science, University of Tennessee, Knoxville

profile:
  align: right
  image: djouadi.jpg
  image_circular: false # crops the image to make it circular
  more_info: >
    <p>MK640</p>
    <p>1520 Middle Drive</p>
    <p>Knoxville, TN 37996</p>

selected_papers: false # rendered in a custom homepage section below
social: true # includes social icons at the bottom of the page

announcements:
  enabled: false # rendered in a custom homepage section below
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

{% include home/hero.liquid %}

Seddik M. Djouadi is a Professor in the Department of Electrical Engineering and Computer Science at the University of Tennessee, Knoxville. His research spans robust and distributed control, power networks with high renewable penetration, wireless networked systems, nonlinear model reduction, and interdisciplinary control applications in biology and cyber-physical systems.

He received his Ph.D. in Electrical Engineering from McGill University in 1999, with earlier degrees from Ecole Polytechnique, University of Montreal, and Ecole Nationale Polytechnique in Algiers. His work emphasizes uncertainty-aware modeling and control with strong connections to practical systems in energy, communications, and computing.

{% include home/research_areas.liquid %}

{% include home/featured_publications.liquid %}

{% include home/recent_news.liquid %}
