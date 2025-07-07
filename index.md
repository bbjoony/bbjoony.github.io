---
layout: default
---

<div style="max-width: 800px; margin: 0 auto; padding: 20px;">

# 안녕하세요! 👋

중년의 게임QA로 살아가며 겪는 일상과 업무 이야기를 기록하는 공간입니다.

## 이곳에서 나누는 이야기들

- 🎮 **게임 테스팅 경험**: QA 업무에서 겪은 다양한 경험과 노하우
- 💭 **일상의 기록**: 중년의 삶에서 느끄는 소소한 이야기들  
- 🔧 **배움의 여정**: 새로운 도구나 기술을 익혀가는 과정
- 📝 **생각 정리**: 업무와 삶에 대한 개인적인 생각들

---

## 최근 포스트

{% if site.posts.size > 0 %}
  {% for post in site.posts limit:5 %}
  <div style="margin-bottom: 30px; padding-bottom: 20px; border-bottom: 1px solid #eee;">
    <h3><a href="{{ post.url }}" style="text-decoration: none; color: #0366d6;">{{ post.title }}</a></h3>
    <p style="color: #666; font-size: 14px; margin: 10px 0;">{{ post.date | date: "%Y년 %m월 %d일" }}</p>
    {% if post.excerpt %}
      <p>{{ post.excerpt | strip_html | truncatewords: 30 }}</p>
    {% endif %}
  </div>
  {% endfor %}
  
  <div style="text-align: center; margin-top: 30px;">
    <a href="/posts" style="background-color: #0366d6; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px;">모든 포스트 보기</a>
  </div>
{% else %}
  <p>아직 포스트가 없습니다.</p>
{% endif %}

---

**The life is REAL** - 진짜 삶의 이야기를 진솔하게 담아보겠습니다.

</div>
