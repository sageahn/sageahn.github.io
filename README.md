# Sage's Log

Jekyll 기반 정적 블로그입니다.

## 🚀 빠른 시작

### 사전 요구사항

- Ruby 3.1 이상
- Bundler

### 설치

```bash
# 의존성 설치
bundle install
```

### 로컬 개발 서버 실행

```bash
# 개발 서버 시작 (자동 새로고침 포함)
./serve.sh

# 또는 직접 실행
bundle exec jekyll serve --livereload
```

브라우저에서 `http://localhost:4000`을 열어 확인하세요.

### 배포 전 빌드 검증

```bash
# 로컬에서 빌드 테스트
./build.sh

# 또는 직접 실행
bundle exec jekyll build
```

## 📝 작업 흐름

1. **로컬에서 개발**
   ```bash
   ./serve.sh
   ```
   - 포스트 작성/수정
   - 브라우저에서 확인 (http://localhost:4000)

2. **빌드 검증**
   ```bash
   ./build.sh
   ```
   - 빌드 오류 확인
   - 모든 것이 정상이면 다음 단계로

3. **커밋 및 푸시**
   ```bash
   git add .
   git commit -m "포스트 추가/수정"
   git push origin main  # 또는 master
   ```

4. **자동 배포**
   - GitHub Actions가 자동으로 빌드 및 배포
   - Actions 탭에서 배포 상태 확인 가능

## 🛠️ 프로젝트 구조

```
.
├── _config.yml          # Jekyll 설정 파일
├── _data/               # 데이터 파일
│   └── navigation.yml   # 네비게이션 설정
├── _pages/              # 페이지 파일
│   └── about.md
├── _posts/              # 블로그 포스트
├── assets/              # 정적 자원 (이미지 등)
├── .github/
│   └── workflows/       # GitHub Actions 워크플로우
│       └── jekyll.yml
├── Gemfile              # Ruby 의존성
├── serve.sh             # 개발 서버 실행 스크립트
└── build.sh             # 빌드 검증 스크립트
```

## 🔧 주요 설정

### 테마
- Minimal Mistakes 4.24.0 (remote_theme 사용)

### 플러그인
- jekyll-paginate: 페이지네이션
- jekyll-sitemap: 사이트맵 생성
- jekyll-gist: GitHub Gist 지원
- jekyll-feed: RSS 피드
- jemoji: 이모지 지원
- jekyll-include-cache: 성능 최적화

### 커스텀 도메인
- sageahn.com (CNAME 파일로 설정)

## 📚 참고 자료

- [Jekyll 공식 문서](https://jekyllrb.com/)
- [Minimal Mistakes 테마 문서](https://mmistakes.github.io/minimal-mistakes/)
- [GitHub Pages 문서](https://docs.github.com/en/pages)

## 🐛 문제 해결

### 빌드 오류 발생 시

1. 의존성 재설치
   ```bash
   bundle install
   ```

2. 캐시 삭제 후 재빌드
   ```bash
   rm -rf .jekyll-cache _site
   bundle exec jekyll build
   ```

3. Gemfile.lock 삭제 후 재설치
   ```bash
   rm Gemfile.lock
   bundle install
   ```

### 로컬 서버가 시작되지 않을 때

- 포트 4000이 이미 사용 중일 수 있습니다
- 다른 포트 사용: `bundle exec jekyll serve --port 4001`

## 📄 라이선스

이 블로그의 컨텐츠는 개인 소유입니다.


