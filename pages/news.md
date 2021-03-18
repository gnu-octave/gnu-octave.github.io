---
layout: page
title: News
icon: <i class="fas fa-rss"></i>
permalink: news.html
---

{% for post in site.posts %}
<div class="primary callout">
  {% if post == site.posts.first %}
  <a class="float-right button tiny warning" href="{{ "/feed.xml" | relative_url }}"><i class="fas fa-rss"></i>
    RSS
  </a>
  {% endif %}
  <p>
    <strong><a href="{{ post.url | relative_url }}">{{ post.title }}</a></strong>
  {% if post.title != "News Archive" %}
    &ndash; {{ post.date | date: "%b %-d, %Y" }}
  </p>
  <div class="entry-content">
    {{ post.excerpt }}
  </div>
  {% else %}
  </p>
  {% endif %}
</div>
{% endfor %}
