---
layout: default
---

<div style="max-width: 800px; margin: 40px auto; padding: 40px 20px; background-color: white; min-height: 80vh;">

# 안녕하세요! 👋

중년의 게임QA로 살아가며 겪는 일상과 업무 이야기를 기록하는 공간입니다.

## 이곳에서 나누는 이야기들

- 🎮 **게임 테스팅 경험**: QA 업무에서 겪은 다양한 경험과 노하우
- 💭 **일상의 기록**: 중년의 삶에서 느끄는 소소한 이야기들  
- 🔧 **배움의 여정**: 새로운 도구나 기술을 익혀가는 과정
- 📝 **생각 정리**: 업무와 삶에 대한 개인적인 생각들

<hr style="margin: 40px 0; border: 1px solid #eee;">

## 최근 포스트

{% if site.posts.size > 0 %}
  {% for post in site.posts limit:5 %}
  <div style="margin-bottom: 40px; padding-bottom: 25px; border-bottom: 1px solid #f0f0f0;">
    <h3><a href="{{ post.url }}" style="text-decoration: none; color: #0366d6; font-size: 1.4em;">{{ post.title }}</a></h3>
    <p style="color: #666; font-size: 14px; margin: 10px 0;">{{ post.date | date: "%Y년 %m월 %d일" }}</p>
    {% if post.excerpt %}
      <p style="line-height: 1.6; color: #333;">{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
    {% endif %}
  </div>
  {% endfor %}
  
  <div style="text-align: center; margin: 60px 0 80px 0;">
    <a href="/posts" style="background-color: #0366d6; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold; display: inline-block;">모든 포스트 보기</a>
  </div>
{% else %}
  <p>아직 포스트가 없습니다.</p>
{% endif %}

<hr style="margin: 60px 0 40px 0; border: 1px solid #eee;">

<div style="text-align: center; padding: 40px 0; color: #666;">
<strong>The life is REAL</strong><br>
진짜 삶의 이야기를 진솔하게 담아보겠습니다.
</div>

</div>
