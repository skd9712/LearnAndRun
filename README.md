# 🐇 시범강의 예약 웹 서비스 Learn & Run
![learn_and_run_poster2](https://github.com/skd9712/LearnAndRun/assets/109783402/877573ce-314a-4eeb-9293-de92a945e120)

### 천재교육 풀스택 5기 3차 프로젝트
 - 프로젝트 주제: 해법 교육 시범 강의 예약 웹서비스 개발
 - 프로젝트 기간: 2024-05-17~2024-05-30

## 🥕 기획의도 
### 1. 차별화된 UI/UX 디자인 구현 
- 사용자들에게 기존 인강 사이트와는 다른 감성적이고 활기찬 UI를 제공하여 학습을 더욱 흥미롭게 만듦

### 2. 간편한 서비스 및 기능 제공
- 사용자들이 쉽게 가입하고 강의를 찾을 수 있으며, 간편한 결제를 통해 수강할 수 있는 편의성을 제공 

### 3. 지속적인 학습 지원 및 성장 도모
- 사용자들의 원활한 수강을 위한 학습 기자재 제공하여 지속적인 성장을 도모

## 🥕 팀원

| 이름 | 역할 | 연락처 | GitHub |
|------|------|--------|--------|
| 황현준 | 팀장 | skd97122@gmail.com | [황현준](https://github.com/skd9712) |
| 은 별 | 개발자 | agstarr000@gmail.com | [은 별](https://github.com/Agstarr) |
| 최현훈 | 개발자 | tongueeye1@gmail.com | [최현훈](https://github.com/tongueEye) |

## 🥕 프로젝트 목표

### 1. 사용자 경험 개선
- **감성적이고 활기찬 UI/UX 디자인**을 통한 사용자 만족도 향상
- 간편한 **가입 및 결제 프로세스** 구축으로 사용자 편의성 제공

### 2. 다양한 콘텐츠 제공
- 카테고리별 **다양한 인강 콘텐츠 제공**
- 다양한 콘텐츠들을 **검색을 통해 효율적으로 이용 가능**

### 3. 학습 지원 및 성장 도모
- 사용자들의 원활한 수강을 위한 **학습 기자재 제공**하여 지속적인 성장을 도모

                  

## 🥕 기술 스택

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-8A2BE2?style=for-the-badge&logo=java&logoColor=white)
![Servlet](https://img.shields.io/badge/Servlet-009639?style=for-the-badge&logo=java&logoColor=white)

![HTML](https://img.shields.io/badge/HTML-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS](https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white)

![AJAX](https://img.shields.io/badge/AJAX-5A29E4?style=for-the-badge&logo=ajax&logoColor=white)
![API](https://img.shields.io/badge/API-0052CC?style=for-the-badge&logo=api&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IntelliJ_IDEA-000000?style=for-the-badge&logo=intellij-idea&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

## 🥕 브랜드 및 컨셉
<img src="https://github.com/skd9712/LearnAndRun/assets/59557044/a72bcceb-46b5-4811-8afd-2e61b8d14f90" width=400px height=auto>

### 배우다(learn) + 달리다(run)

웹사이트의 강의 콘텐츠를 통해 배우고 앞으로 나아갈 수 있다는 의미를 담고 있습니다. 

이는 '지식적 성장'을 추구하는 우리의 핵심 가치를 반영합니다.
         
## 🥕 주요 기능

**강의목록/검색**
- 인기순, 최신순 또는 과목별, 강사별로 강의 목록을 분류해서 보여줌
- 검색 기능을 통해 원하는 강의를 찾을 수 있음
  
**수강 신청 기능**
- 수강 신청 시 결제가 이루어지며, 결제 완료 시 강의 수강에 대한 권한을 얻을 수 있음
- 수강 철회 시 관리자에 의해 결제 취소가 이루어지며, 수강에 대한 권한을 반납함

**강의 보기 기능**
- 강의 세부 페이지에서 강의를 시청할 수 있으며 자료 등을 다운 받아 사용할 수 있음
  
**로그인/가입 기능**
- 관리자로 로그인 시 강의 와 세부 강의에 대한 CRUD가 가능함
- 사용자로 로그인 시 강의조회와  내 정보 수정만 가능함.


## 🥕 세부 구현 기능
**메인페이지**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/05ac2f06-5fee-4b2b-bafe-b02b1ef2988a" alt="메인페이지">
  - 메인 페이지는 브랜드 컨셉에 맞는 감성적이고 활기찬 UI로 디자인 되어 있으며, 통합 검색 창과 과목별, 인기순, 최신순, 개강 임박 강의 등을 확인할 수 있다. 또한 캘린더를 통해 강의 일정을 확인할 수 있다.
  
**회원가입/로그인 기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/c7a9ba16-fd4d-472f-a6f6-96a08763ee6f" alt="가입로그인">
  
  - 회원가입 페이지에서는 아이디 중복체크가 실시간으로 가능하며, 중복된 아이디는 ‘사용 불가’ 사용가능한 아이디는 ‘사용 가능’ 텍스트가 나온다.
  - 비밀번호를 재입력 하며 입력한 비밀번호가 일치한지 확인 가능하다.
  - 카카오 주소 API를 이용해 편리한 주소 검색이 가능하다.
  - 로그인 페이지에서는 아이디와 비밀번호를 입력한다. 만약 DB에 저장된 값과 다르다면 ID 혹은 비밀번호가 틀렸다는 텍스트가 하단에 나온다.
  
**강의CRUD기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/469d8cd2-1dab-417f-8bbe-3eb45f9f7961" alt="강의CRUD">
  - 강의 목록에서는 [전체 검색/ 강의명/ 강사명/ 과목] 별로 검색이 가능하고, [최신순/ 인기순/ 가격 낮은순/ 가격 높은순]으로 정렬할 수 있다. 페이징을 적용하여 한 페이지에 최대 12개의 강의를 보여준다.
  - 강의 등록과 수정에서는 썸네일 업로드 시 미리보기가 가능하며, 강의 등록, 수정, 삭제 페이지에는 관리자로 로그인했을 경우에만 접근 가능하다. 강의 상세 페이지의 바로 결제와 찜하기 버튼은 관리자로 로그인한 경우 강의 수정과 삭제 버튼으로 대체되어 보여진다.
  - 세부 강의 목록과 강의 수강 페이지는 강의 수강신청이 완료된 회원 혹은 관리자만 확인 및 접근 할 수 있고, 세부 강의 등록/수정/삭제는 관리자로 로그인했을 경우에만 가능하다.
  
**찜기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/b5404509-363d-4fd3-a0ba-43478f9dc626" alt="찜기능">
  - 비회원이 찜하기 버튼을 클릭하면 로그인 후 가능하다는 알림을 보여주고 회원이 찜하기 버튼을 클릭하면 찜목록 추가 혹은 삭제 여부 알림을 보여준다. 찜한 강의는 마이페이지에서 확인 가능하다.
  
**강의 결제 기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/8ddee4d5-3055-4182-b654-1cf8f83ef33c" alt="결제기능" width="800px">
  - 결제 버튼을 누르면 카카오페이 결제를 통해 간편 결제가 가능하며, 결제 완료 후 수강에 대한 권한을 부여 받고, 마이페이지>수강중인 강좌 목록에서 확인이 가능하다.
  
**마이페이지 기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/22fa51b1-8968-447b-8db1-f793836a9458" alt="마이페이지">
  - 마이페이지는 화면 상단의 마이페이지 버튼을 눌러 접근 가능하다. 수강중인 강의, 내가 찜한 강의 리스트가 나오며 썸네일을 클릭하면 해당 강의의 상세 페이지로 이동 가능하다. 내정보 수정 버튼을 눌러 회원 정보를 수정 가능하다.
  
**관리자페이지 기능**

  <img src="https://github.com/skd9712/LearnAndRun/assets/109783402/d4f511e1-cd71-4ff0-a85f-8f93642bf1c5" alt="관리자페이지">
  - 관리자 페이지는 관리자 계정으로 로그인 시 상단의 관리자 페이지 탭을 눌러 이동 가능하다. 과목별 수강 인원 섹션에서는 과목별 수강 인원을 한눈에 확인하기 쉽게 차트를 이용해 나타냈다.
  - 회원 관리, 수강 관리탭을 눌러 해당하는 섹션으로 바로 이동 가능하다. 둘 다 페이징 처리와, 검색 기능을 이용해 보다 편리하게 정보를 조회할 수 있다.

  - 회원 관리 섹션에서는 가입된 회원 정보들을 나열하며, 회원의 아이디를 눌러 해당하는 회원 정보를 수정 가능하다.

  - 수강 관리 섹션에서는 학생들이 신청한 수강 내역들을 조회 가능하며, 수강상태의 체크를 해제하면 강의를 들을 수 없다. 


## 🥕 WBS
![WBS](https://github.com/skd9712/LearnAndRun/assets/59557044/fe1f8360-7fb5-4818-a559-2487ae74517d)

## 🥕 ERD
![ERD수정](https://github.com/skd9712/LearnAndRun/assets/59557044/8e46c97a-9e6a-48fb-85b6-69c6b8245aa1)

## 🥕 유스케이스 다이어그램
![유스케이스](https://github.com/skd9712/LearnAndRun/assets/59557044/ca236b8e-64ae-4cb0-943b-5664f1345cbe)

## 🥕 클래스 다이어그램
![클래스1](https://github.com/skd9712/LearnAndRun/assets/59557044/2b8a2196-f4cd-4bfe-a106-4b047ba34950)
![클래스2](https://github.com/skd9712/LearnAndRun/assets/59557044/9088437b-8b5c-4edd-a403-ee163388dec1)
![클래스3](https://github.com/skd9712/LearnAndRun/assets/59557044/0d6aa81d-2c1c-4da1-b01a-60ce84cd2c73)
![클래스4](https://github.com/skd9712/LearnAndRun/assets/59557044/13003f4a-e90b-4344-b12f-824f444cdb06)

## 🥕 시퀀스 다이어그램

### 회원가입
![시퀀스_가입](https://github.com/skd9712/LearnAndRun/assets/59557044/051ce661-7587-4cf8-a88b-97e8e18a5874)

### 강의 등록
![시퀀스_등록](https://github.com/skd9712/LearnAndRun/assets/59557044/2847b97a-5e4e-4808-9c7e-53065358cea1)

### 결제시스템
![시퀀스_결제](https://github.com/skd9712/LearnAndRun/assets/59557044/972cce0c-d3e8-4e49-a0a0-c75c27696920)

## 🥕 스토리보드
![스토리보드1](https://github.com/skd9712/LearnAndRun/assets/59557044/c0302904-f1fe-4978-acca-bb927412308a)
![스토리보드2](https://github.com/skd9712/LearnAndRun/assets/59557044/807784ed-1a32-4010-82b5-4f81f09c223e)
![스토리보드3](https://github.com/skd9712/LearnAndRun/assets/59557044/8388c027-3765-4b41-9f22-b07e8c62a644)
![스토리보드4](https://github.com/skd9712/LearnAndRun/assets/59557044/b3a344b9-eda7-423f-89ff-c4e094c96ad8)
![스토리보드5](https://github.com/skd9712/LearnAndRun/assets/59557044/0f3168f7-2dee-4e1f-a68b-4568f7ab748f)
![스토리보드6](https://github.com/skd9712/LearnAndRun/assets/59557044/4ab037e4-5c01-4736-8fa7-03dd4b21da99)
![스토리보드7](https://github.com/skd9712/LearnAndRun/assets/59557044/623edd61-9bf0-43d7-907c-030f61ea6857)
![스토리보드8](https://github.com/skd9712/LearnAndRun/assets/59557044/bc7c358a-2ed9-4999-8c32-7540aaa81e73)
![스토리보드9](https://github.com/skd9712/LearnAndRun/assets/59557044/a4ce3c04-2406-45bf-8930-dda268c53aeb)
![스토리보드10](https://github.com/skd9712/LearnAndRun/assets/59557044/577f97e3-aba4-430b-ae43-ae0976c00e8b)
![스토리보드11](https://github.com/skd9712/LearnAndRun/assets/59557044/4c7c748d-5cca-4ee5-a639-1ade9694c663)
![스토리보드12](https://github.com/skd9712/LearnAndRun/assets/59557044/b9326d1e-e894-4df3-a101-a00e94822b59)

## 🥕 시연영상
[![Watch the video](http://img.youtube.com/vi/rkmx_l5Oku0/0.jpg)](https://www.youtube.com/watch?v=rkmx_l5Oku0)

