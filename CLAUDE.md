# bbjoony.github.io

개인 블로그 "The life is REAL" 의 Jekyll 저장소입니다. 중년 게임 QA 의 업무·일상 이야기를 한국어로 씁니다.

## 배포

- GitHub Pages 가 `main` 브랜치 루트(`/`)를 빌드합니다(legacy 빌드, 별도 Actions 없음). push 하면 https://bbjoony.github.io/ 에 반영됩니다.
- 공개 저장소이므로 올리면 바로 공개됩니다. 개인 정보나 회사 내부 내용이 들어가지 않게 주의합니다.
- GitHub Pages 기본 환경(`github-pages` gem, Jekyll 3.10)으로 빌드되므로 Pages 가 지원하는 플러그인만 쓸 수 있습니다(현재 `jekyll-feed`, `jekyll-seo-tag`).
  `theme` 을 지정하지 않아서 Pages 가 기본 테마 primer 의 `assets/css/style.css` 를 붙여 줍니다. 지금 사이트 CSS 는 이것과 `assets/main.scss` 입니다.
- 루트의 파일은 기본적으로 모두 공개됩니다. 문서나 설정 파일을 새로 만들면 `_config.yml` 의 `exclude` 에 추가합니다(Jekyll 3 은 이 목록이 기본값을 대체합니다).

## 로컬 실행

- Homebrew `ruby@3.3` 과 루트 `Gemfile`(`github-pages` gem)로 Pages 와 같은 Jekyll 3.10 을 씁니다. gem 은 `vendor/bundle` 에 있습니다.

  ```bash
  export PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  bundle exec jekyll serve   # http://localhost:4000
  ```

- `LANG` 이 UTF-8 이 아니면 primer SCSS 에서 `Invalid US-ASCII character` 오류가 납니다.
- native gem 을 다시 설치할 때는 `SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk` 를 붙입니다.
  Command Line Tools 26.6 의 링커가 기본 SDK(macOS 27)를 읽지 못합니다.
- `_config.yml` 을 바꾸면 서버를 다시 시작해야 반영됩니다.
- `-old/` 에 예전 설정의 Gemfile 이 남아 있지만 현재 빌드에는 쓰이지 않습니다.

## 구조

- `_config.yml`: 제목, 작성자, 설명, 플러그인, `plainwhite:` 설정, `exclude`. `theme`/`remote_theme` 는 지정하지 않고 저장소 안의 레이아웃을 씁니다.
- `_layouts/`, `_includes/`: plainwhite 테마 기반이고 `site.plainwhite.*` 를 읽습니다. `post.html`, `index.md` 는 인라인 스타일로 직접 꾸민 상태입니다.
- plainwhite 의 CSS(`_sass`, 아이콘 폰트용 스타일)는 저장소에 없습니다. 그래서 `social_links`, `dark_mode`, `search` 는 꺼 두었습니다.
- `assets/portfolio.png` 는 테마 데모용 스톡 사진이라 프로필로 쓰지 않습니다. `portfolio_image` 가 없으면 이미지를 표시하지 않도록 `default.html` 을 고쳤습니다.
- 루트에 Clean Blog 테마 잔재(`package.json`, `jekyll-theme-clean-blog.gemspec`, `img/`, `assets/scripts.js`)와 plainwhite 테마 파일(`plainwhite.gemspec`, `README.md`, `screenshot.png`)이 섞여 있습니다.
- 페이지: `index.md`(홈, 최근 글 5개), `posts.md`·`posts/`(글 목록), `about.md`·`about.html`, `contact.html`, `404.html`, `search.json`.

## 글 쓰기

- `_posts/YYYY-MM-DD-제목.md` 로 만듭니다. Front matter:

  ```yaml
  ---
  layout: post
  title: "포스트 제목"
  subtitle: "부제목"
  date: YYYY-MM-DD HH:MM:SS +0900
  categories: [카테고리1, 카테고리2]
  ---
  ```

- 직접 쓴 글은 `2025-07-07-blog-start.md`, `2025-07-07-qa_conference.md` 입니다.
  2019–2020 날짜의 글(`welcome-to-jekyll`, `dinosaurs`, `heartbeats` 등)은 테마 샘플입니다. 사용자 확인 없이 지우지 않습니다.
- 이미지는 지금 루트나 `_posts/` 에 흩어져 있습니다. 새 이미지는 `assets/` 아래에 두는 쪽을 권합니다.

## 진행 중인 일

UI 개선 작업 목록은 `WARP_PROJECT.md` 에 있습니다(2025-09-23 작성, plainwhite 설정 정리·프로필 이미지·검색·다크 모드 등).
`WARP.md` 는 Warp 터미널용 안내입니다(2026-10-04 에 현재 상태로 고침).
1번(plainwhite 기본 설정)은 2026-10-04 에 이름·태그라인·메뉴·날짜 형식만 넣었습니다. 프로필 사진과 소셜 링크는 아직입니다.
