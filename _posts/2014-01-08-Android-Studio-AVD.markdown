---
layout: post
category: Dev
tags: Android Development
comments: true
title: AVD Panic
---
Windows에서 디폴트 user directory를 사용하지 않고 다른 곳으로 위치를 이동하면 AVD를 실행하는 경우 Panic이 발생한다.
이때는 
> mklink /J "C:\Users\userid\\.android" "D:\mydata\\.android"
명령을 이용하여 링크를 걸어주면 해결된다.

