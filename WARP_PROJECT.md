# Jekyll 블로그 UI 개선 프로젝트

## 프로젝트 개요
- **시작일**: 2025-09-23
- **목표**: bbjoony.github.io Jekyll 블로그의 UI/UX 개선 및 테마 정리
- **현재 상태**: plainwhite 테마 기반으로 재구성 중

## 작업 현황

### ✅ 완료된 작업 (2025-09-23)
- [x] WARP.md 파일 생성 - 프로젝트 개발 가이드 문서화
- [x] _config.yml 테마 설정 수정 (jekyll-theme-cayman 제거)
- [x] Jekyll 서버 실행 및 기본 동작 확인
- [x] UI 개선 작업 리스트 작성

### 📋 진행 예정 작업
1. **_config.yml에 plainwhite 테마 설정 추가**
   - 사이트 기본 정보, 제목, 설명, 작성자 정보를 plainwhite 형식으로 설정
   - name, tagline, portfolio_image, social_links 등 필수 설정 추가

2. **프로필 이미지 추가 및 설정**
   - 개인 브랜딩을 위한 프로필 이미지를 assets/ 폴더에 추가
   - _config.yml에서 portfolio_image 경로 설정

3. **네비게이션 메뉴 구성**
   - About, Posts, Contact 등 주요 페이지로의 네비게이션 메뉴 설정

4. **소셜 링크 설정**
   - GitHub (bbjoony), 이메일 (bbjoony@gmail.com) 추가

5. **About 페이지 경로 수정**
   - about.md와 about.html 통합

6. **포스트 목록 스타일링 개선**
   - 홈페이지 포스트 목록 레이아웃 개선

7. **검색 기능 활성화**
   - plainwhite.search: true 설정

8. **다크 모드 기능 설정**
   - plainwhite.dark_mode: true 설정

9. **테마 일관성 확보**
   - CSS/JS 파일 정리

10. **반응형 디자인 및 모바일 최적화**
    - condensed_mobile 설정

11. **포스트 날짜 형식 한국어 설정**
    - date_format 한국어 설정

12. **사이트 최종 테스트 및 배포 준비**
    - 전체 기능 테스트

## 다음 작업 시작 방법
WARP를 다시 시작했을 때 이렇게 말씀해주세요:
```
"WARP_PROJECT.md 파일을 읽고 Jekyll 블로그 UI 개선 작업을 이어서 진행해줘"
```

## 기술 스택
- Jekyll 4.2.0
- plainwhite 테마 (레이아웃 사용 중)
- npm dependencies: Bootstrap 4.6.0, jQuery 3.6.0

## 참고사항
- 현재 시스템 Jekyll 사용 (Gemfile 없음)
- npm으로 프론트엔드 의존성 관리
- 한국어 컨텐츠 중심의 게임 QA 블로그