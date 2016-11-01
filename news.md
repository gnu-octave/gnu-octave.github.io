---
layout: default
title: News
menu: false
---

[**{% octicon rss class:"octicon-rss-octave" %} News feed**][Feed]

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
