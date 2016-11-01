---
layout: page
title: News
menu: true
---

<a class="right" href="{{ "/feed.xml" | relative_url }}">
  <span class="label warning">
    RSS
  </span>
</a>

{% for post in site.posts %}
{% if post.title == "News Archive" %}
- [**{{ post.title }}**]({{ post.url | relative_url }})
{% else %}
- [**{{ post.title }}**]({{ post.url | relative_url }})
  ({{ post.date | date: "%b %-d, %Y" }})


  <div class="news-content">
  {{ post.excerpt }}
  </div>
{% endif %}
{% endfor %}

[Feed]: {{ "feed.xml" | relative_url }}
