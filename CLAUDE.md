# bbjoony.github.io

개인 블로그 "The life is REAL" 의 Jekyll 저장소입니다. 중년 게임 QA 의 업무·일상 이야기를 한국어로 씁니다.
테마는 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)(`jekyll-theme-chirpy` gem, [chirpy-starter](https://github.com/cotes2020/chirpy-starter) 구조)입니다.

## 배포

- `main` 에 push 하면 `.github/workflows/pages-deploy.yml`(GitHub Actions)이 빌드해서 https://bbjoony.github.io/ 에 배포합니다.
  저장소 Settings → Pages 의 Source 가 "GitHub Actions" 여야 합니다(Chirpy 이전에는 "Deploy from a branch" 였습니다).
- push 와 `gh` 저장소 설정 변경은 개인 계정 `bbjoony` 로만 됩니다. 평소 활성 계정인 회사 계정 `seokjunjin` 은 읽기 권한뿐입니다.
  `gh auth switch --user bbjoony` 로 바꾼 뒤, 전역 git 설정은 건드리지 않고
  `git -c credential.helper= -c 'credential.helper=!gh auth git-credential' push origin main` 으로 push 합니다.
  끝나면 `gh auth switch --user seokjunjin` 으로 되돌립니다.
- 공개 저장소이므로 올리면 바로 공개됩니다. 개인 정보나 회사 내부 내용이 들어가지 않게 주의합니다.
- 루트의 파일은 기본적으로 사이트에 공개됩니다. 문서나 설정 파일을 새로 만들면 `_config.yml` 의 `exclude` 에 추가합니다.

## 로컬 실행

- Homebrew `ruby@3.3` 을 씁니다. gem 은 `vendor/bundle` 에 있습니다(`Gemfile.lock` 은 chirpy-starter 처럼 커밋하지 않습니다).

  ```bash
  export PATH=/opt/homebrew/opt/ruby@3.3/bin:$PATH LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
  bundle exec jekyll serve   # http://localhost:4000
  ```

- `LANG` 이 UTF-8 이 아니면 SCSS 변환에서 `Invalid US-ASCII character` 오류가 납니다.
- native gem 을 설치할 때는 `SDKROOT=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk` 를 붙입니다.
  Command Line Tools 26.6 의 링커가 기본 SDK(macOS 27)를 읽지 못합니다.
- `_config.yml` 을 바꾸면 서버를 다시 시작해야 반영됩니다.
- PWA 오프라인 캐시(`pwa.cache.enabled`)는 껐습니다. 켜 두면 방문자 브라우저가 저장본을 먼저 보여 줘서, 수정 사항이 "업데이트" 알림을 누르기 전까지 보이지 않습니다.

## 구조

- `_config.yml`: chirpy-starter 설정에 제목, 태그라인, 설명, `lang: ko-KR`, `timezone: Asia/Seoul`, GitHub·이메일을 채웠습니다.
- `index.md`: 홈. blog.idean.me 처럼 소개 카드, 주요 글(front matter 에 `featured: true` 인 글), 최근 글 5개, 전체 글(`/archives/`) 링크로 구성합니다.
  Chirpy 기본 홈(글 카드 목록, 페이지 나누기)은 쓰지 않아서 `_config.yml` 의 `paginate` 를 껐습니다.
- `_includes/metadata-hook.html`: Chirpy 가 `<head>` 에 넣어 주는 사용자 include 입니다. 데스크톱(850px 이상) 사이드바 접기(기본 접힘, 상태는 localStorage)와
  홈의 "홈" 메뉴 선택 표시를 여기서 CSS·스크립트로 처리합니다. Chirpy 의 `sidebar.html` 은 덮어쓰지 않습니다.
  compress 레이아웃이 줄바꿈을 지우므로 인라인 스크립트에 `//` 주석을 쓰면 안 됩니다.
- 글 본문은 `word-break: keep-all`(단어 단위 줄바꿈, 왼쪽 정렬)입니다. 양쪽 정렬은 한국어에서 간격이 벌어져 쓰지 않기로 했습니다(2026-10-04). CSS 는 `metadata-hook.html` 에 있습니다.
- 글 맨 위 대표 이미지(front matter `image`)는 Chirpy 기본값인 40:21 자르기 대신 원래 비율로, 높이 최대 `min(70vh, 640px)`, 양옆 배경 없이 보여 줍니다(`metadata-hook.html`).
- `_plugins/normalize-nbsp-hook.rb`: Pages CMS 로 쓴 글에 섞여 들어오는 줄바꿈 금지 공백(U+00A0)을 렌더링 전에 일반 공백으로 바꿉니다.
  이 공백이 남아 있으면 단어 단위 줄바꿈에서 줄이 괄호 같은 곳에서만 끊깁니다.
- 댓글: giscus(`_config.yml` 의 `comments`). 댓글은 이 저장소 GitHub Discussions 의 Announcements 분류에 글마다 토론으로 저장됩니다.
  giscus GitHub App 은 이 저장소에만 설치했습니다. 댓글을 쓰려면 GitHub 로그인이 필요합니다.
- 방문 통계: GoatCounter(`bbjoony.goatcounter.com`, `_config.yml` 의 `analytics.goatcounter`, `pageviews`). 글 상단에 글별 조회수가 나오고,
  푸터에 사이트 전체 누적 방문자 수(`/counter/TOTAL.json`)를 `metadata-hook.html` 스크립트로 붙입니다.
  GoatCounter Settings 의 "Allow adding visitor counts on your website" 가 켜져 있어야 숫자가 나옵니다. 집계 스크립트는 배포본에만 들어가 로컬 미리보기는 집계되지 않습니다.
- `_tabs/`: 사이드바 메뉴(카테고리, 태그, 아카이브, 정보). 소개 글은 `_tabs/about.md` 입니다.
- `_data/contact.yml`: 사이드바 하단 아이콘(GitHub, 이메일, RSS).
- `assets/img/avatar.png`: 사이드바 프로필 사진(320×320 투명 배경 일러스트).
- `assets/img/favicons/`: 프로필 일러스트로 만든 파비콘 세트입니다. 테마 기본 파비콘(개미 그림)을 같은 파일 이름으로 덮어씁니다.
  홈 화면용(`apple-touch-icon.png`, `web-app-manifest-512x512.png`)은 흰 배경에 여백을 두었습니다.
- 레이아웃과 CSS 는 gem 안에 있습니다. 바꿔야 하면 gem 의 파일을 같은 경로로 복사해서 덮어씁니다.
- 글 주소는 `/posts/:title/` 입니다(Chirpy 이전의 `/2025/07/07/<제목>.html` 형식 주소는 더 이상 열리지 않습니다).

## 글 쓰기

- 웹 에디터: [Pages CMS](https://app.pagescms.org) 에 `bbjoony` 로 로그인해서 씁니다(GitHub App 은 이 저장소에만 설치).
  설정은 `.pages.yml` 입니다. 저장하면 `main` 에 바로 커밋·배포됩니다. "공개"를 끄면 `published: false` 로 저장되어 블로그에 나오지 않습니다.
  업로드한 이미지는 `assets/img/posts/` 에 임의 이름으로 들어갑니다. 에디터에서 커밋하므로 로컬 작업 전에는 `git pull` 합니다.
- `_posts/YYYY-MM-DD-제목.md` 로 만듭니다. `layout`, `permalink` 는 기본값이 들어가므로 쓰지 않습니다.

  ```yaml
  ---
  title: "포스트 제목"
  description: "목록과 검색 결과에 보이는 요약"
  date: YYYY-MM-DD HH:MM:SS +0900
  categories: [상위 카테고리, 하위 카테고리]
  tags: [태그1, 태그2]
  featured: true   # 홈의 "주요 글"에 넣을 때만
  ---
  ```

- 이미지는 `assets/img/posts/` 에 두고 `/assets/img/posts/파일명` 으로 씁니다.
- 이전 테마의 샘플 글은 2026-10-04 에 지웠습니다.
