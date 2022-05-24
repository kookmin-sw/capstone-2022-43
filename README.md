# 🛳 Welcome to BAETAVERSE Github

### 1. 배타버스 소개

#### 개요

* 화물의 주인과 운송 주선업자 사이의 정보 비대칭성을 줄여서 화물의 주인에게 합리적인 소규모 화물 물류비 견적을 제공해주는 플랫폼

#### 기술 스택

| Technology            | OS                                        | Language   | Technology            | Directory        |
| --------------------- | ----------------------------------------- | ---------- | --------------------- | ---------------- |
| Front-End Application | build : macOS 12 monteray & Xcode 13      | Swift 5.6  | UIKit, SwiftUI        | [mobile](mobile) |
| Back-End Server       | Up to Ubunutu 16.04, macOS 12, Windows 10 | TypeScript | Express.js            | [server](server) |
| BackEnd NLP           | Up to Ubunutu 16.04, macOS 12, Windows 10 | Python 3   | NLP 자연어 처리       | [NLP](HScode)    |
| Cloud Deployment      | Up to Ubunutu 16.04, macOS 12, Windows 10 | Shell      | AWS (EC2, RDS), MySQL |                  |



#### 서비스 배치도

![system_distribution](https://user-images.githubusercontent.com/25794814/169978480-d050e280-d356-4841-af7a-52a2b37bba76.jpg)



#### 그라운드 룰

* Notion Discord 협업 도구를 통한 커뮤니케이션 및 프로젝트 진행 상황 문서화
* 소프트웨어 형상 관리 시스템을 활용하여 소스 코드 관리 및 협업 진행
* 매주 월, 금요일 저녁 7시에 정기 회의 진행하며 팀원 모두 적극적으로 프로젝트에 참여
* 프로젝트 진행 중 특이 사항 발생시 Discord 통해 빠르게 소통 진행
* 코로나-19 상황 개선 전까지 주 2회 화상 회의 서비스를 활용한 온라인 미팅 진행



#### Commit 규칙

* 가능한 하나의 커밋에 한가지 수정 내용만 담기도록 진행
* 함수, 모듈 단위 커밋 진행

* [카르마 커밋 규칙 사용](http://karma-runner.github.io/6.3/dev/git-commit-msg.html)

```
<type>(<scope>): <subject>
<BLANK LINE>
<body>
<BLANK LINE>
<footer>
```

- **feat** for a new feature for the user, not a new feature for build script. Such commit will trigger a release bumping a MINOR version.
- **fix** for a bug fix for the user, not a fix to a build script. Such commit will trigger a release bumping a PATCH version.
- **perf** for performance improvements. Such commit will trigger a release bumping a PATCH version.
- **docs** for changes to the documentation.
- **style** for formatting changes, missing semicolons, etc.
- **refactor** for refactoring production code, e.g. renaming a variable.
- **test** for adding missing tests, refactoring tests; no production code change.
- **build** for updating build configuration, development tools or other changes irrelevant to the user.



### 2. 소개 영상

[![배타버스 소개영상](http://img.youtube.com/vi/vZvXX3HYhUc/3.jpg)](https://youtu.be/vZvXX3HYhUc) 



### 3. 팀 소개

|                        Profile Image                         |  Name  | Student # |               Role                |                           Contacts                           |
| :----------------------------------------------------------: | :----: | :-------: | :-------------------------------: | :----------------------------------------------------------: |
| ![JeongTaekHan_Gihub_Profile_Image](https://user-images.githubusercontent.com/25794814/161695184-9c6973ec-e952-4aba-b634-168e3aff06b4.jpg) | 한정택 | XXXX1718  | 팀장 / Mobile Front-End Developer | E-mail : [smart8612@gmail.com](mailto:smart8612@gmail.com)<br />Github : [@smart8612](https://github.com/smart8612) |
| ![서보성_깃허브_프로필](https://user-images.githubusercontent.com/25794814/161761646-da19395d-2725-48eb-88ee-21748665c142.JPG) | 서보성 | XXXX1629  |      개발자 / NLP Developer       | E-mail : [sboseong124@gmail.com](mailto:sboseong124@gmail.com)<br />Github : [@sboseong](https://github.com/sboseong) |
| ![김현우_깃허브_프로필](https://user-images.githubusercontent.com/25794814/161712837-ae168dea-9004-4580-ab47-eee870f3ad9a.jpg) | 김현우 | XXXX1603  |    개발자 / Back-End Developer    | E-mail : [khw56184@kookmin.ac.kr](mailto:khw56184@kookmin.ac.kr)<br />Github : [@ASak1104](https://github.com/ASak1104) |
| ![신준호_깃허브_프로필](https://user-images.githubusercontent.com/25794814/161790545-c3c9a73d-f1bb-48f0-adaa-c5e221e14fb8.jpg) | 신준호 | XXXX1616  |    개발자 / Back-End Developer    | Email : [joonno94@kookmin.ac.kr](mailto:joonno94@kookmin.ac.kr)<br />Github : [@uyimjunho](https://github.com/uyimjunho) |
| ![profileImage](https://user-images.githubusercontent.com/25794814/160516929-b941a406-cd25-404d-bae5-c827159bc611.png) | 안규빈 | XXXXXXXX  |     기획자 / Service Planner      |    Email : [kbahn99@cau.ac.kr](mailto:kbahn99@cau.ac.kr)     |



### 4. 사용법




#### REST-API & Database Server Technical Document

* [REST-API Server - Install and Running Guide](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BServer%5D-Install-and-Running-Guide)

* [REST-API Server - API Documentation (GitHub Wiki)](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BServer%5D-REST-API-Documents)

* [REST-API Server - API Documentation (Swagger Docs)](http://baetaverse.kro.kr/api-docs/)

* [Database Server - Setup Guide](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BServer%5D-Database-Setup-Guide)



#### NLP HS Code Processing Engine Technical Document

* [HS Code Processing Engine - Install and Running Guide](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BNLP%5D-Install-and-Running-Guide)
* [HS Code Processing Engine - API Documents](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BNLP%5D-HScode-API-Documents)



#### Apple Mobile Application Technical Document

* [Mobile Application - Install and Running Guide](https://github.com/kookmin-sw/capstone-2022-43/wiki/%5BMobile%5D-iOS-Project-Build-Guide)



### 5. 기타



#### 중간발표자료

* [팀43-중간발표자료.pdf](docs/중간평가/팀43-중간발표자료.pdf)
* [팀43-중간보고서.pdf](docs/중간평가/팀43-중간보고서.pdf)



#### 기말발표자료

* [팀43-최종발표자료.pdf](docs/기말평가/팀43-최종발표자료.pdf)
* [팀43-수행결과보고서.pdf](docs/기말평가/팀43-수행결과보고서.pdf)
* [팀43-포스터.pdf](docs/기말평가/팀43-포스터.pdf)
* [팀43-시연동영상.mp4](https://www.youtube.com/watch?v=vZvXX3HYhUc)



#### Reference

* [BAETAVERSE Notion](https://singularis7.notion.site/e2e5f0586d014691bcb111bd27ea6278)
* [BAETAVERSE Github Page](https://kookmin-sw.github.io/capstone-2022-43/)
