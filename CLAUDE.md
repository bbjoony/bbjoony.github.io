# bbjoony.github.io

개인 블로그 "The life is REAL" 의 Jekyll 저장소입니다. 중년 게임 QA 의 업무·일상 이야기를 한국어로 씁니다.
테마는 [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)(`jekyll-theme-chirpy` gem, [chirpy-starter](https://github.com/cotes2020/chirpy-starter) 구조)입니다.

## 배포

- `main` 에 push 하면 `.github/workflows/pages-deploy.yml`(GitHub Actions)이 빌드해서 https://bbjoony.github.io/ 에 배포합니다.
  저장소 Settings → Pages 의 Source 가 "GitHub Actions" 여야 합니다(Chirpy 이전에는 "Deploy from a branch" 였습니다).
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

## 구조

- `_config.yml`: chirpy-starter 설정에 제목, 태그라인, 설명, `lang: ko-KR`, `timezone: Asia/Seoul`, GitHub·이메일을 채웠습니다.
- `_tabs/`: 사이드바 메뉴(카테고리, 태그, 아카이브, 정보). 소개 글은 `_tabs/about.md` 입니다.
- `_data/contact.yml`: 사이드바 하단 아이콘(GitHub, 이메일, RSS).
- `assets/img/avatar.png`: 사이드바 프로필 사진(320×320 투명 배경 일러스트).
- 레이아웃과 CSS 는 gem 안에 있습니다. 바꿔야 하면 gem 의 파일을 같은 경로로 복사해서 덮어씁니다.
- 글 주소는 `/posts/:title/` 입니다(예전 주소 `/2025/07/07/qa_conference.html` 등은 더 이상 열리지 않습니다).

## 글 쓰기

- `_posts/YYYY-MM-DD-제목.md` 로 만듭니다. `layout`, `permalink` 는 기본값이 들어가므로 쓰지 않습니다.

  ```yaml
  ---
  title: "포스트 제목"
  description: "목록과 검색 결과에 보이는 요약"
  date: YYYY-MM-DD HH:MM:SS +0900
  categories: [상위 카테고리, 하위 카테고리]
  tags: [태그1, 태그2]
  ---
  ```

- 이미지는 `assets/img/posts/` 에 두고 `/assets/img/posts/파일명` 으로 씁니다.
- 이전 테마의 샘플 글은 2026-10-04 에 지웠습니다.
