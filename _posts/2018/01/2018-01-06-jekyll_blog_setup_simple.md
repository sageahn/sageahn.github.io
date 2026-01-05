---
published: true
layout: single
title: "Minimal Mistakes Theme으로 Jekyll기반 Github Page만들기"
category: blog
tags: jekyll minimal-mistakes github-pages
comments: true
---

# 사전 준비
- Github 가입
- 간단한 git 명령 이해 및 원리 개념 파악
- Markdown 사용법

# 설치
설치 단계는 MacOSX 기준으로 설명드립니다.

## Ruby 업데이트
이 단계가 꼭 필요한지는 모르겠습니다만, rbenv로 Ruby는 2.5.0으로 업그레이드 합니다.
맥의 경우 아래와 같이 진행합니다. Ruby 업데이트를 위해서는 homebrew가 설치되어야 합니다.

## Homebrew 설치
홈페이지 : https://brew.sh/index_ko.html

설치 스크립트 :

```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

위의 설치 스크립트 (한줄)를 복사해서 터미널에 붙여 넣고 엔터를 입력합니다.

### Ruby설치

Jekyll이 Ruby 언어를 이용해서 구현되었기 때문에 아래 명령을 터미널에 입력해서 설치합니다.

```
brew update
brew upgrade
brew install rbenv
brew install ruby-build
rbenv init
rbenv install 2.5.0
rbenv rehash
rbenv global 2.5.0
```

위의 단계에서 brew를 처음 설치하신 분은 brew update, brew upgrade를 하실 필요가 없습니다.

rbenv init 명령을 수행하면 eval "$(rbenv init -)"를 shell 환경에 추가하라고 나옵니다. 저는 zsh을 쓰기 때문에 ~/.zshrc 파일의 끝에 추가했습니다. 
추가 한 후에는 터미널을 닫고 새로 시작한 후에 ruby --version 명령을 실행하면 버전이 2.5.0으로 나오는 것을 확인 할 수 있습니다.

### Ruby bundler설치
http://ruby-korea.github.io/bundler-site/

```gem install bundler```

jekyll이 사용하는 다양한 ruby gem을 관리하기 위해 번들러를 설치합니다. 

## Minimal-mistakes repository fork
원래는 jekyll을 설치하고 블로그를 생성한 후에 theme 작업을 하지만 우리는 간단히 minimal-mistakes가 다 작업된 환경을 그대로 사용할 예정이므로 minimal-mistakes repo를 그대로 복사합니다. 오후에 종일 테스트 해 보니 clone을 하면 안되고 내 repository로 fork를 해 와야 정상적으로 표시가 됩니다.

### Minimal-Mistakes

홈페이지: https://mmistakes.github.io/minimal-mistakes/

Github Repo 사이트 : https://github.com/mmistakes/minimal-mistakes

위의 repo사이트로 이동하여 오른쪽 위의 fork버튼을 눌러서 내 계정으로 fork해 옵니다.
mmistakes/minimal-mistakes repository가 sageahn/minimal-mistakes repository로 fork됩니다.
자신의 repository의 settings 메뉴로 이동해서 minimal-mistakes 이름을 <userid>.github.io (예 sageahn.github.io)로 변경 합니다.

https://sageahn.github.io 에 접속하면 기본 사이트가 표시됩니다. 

이제 이 repository를 자신의 PC에 git clone합니다.

Minimal mistakes의 불필요한 파일을 지워 줍니다.
git rm 또는 그냥 rm 명령을 사용하면 됩니다.
지울 파일은 https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/ 에서 remove the unnecessary 항목을 참고합니다.
굳이 안 지워도 됩니다만 무료 최대 repo 크기는 1GB이니 지워서 공간을 확보합니다.

- .editorconfig
- .gitattributes
- .github
- /docs
- /test
- CHANGELOG.md
- README.md
- minimal-mistakes-jekyll.gemspec
- screenshot-layouts.png
- screenshot.png


수정사항을 commit합니다.

```
git add .
git commit -m “initial setup”
```

jekyll을 설치합니다.

```
bundle install
```

jekyll을 실행합니다

```
bundle exec jekyll serve 
```

Bundle exec jekyll serve는 jekyll을 local에서 실행 해 줍니다.
브라우저를 열고 http://localhost:4000/을 입력하면 블로그가 실행되는 것을 볼 수 있습니다. 이 상태에서 포스팅을 작성하면 localhost:4000에 자동으로 업데이트 됩니다.

## _config.yml 수정하기

사이트 제목이라던가 작성자 정보라던가 필요한 내용을 _config.yml 파일을 수정해서 업데이트 합니다. 수정 후 git commit/push하시면 사이트가 변경됩니다. 자세한 내용은 아래 링크를 확인 하세요
https://mmistakes.github.io/minimal-mistakes/docs/configuration/

# 포스팅 작성하기

## 포스팅 작성
repository의 최상위에 _posts 디렉토리를 만듭니다.

```
mkdir _posts
```

_posts/ 디렉토리 아래 year-month-day-title.md 형식으로 파일을 생성합니다.
예) 2018-01-06-firstday.md
구분자는 underscore가 아니고 dash입니다.

파일 이름은 웹에 노출되는 perma link작성의 기준이 되므로 신중히 작성하시고 사이트가 published 된 후에는 바꾸지 않는 것이 SEO에 좋습니다. 디폴트가 site url/category/title로 작성되니 category사용이 귀찮으시거나 필요 없으시면 _config.yml의 outputting 항목 아래를 수정하세요. 제 블로그는 permalink: /:year/:month/:day/:title/ 이 포맷으로 되어 있습니다.

포스팅을 작성할 때는 markdown의 상단에 아래 YAML Front Matter를 포함해야 합니다. 

```
---
published: true
layout: single
title: "first posting"
category: post
tags:
comments: true
---
```

본문 작성이 끝나면 로컬 머신에서 확인이 가능하고 문제가 없으면  git add/git commit/git push하여 publish합니다.

## 포스팅 작성 툴
markdown은 텍스트 기반이므로 터미널에서 수정하면 좀 불편합니다. 수정 사항을 바로 보기 위해서 atom이나 다른 markdown을 지원하는 editor를 쓰시는 것이 좋습니다.
저는 요즘 핫한 microsoft visual studio code를 추천합니다. 무료고, javascript를 잘 지원하기 때문에 javascript 공부하실 경우에 유용합니다. 잘은 모르지만 개인적으로 jetbrains의 webstorm이나 intellij에 손색이 없는 무료 툴입니다. MS가 요즘 참 잘해요

## Google Analytics
내 블로그에 방문자 수를 확인하고 싶고 기타 여러가지 실험을 해 보실 분들은 Google Analytics에 가입하신 후에 ID만 따와서 _config.yml에 등록하면 자동으로 정보들이 수집됩니다. 제가 minimal-mistakes theme을 좋아하는 이유기도 합니다. 대부분의 기능이 다 구현되어 있어요
