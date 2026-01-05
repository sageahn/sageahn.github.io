#!/bin/bash

# Jekyll 로컬 개발 서버 실행 스크립트
# 사용법: ./serve.sh

set -e

echo "🚀 Jekyll 로컬 개발 서버를 시작합니다..."
echo "📝 브라우저에서 http://localhost:4000 을 열어 확인하세요"
echo "🔄 파일 변경 시 자동으로 새로고침됩니다"
echo ""

# 의존성이 설치되어 있는지 확인
if [ ! -f "Gemfile.lock" ]; then
    echo "⚠️  Gemfile.lock이 없습니다. 의존성을 설치합니다..."
    bundle install
fi

# Jekyll 서버 실행 (livereload 포함)
eval "$(rbenv init -)" && bundle exec jekyll serve --livereload

