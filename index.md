---
layout: page
title: 중년 게임QA의 일상과 업무 기록
---

<style>
  .home-section { margin-bottom: 2rem; }
  .home-card {
    background: var(--card-bg);
    border: 1px solid var(--main-border-color);
    border-radius: 0.75rem;
    padding: 1.25rem 1.5rem;
    box-shadow: var(--card-shadow);
  }
  .home-card > :first-child { margin-top: 0; }
  .home-card > :last-child { margin-bottom: 0; }
  .home-card p { margin-bottom: 0.6rem; }
  /* Chirpy 의 `.content a:not(.img-link)` 밑줄(border-bottom)을 홈에서만 끕니다. */
  .content .home-section a:not(.img-link) { border-bottom: none; text-decoration: none; }
  .home-section a:hover { text-decoration: underline; }
  .home-posts { list-style: none; margin: 0; padding: 0; }
  .home-posts li + li { margin-top: 0.5rem; }
  .home-posts li { display: flex; justify-content: space-between; gap: 1rem; }
  .home-posts time { flex-shrink: 0; color: var(--text-muted-color); font-size: 0.85rem; }
  .home-more { display: inline-block; margin-top: 0.75rem; }
</style>

<section class="home-section">
<h2>소개</h2>
<div class="home-card" markdown="1">

게임 QA로 일하며 겪은 경험과 일상의 생각을 기록하는 공간입니다.
게임 테스팅에서 배운 것, 새로운 도구를 익혀 가는 과정, 업무와 삶에 대한 생각을 나눕니다.

[블로그 소개 더 보기 →](/about/)

</div>

</section>

{% assign featured = site.posts | where: "featured", true %}
{% if featured.size > 0 %}
<section class="home-section">
  <h2>주요 글</h2>
  <div class="home-card">
    <ul class="home-posts">
      {% for post in featured %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y.%m.%d" }}</time>
      </li>
      {% endfor %}
    </ul>
  </div>
</section>
{% endif %}

<section class="home-section">
  <h2>최근 글</h2>
  <div class="home-card">
    <ul class="home-posts">
      {% for post in site.posts limit: 5 %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y.%m.%d" }}</time>
      </li>
      {% endfor %}
    </ul>
  </div>
  <a class="home-more" href="{{ '/archives/' | relative_url }}">전체 글 보기 →</a>
</section>
