---
layout: community-news
---

{% for post in site.posts limit:3 %}

## [{{ post.title }}]({{ post.url | absolute_url }})

{{ post.excerpt }}

<small><em>&mdash; The Octave Developers, {{ post.date | date: "%b %-d, %Y" }}</em></small>

{% endfor %}
