---
layout: page
title: News
menu: true
---

<section>
  <div class="row">
    <div class="columns small-12">
      {% for post in site.posts %}
      <div class="panel callout">
        {% if post == site.posts.first %}
        <a class="right" href="{{ "/feed.xml" | relative_url }}">
          <span class="label warning">
            RSS
          </span>
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
    </div>
  </div>
</section>
