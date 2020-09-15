---
layout: page
title: News
menu: true
permalink: news.html
---

{% for post in site.posts %}
<div class="primary callout">
  {% if post == site.posts.first %}
  <a class="float-right button tiny warning" href="{{ "/feed.xml" | relative_url }}">
    RSS
  </a>
  {% endif %}
  {% if post.title == "News Archive" %}
  <h3 class="entry-title">
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </h3>
  {% else %}
  <h3 class="entry-title">
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </h3>
  <p class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</p>
  <div class="entry-content">
    {{ post.excerpt }}
  </div>
  {% endif %}
</div>
{% endfor %}
