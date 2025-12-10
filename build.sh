#!/bin/bash

# Jekyll 빌드 검증 스크립트
# 배포 전에 로컬에서 빌드가 정상적으로 되는지 확인합니다
# 사용법: ./build.sh

set -e

echo "🔨 Jekyll 사이트를 빌드합니다..."
echo ""

# 의존성이 설치되어 있는지 확인
if [ ! -f "Gemfile.lock" ]; then
    echo "⚠️  Gemfile.lock이 없습니다. 의존성을 설치합니다..."
    bundle install
fi

# 빌드 실행
eval "$(rbenv init -)" && bundle exec jekyll build

echo ""
echo "✅ 빌드가 완료되었습니다!"
echo "📁 빌드 결과는 _site/ 디렉토리에 있습니다"
echo ""

# 빌드 결과 확인
if [ -d "_site" ] && [ "$(ls -A _site)" ]; then
    echo "✅ _site 디렉토리에 파일이 생성되었습니다"
    echo "📊 빌드된 파일 수: $(find _site -type f | wc -l | tr -d ' ')"
else
    echo "❌ 빌드 실패: _site 디렉토리가 비어있거나 생성되지 않았습니다"
    exit 1
fi


