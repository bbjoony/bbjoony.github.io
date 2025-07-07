---
layout: default
title: 모든 포스트
---

<div style="max-width: 800px; margin: 0 auto; padding: 20px;">

# 모든 포스트

{% for post in site.posts %}
<div style="margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid #eee;">
  <h2><a href="{{ post.url }}" style="text-decoration: none; color: #0366d6;">{{ post.title }}</a></h2>
  <p style="color: #666; font-size: 14px; margin: 10px 0;">{{ post.date | date: "%Y년 %m월 %d일" }}</p>
  {% if post.excerpt %}
    <p>{{ post.excerpt | strip_html | truncatewords: 50 }}</p>
  {% endif %}
</div>
{% endfor %}

</div>
