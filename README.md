---

---

<h3>롬복 적용<h3>
<a>yunyoung1819.tistory.com/95</a>


<h3>Redis 도커 실행<h3>
<p>docker run -p 6379:6379 --name redis_boot -d redis</p>
<p>docker exec -i -t redis_boot redis-cli</p>



***
# SEE 장
<img src="/frontend/cart/src/assets/cart.gif" width="40%" height="30%" title="see장 로고" alt="see장로고"></img>

## Our Team
* 팀장 강민창([@minchang0116](https://github.com/minchang0116 "github link"))

* 팀원 강유정([@yujeong0](https://github.com/yujeong0 "github link"))

* 팀원 곽충섭([@NICEGINI](https://github.com/NICEGINI "github link"))

* 팀원 김유리([@Yu-ri-62](https://github.com/Yu-ri-62 "github link"))

* 팀원 정준영([@dkwjdi](https://github.com/dkwjdi "github link"))

* 팀원 지서연(@언니계정명을몰라..)


## 🚪프로젝트 개요
### 🛠개발기간
* #### 2021.01~2021.02.19

* 기획의도


>장을 볼 때 불편했던 경험 있으신가요?<br>사람들은 종종 오프라인에서 장을 볼 때 온라인에서 사는게 더 쌀지, 지금 사는게 더 쌀지 고민하며 핸드폰으로 쿠팡이나 네이버 앱을 켜서 상품명을 검색하고 가격을 비교해보곤 합니다.<br>혹시 이런 불편을 해소할 수 있는 장보기 앱이 시중에 나와있는지 조사해보았지만 대부분 장보기 목록을 작성하는 것이 끝이었습니다.<br><br>**그래서 저희는 오프라인에서 장을 볼 때 좀 더 편하고, 좀 더 스마트하게 장을 볼 수 있도록 도와주는 앱을 개발하기로 했습니다.**<br><br>앱 기획을 하던 중 앞이 잘 보이지 않거나 아예 보이지 않는 시각 장애인들은 어떻게 장을 볼까 궁금해서 찾아보았는데<br>그들의 장보기는 여전히 다른 사람의 도움 없이는 보기 힘든 환경이라는 것을 알게 되었습니다. <br><br>기술이 모두를 고려하지 않으면 차별의 도구가 될 수도 있지 않을까요?<br>그래서 결정했습니다.<br>비장애인 뿐만 아니라 시각 장애인의 장보기도 도와주는 앱을 만들기로.<br><br>그래서 저희 앱의 이름인 see 장은 <br><br>**장을 본다는 의미와 앞이 잘 보이지 않는 시각 장애인들도 앞을 보는 것처럼 장을 볼 수 있다는 의미가 담겨 있습니다.**



# :star:주요기능

### 시각장애인

* 상품 위치 찾기
* 상품 확인하기

### 비장애인

* 이번주 인기상품
* 쇼핑리스트
* 상품찾기
* 통합검색
* 최저가 찜목록




# 📜Tech Log
<details>
<summary>2021.02.01</summary>

- 깃, 지라 이관 완료<br>
- 현재까지 진행상황 및 앞으로 할 기능 명세 의견 획일화<br>
- 업무 다시 분장<br>
    - 깃 readme<br>
        - [https://github.com/scl2589/Cobook](https://github.com/scl2589/Cobook) (코북 readme 참고)<br>
    - jira 관리 ( 개인 이슈는 알아서, 잘 관리되고 있는지 체크 )<br>
    - 회의록 (스크럼 및 회의 내용 작성)<br>
    - ppt작성<br>
    - ucc담당<br>
- 피드백 파일 확인하기<br>
</details>
<br>
<details>
<summary>2021.02.02</summary>

** 오늘 할 일 **

Front : HTTP + AXIOS 통신 할 때 헤더에 { withCredentials: true }  추가해서 보내주기<br>

- 쿠키 정보를 자동으로 포함해서 보내겠다는 의미!<br>

Back : 잊지말고 CORS 정보 디테일하게 적고, Credentials Allow 해주기<br>

백엔드 배포도..<br>

**민창**<br>

- 쇼핑리스트 컨트롤러 수정<br>
- 로그인 연동 ← 이거 왜 아직있어? (충섭) 번개조 대기중 (민창) 대단하다!민창!(충섭)<br>
- 로그아웃 처리<br>
- db 덤프 만들기<br>
- 리뷰 다 돌아가는 지 확인하기<br>
- AWS 클라우드 서버 실행해보기<br>
- docker 배포<br>
- 젠킨스????<br>

**유정**

- wishList 컨트롤러 수정<br>
- wishList 디비 수정<br>
- 최저가 크롤링 사이트이름 넣기 수정<br>
- image 컨트롤러 모드별로 바꾸기<br>
- db 덤프 만들기<br>
- 인기상품 db 만들기<br>
- 정준영한테 말해야할 것 : 이미지 컨트롤러 경로랑 이름바꿈, 매개변수 file → request로 바꿈
- read.me

**충섭**

- ~~세션을 이용해서 헤더 유지하기~~
- ~~로그아웃 확인하기~~
- ~~모드 변경 페이지 넣기~~
- ~~localStorage에 isBlind 생성~~
    - **0, null → 로그우앗, 처음 사용자**
    - **1 → 시각장애인**
    - **2 → 비장애인**
- ~~모드변경 추가~~
- **헤더 왜 안없어지냐 진짜 !!!!!!!!!!!!!!!!!!!!**
- **쇼핑리스트 UI 드디어 만지기!!!**

**유리**

- ~~기능명세 수정~~
- 프론트앤드 배포

**서연**

**준영**

- 시각장애인 카메라 페이지 vuex로 만들기
- 시각장애인 카메라 페이지 모드마다 다른거 하게 바꾸기
- 시각장애인 카메라 페이지 백엔드에서 값 받아서 음성출력하기
- 시각장애인 카메라 페이지 음성인식으로 상품찾기

로컬스토리지에서 isBlind를 통해 시각장애인 모드인지 아닌지 확인함.

그리고 카메라를 통해 이미지 넘길 때 

1: 일반인

2:시각장애인 위치찾기

3:시각장애인 상품확인하기

숫자를 매개변수로 해서 넘겨줌 

## 이슈

**로그인부분**

@CrossOrigin(origins = { "[http://localhost:8080](http://localhost:8080/)" }, allowCredentials = "true"

origins = "*"로 해도 로그인되는지 테스트

**음성인식**

음성으로 말을 하고 종료하는 시점을 어떻게 하나???

## 오후 종례 미팅

---

### 중간점검
</details>

<br>
<br>

# ⚙Tech Stack
* vue.js
* spring boot
* MySQL
* Docker - redis
* tensorflow

