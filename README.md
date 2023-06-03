# [팀프로젝트] 맛.JAVA - 맛.ZIP
#### 💡 맛.ZIP은 “진짜 믿고 먹을 수 있는 맛집” 을 공유하는 플랫폼입니다.
* 맛.JAVA 팀은 맛집 탐방에 누구보다 진심인 사람들이 뭉친 팀입니다. 🍔
* 평소에 모두가 겪고 있던 부정한 광고, 믿을 수 없는 후기 속에서 소비자들이 믿고 방문할 수 있는 맛집을 모아 볼 수 있는 사이트의 필요성을 느꼈습니다.
* 그래서, 영수증 2회 이상 인증된 맛집만 등록되도록 해서 신뢰도 및 만족도가 높은 맛집만 선별하여 소비자에게 제공하는 목적으로 개발을 진행했습니다.
* 국내 운영 중인 맛집 추천 사이트, 대형 포털 지도 사이트의 사례 분석을 통해, 웹사이트 기능의 방향성을 "진정성 있는 맛집 공유"로 초점을 맞췄습니다.
* 맛집을 좋아하는 사람들 뿐만 아니라, 맛집을 좋아하는 사람들의 방문을 원하는 요식업계 사장님들도 타켓팅한 사장님 전용 구독 서비스 및 노출 배너 광고를 BM으로 설정했습니다.

<br>

## 1. 제작 기간
#### `2023년 4월 28일 ~ 6월 9일 (1개월)`

<br>

## 2. 사용 기술
### `Back-end`
* Java 8
* Spring Framework 5.0.1, Spring MVC
* Junit5
* Maven
* Mybatis
* Eclipse, Visual Studio Code

### `Front-end`
* HTML
* CSS
* JavaScript
* JQuery 3.6.4
* BootStrap 4.1

### `DevOps`
* AWS EC2, S3, RDS, CloudFront, Route 53, ALB
* Tomcat 8.5
* MySQL 8.0.32

### `Collaboration`
* Git, Sourcetree 
* Slack 
* Notion

### `External API`
* Naver OCR
* Naver, Kakao Social Login
* CLOVA Chatbot API
* Naver SENS API
* Naver AI Sentiment
* Toss Payments API
* Google chart API
* Kakao Map 
* Geo Location


<br>

## 3. 기능 구현
* #### `회원가입, 로그인, 마이페이지, AI챗봇`
- #### 회원가입
  - 이메일 인증을 통해 회원가입 진행 (비동기 처리)
  - 제약조건 어노테이션을 활용해 유효성 검사
- #### 로그인 / 임시 비밀번호 발급
  - 일반 로그인: 회원가입한 이메일과 비밀번호를 통해 로그인
  - 간편 로그인: 네이버, 카카오를 통해 로그인
  - 회원가입한 아이디를 통해 임시 비밀번호 발급 (동기 처리)
- #### 회원 정보 확인, 수정, 탈퇴 / 리뷰 작성 목록 / 포인트 내역 확인 가능한 `마이페이지`
- #### 웹소켓 + CLOVA Chatbot API를 활용한 `챗봇`
  * 작성된 시나리오의 흐름대로 진행

* #### `영수증 등록, 검색기능`
  * 영수증, 카드내역을 통한 또 갔던 맛집 등록기능 
  * 2회 이상 등록된 맛집 검색기능 

* #### `음식점 상세페이지`
  * 음식점 상세정보 CRUD 기능 및 카테고리별 음식점 검색 기능
  * 상세페이지 URL 복사(for 공유하기)
  * 네이버 포털사이트 이동하여 해당 음식점 검색
  * 카카오 API 사용 ► 해당 음식점의 주소를 받아서 지도 띄우기 + 해당 음식점의 위치를 기반으로 카테고리별 장소 검색

* #### `회원 커뮤니티`
  * 맛집에 관심이 있는 소비자가 이용하는 커뮤니티로, 리뷰 / 사진 / 지유게시판으로 나누어 유저 용도에 따라 세부 메뉴 분류
  * 각 게시판별 게시물 CRUD 기능 및 댓글 insert 기능
  * 리뷰게시판은 영수증 등록 여부를 체크하여 영수증 등록을 한 유저만 리뷰를 남길 수 있도록 제약사항을 추가하여 리뷰의 신뢰도를 강화함.

* #### `사장 커뮤니티`
  * 구독 결제 시 사장회원등록, 결제내역 DB 저장 - 결제 실패 시, 트랜잭션 처리를 통해 과정을 취소
  * 결제내역 DB를 기반으로 데이터 선별하여 매출차트 및 재방문 차트 구현
  * 리뷰 AI 감정분석 차트 - 사용자들이 작성한 리뷰 데이터를 기반으로 AI 감정분석 API를 사용하여 감정분석 결과를 출력, 이를 통해 긍정 점수가 높은 리뷰 top5와 부정 점수가 높은 리뷰 top5를 사용자에게 제공.
  * 자유게시판 및 좋아요 기능- 게시글 수정, 삭제 시에 글 정보를 자동으로 불러와 사용자 경험을 높였고, 게시글 검색 기능을 통해 제목과 내용에 포함된 키워드를 가진 게시글을 찾을 수 있게 함. 또한 좋아요 기능을 통해 사용자가 게시글에 좋아요를 표시할 수 있게 만듬.

* #### `포인트 시스템`
  * 영수증 등록 시 포인트 적립
  * 적립된 포인트를 사용해서 상품교환(기프티콘) SENS API 사용해서 문자로 전송

* #### `캘린더`
  * 방문 예정인 맛집 일정을 등록하고, 확인할 수 있는 캘린더 기능을 구현함.

<br>

<!-- ## 4. ERD 설계
<img src="https://user-images.githubusercontent.com/123634960/242927505-6d8c1885-fd63-41a2-84c7-c521fcce39e7.png"  width="850" height="490">


<br> -->

## 5. 핵심 기능 설명 & 트러블 슈팅

#### 1. 이메일 인증, 간편 로그인, 챗봇 
<details>
  <summary>📌 핵심 기능 설명</summary>
  
  * 핵심 기능: `이메일 인증`, `간편 로그인`, `챗봇`
  ##### `1. Gmail SMTP를 활용한 이메일 인증 (비동기 처리)`
  * Gmail 설정에 IMAP 액세스 상태를 사용으로 수정 후 앱 비밀번호 생성
  * root-context에 이메일과 비밀번호, SSLSocketFactory 저장하여 빈 등록
  * 서비스에 랜덤으로 6자리 인증번호 생성 메소드 정의하여 선언한 변수에 저장
  * 이메일 폼 작성 메소드에서 폼 작성하여 전송 메소드 호출하여 메일 전송 후 인증번호 리턴
  * 이메일 전송 메소드에 작성 폼을 받고, 메시지를 생성하여 입력된 이메일로 전송
  * **!!결과!!** 이메일 인증 버튼 클릭 시 인증번호가 담긴 메일 전송!
  * [👉이미지로 전체 흐름 확인하기] ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/9ec3953e-49d4-4296-8884-4c1a01adec49)
  * **활용** UUID를 생성하여 Low time 부분만 변수 선언 후 임시 비밀번호로 update하여 메일 전송
  * [👉이미지로 전체 흐름 확인하기] ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/2fca5772-0e26-4c70-a188-240670c26717)

  
  ##### `2. OAuth 2.0 프로토콜 기반 사용자 인증 후 간편 로그인`
  * 로그인 API 사용시 필요한 값(클라이언트 아이디, 시크릿 키, 콜백 URI, 세션 상태, 프로필 URL)을 변수 선언
  * BO에 1. 토큰 메소드, 2. 인증 URL 생성 메소드 정의, 3. 세션에 선언한 상태값을 넣는 getter, setter 정의
    * 토큰 생성 시에 코드 정보를 받아 토큰으로 발급
  * 컨트롤러에서 콜백 경로로 맵핑 후 버튼 클릭 시 호출되는 메서드 생성
  * 토큰 발급 메서드 호출 후 저장된 토큰값을 가지고 유저의 정보 획득 
  * json으로 넘어온 값을 파싱하여 필요한 값을 dto에 저장
  * **!!결과!!** 회원 조회 후 없으면 자동 회원가입 진행, 있으면 세션에 아이디 저장 후 콜백 url로 리턴
    * 카카오 로그인은 전화번호를 받을 수 없어 마이페이지로 포워딩하여 정보 수정 받도록 진행
  * [👉이미지로 전체 흐름 확인하기] ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/96bd4fc5-7253-48fe-a244-84ef74f00961)

  
  ##### `3. 웹소켓과 CLOVA API를 활용한 웹소켓`
  * TextWebSocketHandler를 상속하는 챗봇 핸들러를 작성
  * 핸들러에 1. 웹소켓 연결 후, 2. 클라이언트의 텍스트 받아올때, 3. 연결 해제 후 이렇게 3가지 상황의 메소드 정의
  * 핸들러를 servlet-context.xml에 빈 등록, 웹소켓 핸들러로 설정하고 웹소켓 연결 경로 지정 
  * javascript에서 정한 uri로 웹소켓 객체 생성하고 성공하면 웰컴 메시지 전달
  * 유저가 버튼 클릭하여 버튼의 메시지를 발신하면 메시지에 맞는 내용 수신
  * javascript로 수신한 메시지 json을 파싱하여 description의 부분이 유저에게 보일 수 있도록 메소드 정의
  * 유저가 메인이 아닌 다른 페이지로 이동할 경우 연결 해제
  * **결과!!** 클로바 챗봇 API에 작성한 시나리오 흐름에 따라 FAQ 진행
  * [👉이미지로 전체 흐름 확인하기] ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/28a77727-e1b5-4f1f-a267-bf5f4becc4b7)
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

  * `메시지 리턴 과정`, `간편 로그인 정보 저장`, `챗봇`에 관한 트러블 슈팅

  ### `1. 유효성 검사를 진행하며 지정한 메시지가 리턴되지 않음`
  #### ❓ 문제가 뭐지? - 문제 정의
  * 유효성 검사를 진행하여 에러가 발생했는데 에러 메시지가 아닌 null 값 출력
  * 404, 500 등 클라이언트, 서버의 오류는 없었고 이클립스 콘솔에 뜨는 에러도 없었음
  
  #### ❓ 왜 이런 문제가 발생하지? - 원인 추론
  1. request에 저장해서 view에 불렀는데, request의 저장된 값의 변수명이 다른가?
  2. 내가 리턴하는 방식에 문제가 있나?
  
  #### 이렇게 하면 해결되려나? - 시도
    1. request에서 get하는 키의 변수명 문제 ❌ 
       에러가 있을 시에 서비스에서 key=value 형태로 에러를 저장하는데, 저장한 map을 출력하여 테스트
       key에 내가 포맷한 이름 형태와 value에 내가 쓴 에러 메시지가 출력
       모델에 넣어서 전달하는 값도 동일하게 출력
       => key의 값을 알request에서 get하는 변수명은 문제가 아니다!
    
  #### 💡 이렇게 해서 해결! - 해결 방법 & 결과
    2. 리턴하는 방식의 문제 ⭕️ -> 리턴 방식 변경
       문제가 발생했을때의 나는 모델, 즉 request영역에 값을 저장하고 
       리턴 값에 정한 경로에 리다이렉트를 사용하여 로그인 페이지로 넘김
       리다이렉트는 request와 response 객체가 새롭게 생성되는데, 그걸 모르는 상태에서 사용
  
  * 원래 코드 -> 수정 코드
  * `return redirect:/mz_member/login` -> `return /mz_member/login`
  
  #### 📖 그래서 이런 지식을 얻었다! - 알게 된 점
  **리다이렉트 VS 포워딩**
  
  #### 리다이렉트 
  * `URL을 다시 가리킨다`라는 뜻으로, 
  * 클라이언트가 서버에 요청한 URL을 받고 서버에서 해당 요청이 이동되었음을 확인한 경우
  * 이동된 url로 재접속을 응답하여 클라이언트가 이동된 url에 재접속하여 다시 url 요청
  * url 확인 후 코드와 body에 html을 응답
  * 여기서 **리다이렉트 응답은 3xx** / 정상 응답은 2xx으로 코드 응답
  * **리다이렉트**는 재접속을 요청하기 때문에 **request와 response의 값은 더이상 유효하지 않음**
    * 세션 값은 유효함
  
  #### 포워딩
  * `건내주기`라는 뜻으로, 
  * 클리이언트와 통신하여 처리하는 리다이렉트와 달리, 포워딩은 서버 내부에서만 처리
  * 클라이언트가 서버에 url을 요청하면 서버에서 내부 처리를 하고 2xx 코드와 함께 응답
  * 그래서 클라이언트는 실제로 다른 페이지로 이동했는지 알 수 없음
  * **포워딩**은 요청정보가 다음 url에서도 유효하기에 **request와 response 객체를 공유**
    
  ***

  ### `2. 네이버 로그인 중 승인 토큰을 얻지 못하고 null 리턴`
  #### ❓ 문제가 뭐지? - 문제 정의
  * BO의 승인 토큰을 얻는 과정에서 세션 검증용 값과 세션에 저장된 값이 동일하지 않아 null값을 리턴
  * 승인 토큰을 얻지 못해서 로그인이 실행되지 않고 500 상태의 오류 발생
  
  #### ❓ 왜 이런 문제가 발생하지? - 원인 추론 
  1. 세션에 값을 정하는 setter에서 잘못된 값을 저장하나?
    
  #### 💡 이렇게 해서 해결! - 해결 방법 & 결과
    1. 세션 setter 부분의 문제 ⭕️ -> setter에 들어가는 값을 수정
       세션 setter의 값을 출력해보니, 세션에 세션 상태에 고유 식별자 ID를 저장했어야 하는데
       코드를 잘못 보고 그냥 받아온 세션 값을 지정함 
       => setter부터 잘못되었으니, 잘못된 값을 get해서 승인 토큰 발급 도중 값이 동일하지 않아 null을 리턴했고, 순차적으로 null값이 넘어간 것
  
  * 원래 코드 -> 수정 코드
  * `session.setAttribute(SESSION_STATE, session)` -> `session.setAttribute(SESSION_STATE, state)`
    * SESSION_STATE는 지정된 값을 저장해놨던 값 변수명
  
  #### 📖 그래서 이런 습관을 얻었다! - 태도
  **당황하지 않고 실행 순서의 코드를 되집어보는 습관!**
   * 처음 의심갔던 컨트롤러의 승인 토큰 받는 부분을 출력해 보고 콘솔을 확인하니 null값이 발생
   * 어디서부터 잘못된 것인지 코드의 실행 순서를 반대로 올라가보니, 경로 비교하는 if문에서 null을 리턴하는 것을 파악
   * 이렇게 코드를 실행 순서의 반대로 올라가니 생각보다 빨리 해결할 수 있었음
   * 이 경험을 통해서 **코드의 실행 순서를 명확히 아는 것**이 얼마나 중요한지 알게 됨!
   
  ***
  
  ### `3. 웹소켓 연결 도중 404 에러가 발생하여 연결 실패`
  #### ❓ 문제가 뭐지? - 문제 정의
  * 웹소켓 연결에 지정한 경로 값을 찾지 못해서 계속 연결 실패
  
  #### ❓ 왜 이런 문제가 발생하지? - 원인 추론
  1. handler의 endpoint로 지정한 경로의 문제인가?
  2. 컨트롤러의 매핑 값의 문제인가? 
  3. 전송된 데이터 자체를 인식 못해 생기는 문제인가?
    * 이 부분은 개발자 도구를 이용해 어디서 에러가 나는지 확인해 보니 abstract-xhr.js 파일에서 payload 인식을 못하는 것을 파악
  
  #### 이렇게 하면 해결되려나? - 시도
    1. endpoint로 지정한 경로의 문제 ❌ 
       웹소켓과 연결하는 클래스 파일의 endpoint와 웹소켓 객체 생성하는 메소드의 경로를 출력해서 확인해보니
       둘이 동일한 값이 나왔기에 그 부분의 문제는 아니었음.
       jstl로 상대 경로를 인식하지 못하는 건가 싶어서 절대 경로로 바꿔도 실패
       setAllowedOrigin 부분을 *로 지정해서 모든 값이 되도록 핸들링했는데, 이것도 실패
       => endpoint로 지정한 값과 웹소켓 객체 생성하는 경로가 달라 생기는 문제가 아니다!
  
    2. 매핑한 값의 문제 ❌ 
       매핑 이름이 다르면 항상 이클립스 콘솔에 매핑을 찾을 수 없다는 에러가 뜨기에 아니라는 생각은 가지고 있었음
       그래도 값을 변경하여 실행해보았으나 결과는 똑같이 연결 실패
       일부러 매핑 값을 다르게 지정해 봤는데, 
       이때는 콘솔에 매핑한 것을 찾을 수 없다는 에러 발생하여 매핑 문제는 아니란 것을 확신
       => 매핑 값이 달라 생기는 문제가 아니다!
  
  #### 💡 이렇게 해서 해결! - 해결 방법 & 결과
    1. 데이터 자체를 인식 못함 ⭕️ -> 프로젝트를 새로 만들어 실행 
    개발자 도구를 통해 에러가 나는 부분을 확인하고 이 부분 해결을 위해 정보 검색
    1-1. 첫번째 시도는 에러나는 부분을 주석 처리하고 실행
         다른 사람의 경우, 같은 에러를 봤을때 주석 처리하고 실행하면 에러 없이 된다는 글을 발견
         나도 같은 부분을 주석 처리 후 실행 -> 에러는 없었다
         그러나! 연결 자체가 안 되었음. 연결된다면 connect가 콘솔에 찍히도록 코드를 작성했지만,
         콘솔에 찍히지 않고 연결되지도 않아서 이건 정확한 해결 방법이 아니라고 파악
     1-2. 💡 새로운 프로젝트를 만들어서 웹소켓 연결 테스트를 진행하니 해결! 
         => 알아본 결과 sockjs-node에서 에러가 났는데, 이것은 서버 자체의 문제
  
  #### 📖 그래서 이런 지식, 습관을 얻었다! - 알게된 점, 태도
  * 개발 중 네트워크 환경 변경으로 서버가 액세스 소스 확인 못한 것
  * sockjs-node와 sockjs-client에서 넘어오는 값을 확인하면 어디의 오류인지 알 수 있다!
    * sockjs-node는 서버의 오류 / sockjs-client는 클라이언트의 오류
  * **너무 오래 잡고 있어도 득이 되지 않고**, 정말 모르겠다면 새로운 프로젝트를 파서 해결해보는 것도 하나의 방법임을 깨달았다
  
  ***
  
  ### `4. 챗봇 연결 후 웰컴 메시지의 버튼 클릭 후 에러 발생하여 연결 해제`
  #### ❓ 문제가 뭐지? - 문제 정의
  * 웹소켓 연결과 챗봇 API의 시나리오대로 웰컴메시지는 뜨지만, 그 후에 버튼을 누르면 에러가 발생해 웹소켓이 자동으로 연결 해제
  
  #### ❓ 왜 이런 문제가 발생하지? - 원인 추론
  1. javascript 부분에 내가 close를 잘못 호출했나?
  2. API url을 요청했을 때 응답하는 코드가 200이 아닌가?
  3. 핸들러의 sendMessage 부분에 넘어오는 값이 없나?
  
  #### 이렇게 하면 해결되려나? - 시도
    1. javascript에 잘못된 메소드 호출 문제 ❌
       동기 처리 시(페이지가 이동될 때)에 close 메소드가 호출되는 코드말고는 close 메소드를 호출하지 않음
       혹시나 해서 close 메소드 호출 부분 위에 실행 전 콘솔에 찍히도록 했는데, 콘솔에 찍힌 것이 없었음!
       => 자바스크립트 부분에서는 문제가 없었다!
  
    2. API url 호출 시 응답하는 코드 문제 ❌
       API의 시크릿키가 문제인가 싶어 재발급 받고 변수 선언, 이 부분은 문제가 아니었음
       API url을 연결했을때 응답받는 코드를 출력해보니 200 정상 호출되었음
       => API 게이트웨이의 url과 시크릿 키에는 문제가 없었고, 호출 시 응답하는 코드도 문제 없었다!
    
  #### 💡 이렇게 해서 해결! - 해결 방법 & 결과
    3. 핸들러의 send 메소드 호출 시 넘어오는 값이 없나? ⭕️ -> 핸들러에서 잘못된 임포트 수정
       내가 만든 클래스를 사용해야 정해진 값이 넘어올 수 있는데, 다른 라이브러리 안에 클래스를 임포트하여
       값이 null로 리턴되고, 그 null값이 그대로 응답한 리퀘스트에도 전달되어 
       보낼 값이 없어 웹소켓이 연결을 끊어버린 것
  
  * 해결 방법: 전달되는 값을 받는 VO에 잘못된 임포트를 삭제
  
  #### 📖 그래서 이런 습관을 얻었다! - 태도
  **임포트 부분도 잘 확인하자**
  * 잘못된 클래스를 임포트한다면 내가 원한 값과 다른 값이 넘어오니 임포트할때 패키지 확인 잘해야 함
  **코드의 실행 순서를 명확히 알고 있는 것은 중요하다**
  * 이번 트러블 슈팅도 코드의 실행 순서를 알고 있어서 빠르게 파악할 수 있었던 문제
  * 코드를 사용할때 무작정 붙여넣고, 공부하지 않는다면 어디서 에러가 발생하는지 찾느라 오랜 시간을 허비함
  * 그렇기 때문에 **코드의 흐름을 명확히 파악하고 사용하는 것이 중요**
  
  ***
  
</details>

<br>

#### 2) 영수증 등록, 맛집 검색
<details>
  <summary>📌 핵심 기능 설명</summary>

  📌 https://docs.google.com/presentation/d/1ctdr4CTAJIyls9e24kb9k101kQK0VD6m/edit?usp=sharing&ouid=104520414346845957015&rtpof=true&sd=true  
  📌 위 링크엔 핵심 기능의 상세한 설명과 근거, 서버 아키텍쳐 구성, 트러블 슈팅에 대한 설명이 준비 되어있습니다. 
<br>
<br>
  🔜 개선사항 : **DataValidationService에 있는 서비스 각각의 케이스들을 분리하여 절차지향적으로 테스트코드를 작성하고, 리팩토링을 할 수 있게 대비할 예정입니다.**

  ##### `1. OCR을 활용한 영수증 등록`
  * 1. 먼저 유저는 업로드할 영수증 파일을 준비합니다. then Drag and Drop 을 사용하여 영수증을 Submit 합니다.
  * 2. FileUploadService 레이어에서 업로드 된 영수증은 AWS S3에 저장되고 bytes data로 OCR API를 호출합니다. 
  * 3. OCRService 레이어에서 추출된 데이터의 주소(지번, 도로명), 전화번호, 결제일시를 
  * 4. MZRegularExpression 에서 직접 구현한 자바 정규식으로 처리후 일반화(통일화) 과정을 거칩니다.
  * 5. 일관성을 가진 추출데이터는 List에 저장되어 validation test를 수행할 것입니다.
  * 6. DataValidationService 레이어에서 등록이 첫 번째 인지 두 번째 인지 혹은 DB에 저장되어도 되는 데이터인지 검사후 DB로 들어갑니다.
  * 7. RestAPI 방식으로 Front에 리턴하여 각각의 결과에 맞는 값을 가지고 마커를 등록할지 혹은 경고메시지를 보낼지 결정합니다.
  * **‼결과‼** 영수증 등록 시 2번 등록에 성공하면 최초 등록자 기준 마커가 지도에 등록됩니다..

  ##### `2. 검색 기능`
  * 유저가 검색할 수 있는 경우의 수는 3가지 입니다. 
  * 정확한 상호명 검색
  * 상호명에 포함된 부분 키워드로 다중 검색	
  * 음식 카테고리로 다중 검색 
  * -자동완성기능을 추가하여 각각의 경우의수에 추가로 부분 키워드를 내포하는 키워드를 자동완성 해줍니다.
  * 지도 새로 고침 기능을 추가하였습니다. 
  * 서버쪽으로 보내는 요청은 모든 키워드에서 영수증이 등록된 식당의 데이터를 가져오게 하는 것입니다. 
  * 한 글자씩 쳐도 계속해서 쿼리를 수행하여 느린 전송 결과를 받는 상황이었지만 
  * 캐시 역할을 하는 List를 서버쪽에 구현하여 가져온 결과가 있으면 Response 하지 않도록 구현하였습니다. (실제 캐시는 구현하지 않았습니다)
  * 결과 검색버튼을 누를시 마커를 등록하고 마커에 이름과 상세페이지로 넘어갈 수 있는 A태그를 구현하였습니다.
  * A태그는 검색 결과중 주소를 가지고 검색하고 따라서 상세페이지를 각각 보여줄 수 있게 됩니다. 
  * 이후 개선방안으로는 가게의 고유 아이디만을 이용해 상세페이지를 가져올 수 있도록 수정하는 것입니다. 

  * **‼결과‼** 검색결과를 가지고 마커를 찍어주며 상세페이지로 이동할 수 있게됩니다.
	
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 자동완성 캐시 기능`
	
<details>
	
  <summary>👉문제 및 해결방안 , 결과 확인</summary>
	
 * 문제 : 검색어 자동완성 기능으로 검색을 하게되면 매 자음 모음마다 DB에서 불러와 매 호출마다 많은양의 데이터를 가져왔습니다. 따라서 데이터가 많아지면 호출이 늦어지는 문제 발생 5~6초씩 자동완성에 소요되는 시간이 길었습니다.
 * 해결 방안 : 따라서 캐시처럼 동작하는 리스트를 만들어 가져온게 있다면 쿼리를 response 하지 않게 만들었습니다. 
 * 결과 : 5~6초씩 걸리던 자동완성이 0.1초도 안되어 계속 캐시처럼 남아있게 응답 시간 개선 

![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/2fc4fae5-d284-4505-8dc1-fcadfa9b6814)

	
</details>

  ##### `2. 여러개의 마커가 각각의 인포윈도우로 인식 안되는 문제 `
	
<details>
	
  <summary>👉문제 및 해결방안 , 결과 확인</summary>
	
![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/a1bd24a2-d75b-469f-94fb-ff25b342b101)

![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/3ef8ff71-f5ca-457d-82c2-ae6871d4d6dd)
	
  * 문제 : 위 사진1 에서 나온 값들이 , 사진2 에 한 주소로만 계속 동시에 찍히는 문제 발생, 
  * 원인 : 

	![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/cc673ed4-f133-4bea-b811-17c6815d6336)
	
  * 해결 방안 : 클로저 함수를 이용하여 함수를 호출할 때마다 새로운 독립적인 환경을 생성

  * 설명 : 함수를 호출할 때마다 새로운 독립적인 환경을 생성해야 할 때 클로저를 활용할 수 있습니다.
  * 해당 코드에서는 for문을 통해 생성된 각 마커와 이름을 클로저 함수의 인자로 전달하고 있습니다. 
  * 클로저 함수는 전달받은 마커와 이름을 사용하여 이벤트 리스너를 등록합니다.
  * 각각의 클로저 함수는 자신이 생성될 때의 렉시컬 환경을 기억하고 있기 때문에, 
  * 클로저 함수 내부에서 사용되는 변수(marker, name)는 해당 클로저 함수가 생성될 당시의 값으로 유지됩니다. 
  * 이를 통해 각 마커와 이름이 클로저 함수 내부에서 독립적으로 사용될 수 있게 됩니다. 
  * 따라서 각 마커를 클릭할 때 해당 마커에 연결된 이름이 인포윈도우로 표시됩니다.
  * 이를 통해 각 마커마다 고유한 이름을 표시할 수 있으며, 클로저를 사용하여 함수 외부에서 해당 이름에 접근할 수 있도록 구현하였습니다.
	
  <div markdown="1">    
	  
  ```java
	'''
		function addMarker(name,position) {
			            // 마커를 생성합니다
			            var marker = new kakao.maps.Marker({
			                position: position,
			                clickable: true
			            });
			            // 마커가 지도 위에 표시되도록 설정합니다
			            marker.setMap(map);
			            var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/link/to/Hello World!,'+ marker.getPosition().getLat()+','+ marker.getPosition().getLng()+'" style="color:blue" target="_blank">길찾기</a>'+name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			        	// 인포윈도우를 생성합니다
			        	var infowindow = new kakao.maps.InfoWindow({
			           	 content : iwContent,
			           	 removable : iwRemoveable
			        	});
			       		 // 마커에 클릭이벤트를 등록합니다
			        	kakao.maps.event.addListener(marker, 'click', function() {
			              // 마커 위에 인포윈도우를 표시합니다
			             	 infowindow.open(map, marker);  
			        	});
			            // 생성된 마커를 배열에 추가합니다
			            markers.push(marker);
			        }
<!-- /////////////////////////////////////////////////////////////////////////////// -->
		
	  	function addMarker(position, name , address) {
	
	                    // 마커를 생성합니다
	                    var marker = new kakao.maps.Marker({
	                        position: position,
	                        clickable: true
	                    });
	
	                    // 마커가 지도 위에 표시되도록 설정합니다
	                    marker.setMap(map);
	
	                    // 클로저를 사용하여 인포윈도우 생성
	                    (function(marker, name) {
	                        // 마커에 클릭 이벤트를 등록합니다
	                        kakao.maps.event.addListener(marker, 'click', function() {
	                            // 이전에 열려있던 인포윈도우가 있으면 닫기
	                            if (openInfowindow) {
	                                openInfowindow.close();
	                            }
	
	                            // 새로운 인포윈도우 생성 및 열기
	                            var infowindow = new kakao.maps.InfoWindow({
						          content: '<div style="width:150px;text-align:center;padding:6px 0;"><span style="color: black;">'+name+'</span><br>'+
						          	'<a href="mainpage/mzonee?landNumAddress='+address+'">가게 정보 보러가기</a></div>',
					              removable: true
	                            });
	                            infowindow.open(map, marker);
	
	                            // 열린 인포윈도우를 저장
	                            openInfowindow = infowindow;
	                        });
	                    })(marker, name);
	                }

  ```
	  
  </div>
</details>	
  

</details>

<br>


<br>

#### 3) 음식점 상세페이지
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. 음식점 상세정보 CRUD 기능`
  * 공공데이터 CSV 찾기 & mzlist테이블에 임의로 맛집으로 선정한 음식점들(약 25곳) 삽입
  * 이미지 저장
	* 공공데이터의 데이터들 중, 임의로 맛집으로 선정한 음식점들(약 25곳)들의 이미지들을 5개씩 저장하여 resources 아래에 이미지 저장 
  * CRUD 기능
	-> 주소 클릭 jsp -> MzlistMapper -> MzlistController -> MzlistDAO -> 상세페이지 jsp파일
	* MzlistMapper
		* mzlist 테이블에서 landNumAddress가 주어진 값과 일치하는 데이터를 조회, resultType으로 지정된 mzlistVO 클래스에 매핑되어 결과를 반환함.
	* MzlistController
		* MzlistController에서 경로 요청이 들어오면, landNumAddress를 사용하여 데이터를 조회하고 Model 객체를 통해서 View와의 상호작용을 통해 View에 데이터를 제공함.
	* MzlistDAO
		* mzlist에서 landNumAddress를 기준으로 데이터를 조회해서 MzlistVO 객체로 반환하는 메서드 사용하여, landNumAddress에 대한 정보를 가져옴.
	
	
  * 이미지 저장 및 출력
	* 공공데이터의 데이터들 중, 임의로 맛집으로 선정한 음식점들(약 25곳)들의 이미지들을 5개씩 저장

	
  * **‼결과‼** 주소를 전달하는 jsp 파일에서 쿼리스트링을 통해 주소를 요청하면 그 주소와 동일한 음식점의 데이터들이 검색되고, 상세페이지 jsp파일에 데이터들이 출력됨.
<!--   * [👉이미지로 전체 흐름 확인하기](null) -->

  ##### `2. 카테고리별 음식점 검색 기능` (위의 음식점 상세정보 CRUD 기능과 유사)
  * CRUD 기능
	-> 주소 클릭 jsp -> MzlistMapper -> MzlistController -> MzlistDAO -> 상세페이지 jsp파일

	
  * **‼결과‼** 카테고리별 음식(한식, 중식, 일식, 분식 등..) 이미지 박스를 클릭하면 해당 음식점 카테고리 페이지로 이동하여 mzlist테이블에 저장되어 있는 해당 카테고리의 음식점들의 상세정보와 이미지들이 출력됨.
<!--   * [👉이미지로 전체 흐름 확인하기](null) -->
	
  ##### `3. 상세페이지 URL 복사(for 공유하기)`
	-> 클립보드에 텍스트를 복사하는 기능
  * 가상의 'texterea' 생성 -> textarea의 값을 복사할 텍스트로 설정 -> textarea를 DOM에 추가 -> textarea 내용을 선택 -> textarea를 DOM에서 제거
	
  * **‼결과‼** URL 복사(공유하기) 버튼을 클릭하면 'URL이 클립보드에 복사되었습니다' 라는 문구의 alert가 뜨며, 'copyToClipboard()' 함수를 호출하여 텍스트를 클립보드로 복사
	
 ##### `4. 네이버 포털사이트 이동하여 해당 음식점 검색`
 	 -> location.href를 사용하여 생성된 URL로 페이지를 이동해서 사용자가 해당 음식점의 'landAddress'와 동일한 주소에 해당하는 네이버지도 URL로 이동할 수 있도록 함.
  * 함수 생성
	* searchOnNaverMaps() -> URL을 생성하고 페이지를 이동하는 역할을 하기 위함.
	* encodeURIComponent() -> name, landAddress, roadAddress를 URL 인코딩하기 위함.
  * 변수 설정
	* 'naverMapsURL' 변수를 생성해서 네이버 지도 URL을 할당
  * location.href를 사용하여 생성된 URL로 페이지 이동
	
  * **‼결과‼** 버튼을 클릭하면 name, landAddress, roadAddress를 인코딩하여 URL에 추가한 후 페이지를 이동   
<!-- 	* [👉이미지로 전체 흐름 확인하기](null) -->
	
 ##### `5. 카카오 API 사용'
 -> 해당 음식점의 주소를 받아서 지도 띄우기 + 해당 음식점의 위치를 기반으로 카테고리별 장소 검색
   * 카카오 API 코드 분석
	
   * **‼결과‼** 상세정보페이지에 해당하는 음식점이 지도 위에 마커로 표시되며, 좌상단의 카테고리별 장소를 클릭하면 장소들이 마커 기준으로 근처에 있는 해당 장소들의 마커가 띄워지고, 마커를 클릭했을 때 카카오맵으로 이동됨.
<!--    * [👉이미지로 전체 흐름 확인하기](null) -->
	
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 일련의 규칙을 가진 이미지 출력 방법`
	** 문제상황: 카테고리별 음식점 검색 기능 구현 중, 각 음식점에 알맞은 이미지들이 출력되어야 하는데 동일한 음식점의 이미지들이 출력
	 -> 여러 이미지들을 DB에 저장하는 방식에 대한 고민 
	 -> **!!이미지를 DB에 저장할 때 일련의 규칙을 정해서 이미지 저장 -> 일련의 규칙대로 이미지들을 분리하는 작업을 통해 해당 음식점들에 이미지 분배!!**
	 -> mzlist테이블 중, 이미지 칼럼의 한 데이터 값에 여러 이미지 경로들을 저장해서, mapper파일을 통해 해당 mzlist테이블의 row를 읽을 때 그 음식점에 해당하는 이미지들이 모두 읽히도록 함.

  * 첫 번째 시도 : 문자열을 특정 구분자를 기준으로 나누어 배열로 반환해주는 split 합수 사용 -> ❌비정상작동 
	
	<details>
	 * 일련의 규칙을 가진 이미지 출력 방법은 여러가지가 될 수 있다. 
	 첫 번째로 시도해 본 방법인 split함수를 사용하는 과정에서 오류가 생겨서 다른 방식을 채택했지만, split함수로도 충분히 구현할 수 있었다는 것을 뒤늦게 깨달았다. 
	split 함수사용할 때의 주의점 중에서 이미지 경로들을 포함한 문자열에 공백이 포함되어 있는 경우, split 함수가 공백도 구분자로 인식하여 분리한다는 특징이 있었고, 이로 인한 오류였다는 것을 깨달았다.
	split 함수에 대한 개념이해가 부족했었고, 함수를 사용할 때 개념과 특징을 잘 파악하고 사용한다면 오류를 잡는 데에 걸리는 시간을 단축할 수 있겠다는 생각을 하게 되었다. 하지만 첫 번째 시도에서 막히는 부분에 대해서 오랜 시간을 붙잡지 않고 또 다른 방법을 떠올려서 코드를 작성했다는 부분에 있어서 의의가 있다.
	  </div>
	
	 ##### `2. Null Point Exception`
	** 문제상황: 메인페이지의 지도 위의 마커를 클릭했을 때 나의 상세페이지로 넘어오도록 구현하는 과정에서, no값이 아닌 landNumAddress를 기준으로 CRUD 기능이 수행되도록 변경하는 과정에서 null-point-exception 발생
	
  * 첫 번째 시도 : no -> landNumAddress로 바꾸는 작업이 mzlistMapper, mzlistController, mzlistDAO에도 모두 알맞게 반영이 되었는지 확인 -> ⭕모두 반영됨!
  * 두 번째 시도 : controller 부분에서 값을 전달받을 때 system.out.println(vo)로 값을 출력해보면서 값이 유실된 지점을 체크 ->  landNumAddress와 model값이 전달될 때 값 전달⭕! dao.one()메서드가 null!!❌값을 반환
  * 세 번째 시도 : dao의 one 메서드가 올바르게 작성이 되었는지 확인 -> ⭕정상작동!
  * 네 번째 시도 : jsp파일에서 landNumAddress 파라미터를 정확하게 전달하고 있는지 확인 -> jsp에서 주소값을 입력하는 형식에 오류 발견 (' '로 인해 landNumAddress을 문자열로 인식)
  * 다섯 번째 시도 : jsp에서 주소값을 입력하는 형식 수정 -> ⭕정상작동!
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	'''
	  //비정상 작동 코드
	 if (${'vo.landNumAddress'} || '${vo.roadNameAddress}') {  
	  geocoder.addressSearch(address, function(result, status) {

	  
	  //정상 작동 코드
	  
	if ('${vo.landNumAddress}' || '${vo.roadNameAddress}') {  
	geocoder.addressSearch(address, function(result, status) {

  ```

</details>
</details>
	
<br>

#### 4) 회원 커뮤니티
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. 유저의 영수증 등록 여부를 체크한 리뷰 작성 기능`
  * 회원 커뮤니티 내 리뷰 게시판은 유저가 리뷰를 작성하고, 다른 사람들의 리뷰에 댓글을 남길 수 있는 구조의 게시판 페이지로 구현.
	* 리뷰에 신뢰도를 높이기 위해, 유저의 영수증 등록 여부 판단이 필요함.
	* 영수증을 다수의 식당에 등록하고 리뷰를 작성할 때, 리뷰를 남기고 싶은 영수증을 선택하는 form으로 먼저 이동이 필요함.
  * 리뷰게시판 (Review...) 게시물 등록 로직을 처리하기 위해 registerAndSearch 패키지 안에 있는 MZRegisterInfoVO 와 RestaurantVO의 사용이 필요함. 두 model 모두 다른 패키지에 있지만, public 메소드로 작성되어있기 때문에 board 패키지에 동일 model을 만들지 않고 MZRegisterReceiptDTO 만 생성하여 mzRegisterInfoVO와 restaurantVO를 사용할 수 있도록 함.
  * ReviewMapper.xml에서 mzregisterinfo 와 restaurant 테이블을 join 해서 영수증 정보와 식당 정보를 추출하는 getReceiptWithRestaurant 쿼리 작성. (mzregisterinfo 테이블의 storePhoneNumber 컬럼 데이터와 restaurant 테이블의 tel 컬럼 데이터가 일치하는 restaurant 테이블의 name 컬럼 데이터를 상호명으로 추출)
  * 영수증 1장으로 리뷰를 다회 작성을 막기 위해 cs_review 테이블에 receipt_id 컬럼 (mzregisterinfo의 no 컬럼 데이터를 가져와서 저장) 데이터를 제외하고 영수증 정보와 식당 정보를 추출.
  * **‼결과‼** writeReview로 이동하면 getReceiptWithRestaurant 쿼리를 수행하여 영수증의 상호명 + 주소 가 radio form으로 브라우저에 출력, 유저가 리뷰를 작성할 영수증을 선택하고 리뷰 작성 form으로 이동하도록 구현. (영수증을 등록하지 않은 유저가 writeReview 으로 이동하면 alert 창을 보여주고 리뷰게시판으로 리다이렉트됨.)
	
  ##### `2. 리뷰 본문에서 특정 키워드 추출하여 이모티콘 조회 기능`
  * 유저가 리뷰를 작성 후 제출하기 전에, 이모티콘 조회 버튼을 클릭하면 식당 방문 시 참고할 수 있는 주요 키워드 (ex. 주차, 맛, 청결, 가성비 등) 를 검색해서 이모티콘을 출력해주는 기능을 리뷰 작성 form 에 추가.
  * 기존에는 네이버 Sentiment API를 활용하려고 했으나, 긍정/부정 파트를 퍼센트로 판단해주는 기능이라 다양한 키워드를 검색 후 출력이 필요한 지금 상황에는 API가 약간 맞지 않다고 판단하여 MySQL에 키워드와 이모티콘을 저장한 emojiMap 테이블을 DB에 생성하여 키워드를 저장하는 작업을 진행. (형태소 분리가 필요하지만 일단 테스트)
  * ReviewMapper.xml 에 추가하는 쿼리문에서는 emojiMap 데이터 전체 SELECT 쿼리 , Service 계층에서 리뷰 본문과 emojiMap 테이블의 keyward 컬럼 데이터를 비교해서 일치하는 emoji 컬럼 데이터를 추출 후 모델에 저장하는 작업을 수행.
  * **‼결과‼** 리뷰 작성 form (insertReview) 에서 리뷰 본문을 모두 입력 하고, 이모티콘 조회 버튼을 클릭하면 ajax로 리뷰 하단 div에 추출된 이모티콘이 출력되는 방식으로 비동기처리 이모티콘 조회 기능을 구현. 
	
  ##### `3. 3개의 세부 게시판별 CRUD 기능`
  * 유저가 상황에 맞게 이용할 수 있도록 게시판의 카테고리를 분할, 각 게시판별 CRUD 기능 추가. 게시물 insert 기능은 회원만 접근 가능하도록 작성 버튼을 user_id 세션이 잡혀있는 경우에만 브라우저에 출력되도록 코드 작성, 네비게이션바를 통해 로그아웃하고 브라우저 뒤로가기로 게시물 작성 페이지에 접근했을 때 alert 창 출력 후 게시물 목록 페이지로 리다이렉트 될 수 있도록 예외처리 진행.
  * 상대적으로 기능이 간단한 자유게시판은 Service 계층을 나누지 않았고, 자유게시판 기능 구현 완료 후 리뷰게시판과 사진게시판은 Service 계층을 나누어 기능 추가.
  * 게시판별 제목 search form 추가하여 특정 키워드를 검색할 시 제목에 해당 키워드가 포함되어 있는 게시물 list를 ajax 비동기처리로 브라우저에 출력.
  * 게시판에 필요한 조회수 증가 / 댓글 작성 기능 각 세부 카테고리 게시판에 추가.
  * 게시물 insert 기능은 회원만 접근이 가능하도록 세션 
  * **‼결과‼** 각 세부 카테고리 게시판의 기본 CRUD, 댓글 insert 기능을 구현 완료. 
	
</details>
	
<details>
  <summary>⚽ 트러블 슈팅</summary>

  ##### `1. 영수증 등록 후 리뷰 작성 시 영수증 list를 출력하지 못하는 문제`
  * 리뷰 등록 시, 먼저 영수증 등록 정보를 writeReview.jsp 로 페이지 이동하여 출력해야되는데, receiptList (영수증의 리스트) 의 모든 요소가 null로 출력되는 문제가 발생함. 디버깅 했더니  receiptList의 size (리뷰할 영수증의 갯수) 는 정상적으로 콘솔창에 출력되고 있음.

<details>
  <summary>👉 문제가 있던 코드확인</summary>
  <div markdown="1">    

  ```java
	<!-- 영수증 등록 정보를 가져오자 -->
	<select id="getReceiptWithRestaurant" parameterType="String" resultType="MZRegisterReceiptDTO">
		SELECT r.*, m.* 
		FROM MAT_ZIP.mzregisterinfo m 
		JOIN MAT_ZIP.restaurant r ON m.storePhoneNumber = r.tel 
		WHERE m.userID = #{user_id} 
		AND m.no NOT IN 
		(SELECT receipt_id FROM MAT_ZIP.cs_review)
    </select>

  ```
  </div>
</details>
	
  * 1️⃣ 첫 번째 시도 : 쿼리 작성에서 오타나 잘못 작성된 부분이 있을 수도 있어서, getReceiptWithRestaurant 쿼리를 그대로 MySQL 스크립트에서 실행함. -> 쿼리에 문제 없음. 정상적으로 mzregisterinfo 테이블과 restaurant 테이블을 join 하고, 더미데이터로 추가해둔 cs_review 테이블의 receipt_id도 정상적으로 제외하여 리뷰를 작성할 데이터만 select 하는 것을 확인.
  * 2️⃣ 두 번째 시도 : MZRegisterReceiptDTO 에 추가한 MZRegisterInfoVO와 RestaurantVO에 쿼리 결과가 매핑되지 못했을 수도 있음. -> ReviewMapper.xml 에 추가한 쿼리 결과의 각 열이 MZRegisterInfoVO와 RestaurantVO의 필드와 일치하는 것을 확인함.
  * 3️⃣ 세 번째 시도 : MZRegisterReceiptDTO 클래스의 toString() 메서드가 MZRegisterInfoVO와 RestaurantVO의 toString() 메서드를 호출하는지 확인 -> MZRegisterReceiptDTO, MZRegisterInfoVO, RestaurantVO 클래스의 toString() 메서드는 딱히 문제 없이 잘 작성되었음을 확인함. 
  * **‼원인‼** SQL 쿼리 결과 매핑 문제임을 확인함.	
	
<br>
	
  * 4️⃣ 네 번째 시도 : 더 정확한 매핑을 위해 MyBatis의 resultMap을 이용해서 SQL 쿼리 결과를 올바르게 MZRegisterReceiptDTO 객체에 매핑 시도
	* 이전 쿼리문에서는 resultType="MZRegisterReceiptDTO" 을 통해 DTO에 매핑을 했지만, MyBatis의 resultMap은 SQL 쿼리 결과를 도메인 모델 또는 DTO 객체에 매핑하는 역할을 한다고 함. 
	* MyBatis의 resultMap은 일반적인 resultType 매핑보다 더 세밀하게 컨트롤 할 수 있는데, 나처럼 쿼리가 DB에서도 잘 작동하도록 작성했는데도 매핑을 하지 못해 에러가 발생할 때는 resultMap으로 세밀하게 매핑을 하는 방법이 있다고 하여 적용해보기로 함.
	 
	<div markdown="1">    
		
  	```java	
	<!-- resultMap 매핑 예시 쿼리 -->
	<resultMap id="yourResultMap" type="com.yourpackage.YourDTO">
	    <result property="propertyOfYourDTO" column="columnOfYourSQLResult"/>
	    <!-- more result mappings... -->
	</resultMap>
  	```
		
  	</div>

	* 나는 항상 resultType으로 도메인 모델 (VO) 에 매핑을 했는데, 이번에 resultMap에 대해서 알게 됨. 보통 resultMap은 이런 구조로 코드를 작성할 수 있음. 여기서 id는 resultMap의 고유 식별자, type은 결과를 매핑할 DTO의 풀 클래스 이름이고, result 요소는 SQL 결과의 열(column)과 DTO의 속성(property)을 매핑함.
	* 단순히 DTO의 속성 이름이 SQL 결과의 열 이름과 정확히 일치하지 않는 경우 또는 복잡한 객체 구조를 가진 DTO에 결과를 매핑해야 하는 경우에 resultMap을 사용하면 유용하다고 함. 난 다소 복잡한 DTO (모델 2개를 합쳐서 DTO를 만들었음) 를 사용하기때문에 후자인 것으로 추정.
	
	<br>
	
  * **‼결과‼** MyBatis의 resultMap으로 쿼리 매핑에 성공함! DTO에 주입했던 mzRegisterInfoVO 와 restaurantVO 의 필드를 mzregisterinfo 테이블과 restaurant 테이블의 컬럼에 하나하나 수동 매핑해줌. 수동 매핑 후 쿼리를 좀 더 상세하게 작성하여 리뷰 작성 시 영수증 list를 출력하는지 테스트한 결과, 원하는대로 상호명과 주소 정보가 잘 출력되는 것을 확인함.
	
<details>
  <summary>👉 수정하여 문제를 해결한 코드 확인 </summary>
  <div markdown="1">    

  ```java
	<!-- 영수증 등록 정보를 가져오자 -->
	<resultMap id="MZRegisterReceiptDTOMap" type="com.mat.zip.board.MZRegisterReceiptDTO">
	    <association property="mzRegisterInfoVO" javaType="com.mat.zip.registerAndSearch.model.MZRegisterInfoVO">
		<result property="no" column="m_no" />
		<result property="userId" column="m_userId" />
		<result property="storeAddress" column="m_storeAddress" />
		<result property="storePhoneNumber" column="m_storePhoneNumber" />
		<result property="buyTime" column="m_buyTime" />
	    </association>
	    <association property="restaurantVO" javaType="com.mat.zip.registerAndSearch.model.RestaurantVO">
		<result property="no" column="r_no" />
		<result property="landNumAddress" column="r_landNumAddress" />
		<result property="roadNameAddress" column="r_roadNameAddress" />
		<result property="name" column="r_name" />
		<result property="status" column="r_status" />
		<result property="tel" column="r_tel" />
		<result property="food" column="r_food" />
	    </association>
	</resultMap>

	<select id="getReceiptWithRestaurant" parameterType="String" resultMap="MZRegisterReceiptDTOMap">
	    SELECT r.no as r_no, r.landNumAddress as r_landNumAddress, r.roadNameAddress as r_roadNameAddress,
		   r.name as r_name, r.status as r_status, r.tel as r_tel, r.food as r_food,
		   m.no as m_no, m.userId as m_userId, m.storeAddress as m_storeAddress,
		   m.storePhoneNumber as m_storePhoneNumber, m.buyTime as m_buyTime
	    FROM MAT_ZIP.mzregisterinfo m 
	    JOIN MAT_ZIP.restaurant r ON m.storePhoneNumber = r.tel 
	    WHERE m.userID = #{user_id} 
	    AND m.no NOT IN 
	    (SELECT receipt_id FROM MAT_ZIP.cs_review)
	</select>
  ```
	  
  </div>
</details>

  * **‼해석‼** MZRegisterInfoVO와 RestaurantVO의 각 필드와 SQL 쿼리 결과의 열을 매핑하기 위해 resultMap을 사용함. 
	resultMap 내에서 association 태그를 사용하여 복합 DTO 내의 두 개의 객체를 따로 관리 진행하고, 또한 SQL 쿼리에서는 각 필드에 별칭(alias)을 사용하여 resultMap에서 참조할 수 있도록 하고, 별칭을 사용하여 SQL 결과의 열과 DTO의 속성을 연결함
  * 보통은 resultType 을 이용하면 정상적으로 모델과 매핑할 수 있지만, 두개 이상 모델이나 다소 복잡한 DTO와 매핑을 진행할 때는 resultMap으로 세밀한 컨트롤을 하자! 라는 것을 학습.

	
	
	
</details>

	
	
	
	
	
<br>

#### 5) 사장 커뮤니티
<details>
  <summary>📌핵심 기능 설명</summary>
  
  ##### `1. 토스 API를 이용한 결제하기`
  * 먼저, JavaScript 코드에서는 'https://js.tosspayments.com/v1/payment' JavaScript 라이브러리를 사용하여 TossPayments 객체를 초기화합니다. 이 객체는 토스 결제 클라이언트 키인 clientKey를 인자로 받아, 결제 시스템과의 연결을 설정합니다.
	
  * 사용자가 '결제하기' 버튼을 클릭하면, jQuery를 이용한 이벤트 처리를 통해 requestPayment 함수가 호출됩니다. 이 함수 내부에서는 두 가지 주요 작업을 수행합니다: 첫째, jQuery의 $.ajax 메서드를 사용하여 사용자가 입력한 상점 ID(storeId)의 중복 여부를 서버에 비동기적으로 요청하고 응답을 처리합니다. 둘째, 중복되지 않는 storeId를 확인한 후, 랜덤으로 orderID를 생성합니다. 이렇게 생성된 orderID는 결제 요청 시 사용됩니다. 이 두 작업이 모두 성공적으로 이루어진 경우에만 결제 요청이 이루어집니다.
	
  * 결제 요청은 TossPayments API로 전송되며, 결제 정보를 담은 JavaScript 객체를 JSON.stringify 함수를 사용하여 JSON 문자열로 변환한 뒤 전송합니다. 이 때, Apache의 CloseableHttpClient와 HttpPost를 사용하여 HTTP 요청을 보내며, 요청 헤더를 setHeader 메서드로 설정하고, 요청 엔티티를 StringEntity 객체를 통해 설정합니다. 결제가 성공적으로 이루어지면, 결제 성공 URL로 이동하게 됩니다.
	
  * **‼결과‼** 결제하기 버튼 클릭 시 토스 결제 API와 연결되어 상점 ID의 중복 여부를 체크하고 결제를 진행합니다.	
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939355-cac8c85a-0e30-429c-909a-fde92dd30b57.png) -->	
	
<br>	
	
  ##### `2. 사장 회원 등록`
  * 결제가 성공적으로 완료되면 다음 단계로 넘어가서, 상점 ID(storeId)와 세션의 user_id를 이용해 사장 멤버로의 회원 등록을 처리합니다. 이 과정은 jQuery와 AJAX를 사용하여 클라이언트에서 서버로 비동기적으로 요청을 보내는 방식으로 처리됩니다. 이 AJAX 요청은 특정 엔드포인트인 '/innerJoinAndInsert'로 전송되며, 서버에서는 이 요청을 받아 처리하게 됩니다.
	
  * 서버 사이드에서는 MemberAndPaymentService 클래스가 이 요청을 처리합니다. MemberAndPaymentService는 의존성 주입(Dependency Injection)을 통해 필요한 객체를 주입받습니다. 이 클래스는 회원 등록과 결제를 동시에 처리하는 트랜잭션을 관리합니다.
	
  * 클라이언트에서는 AJAX 요청의 성공 여부에 따라 콘솔에 성공 또는 실패 메시지를 출력합니다. 이때 성공 메시지가 출력되는 경우는 서버에서 회원 등록이 정상적으로 완료되었을 때이며, 그렇지 않은 경우 실패 메시지가 출력됩니다. 회원 등록 요청이 성공적으로 처리되면, 클라이언트에서는 이 storeId를 세션에서 제거합니다. 이를 통해 사용자의 인터페이스를 업데이트하고, 상점 ID를 재사용 가능하게 만듭니다.
	
  * **‼결과‼** 서버에서 회원 등록이 성공적으로 처리되면, 클라이언트 콘솔에 성공 메시지가 출력되고, 상점 ID는 세션에서 제거됩니다.
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png) -->

<br>	
	
  ##### `3. 결제 내역 저장하기`
  * 결제가 성공적으로 완료된 후, 결제 내역은 서버로 전송됩니다. 이 정보는 /payment 엔드포인트로 전송되며, 서버는 이 정보를 받아 데이터베이스에 저장합니다. 이 때의 서버 사이드 처리는 PaymentService와 PaymentController 클래스에서 수행되며, 이들 클래스 역시 의존성 주입을 통해 필요한 객체를 주입받습니다.
	
  * PaymentVO 객체에는 주문 ID, 결제 금액, 주문 이름 등의 정보가 포함되어 있습니다. 이러한 정보는 서버로부터 받은 응답에서 추출하며, 이 과정에서 Apache의 HttpComponents 클라이언트를 사용합니다.
	
  * 클라이언트는 CloseableHttpClient 객체를 사용하여 서버로 HTTP 요청을 전송합니다. 이때 HttpPost 객체를 사용하여 요청 헤더와 엔티티를 설정합니다. 헤더는 클라이언트와 서버가 데이터를 어떻게 처리해야 할지에 대한 정보를 전달하고, 엔티티는 POST 요청을 통해 서버로 전송될 데이터를 담고 있습니다.
	
  * 요청이 서버로 전송된 후, 클라이언트는 CloseableHttpResponse 객체를 통해 서버로부터의 응답을 받습니다. 서버로부터 받은 응답은 EntityUtils의 toString 메서드를 사용하여 문자열로 변환합니다. 이 문자열은 JSON 형태로 되어 있으므로, JsonParser.parseString 메서드를 사용하여 JSON 문자열을 JsonObject로 파싱합니다.
	
  * 이렇게 파싱된 JsonObject에서, 주문 ID, 결제 금액, 주문 이름 등의 정보를 추출하여 PaymentVO 객체에 설정합니다. 이렇게 생성된 PaymentVO 객체는 서버에 보내집니다. 이를 통해 서버는 결제가 성공적으로 이루어졌음을 확인하고, 해당 결제 정보를 데이터베이스에 저장할 수 있습니다.
	
  * **‼결과‼** 결제 정보가 서버에 전달되고, 해당 정보가 데이터베이스에 성공적으로 저장됩니다.
<!--   * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png) -->

</details>
	
<details>
  <summary>⚽트러블 슈팅</summary>
	
  ##### `1. 토스 결제 API에서 결제 응답값이 null로 반환되는 문제`
  * 첫 번째 시도 : 클라이언트에서 결제 요청 값 설정 -> ❌비정상작동
    * 'PaymentKey, PaymentType, orderId, amount 값 모두 필요하다'고 웹 콘솔 에러 메시지가 나왔는데, 결국 PaymentKey와 PaymentType 값은 서버에서 설정해야 한다는 걸 알게 됐다. 이게 원인이었나보다 싶어서 orderId와 amount 값만 요청에 넣었는데, 결제는 되는데 결제 성공 페이지에서 결제 응답값을 여전히 못 받아왔다.
  * 두 번째 시도 : API 요청을 서버에서 처리 -> ⭕정상작동!

	클라이언트에서 API 요청을 처리하려니 보안 문제가 생긴다는 걸 알게 되었다. 그래서 결제 응답값을 JSON 형태로 받아오는 것도 서버에서 처리하도록 바꿨다. 서비스 레이어를 분리하고, Secret Key를 Base64로 인코딩해서 요청을 보내니까 정상적으로 동작했다. 예외 처리도 try-catch 구문을 써서 해결했고, 요청이 성공하면 200이라는 HTTP OK 신호가 오는 것을 이용했다. 그리고 응답 헤더에 'Content-Type: application/json'을 써서 JSON으로 파싱된 값을 클라이언트에 전달하니까 응답정보도 잘 표시됐다.

	이번 오류를 통해서 다양한 것을 배울 수 있었다. 클라이언트에서 API 요청을 처리하는 것은 보안 문제가 있으니 서버에서 처리하는 것이 좋다는 것, 서비스 레이어를 분리하는 방법, 예외 처리하는 방법, Secret Key를 Base64로 인코딩하는 방법, 그리고 'Content-Type: application/json' 헤더를 사용해서 JSON으로 파싱된 값을 클라이언트에 전달하는 방법 등을 알게 되었다.
	
	```
	String encodedSecretKey = Base64.getEncoder().encodeToString((secretKey + ":").getBytes()); Base64인코딩 하는 코드
	```
	
<br>
	
  ##### `2. SQL 쿼리문 syntax 에러`
  * 첫 번째 발견 : mapper에서 쿼리문 작성 후 실행 -> ❌syntax 에러 발생
    * Mysql 문법에 맞지 않아 에러가 발생했었다. 쿼리문 작성에서 잘못됐다고 판단하였고, 확인해본 결과 부등호와 같은 특수 문자 때문에 XML 파싱 오류가 발생하는 것을 확인하였다. 이를 해결하기 위해 `<![CDATA[]]>`를 이용해 해당 부분을 감싸 처리하였으나, 이후 MySQL에서는 다시 문법 오류가 발생했다.
  * 해결 방법 : XML 엔티티 사용 -> ⭕정상작동!

	XML 문법에 따르면, <, >와 같은 특수 문자는 태그를 의미하기에 이들을 문자 그대로 사용하면 문제가 발생한다. 따라서 이런 문자를 사용할 때는 XML 엔티티를 사용해야 하며, <는 `&it;`로, >는 `&gt;`로 변경하였다. 이러한 변경을 통해 기능이 정상적으로 작동하였다.

	이번 오류를 통해 SQL 쿼리문을 작성하는 과정에서 XML 오류를 어떻게 해결할 수 있는지, 또 XML에서 특수 문자를 어떻게 처리하는지에 대해 배울 수 있었다. 
	
<br>	
	
 ##### `3. AI 감정분석 API 사용시 null 에러`
감정 분석 API를 통해 리뷰 데이터의 분석을 요청했을 때, 응답값 중 '중립'만 반환되는 문제가 발생했다. 분석 대상인 'content'가 '???' 형태 혹은 null로 응답 받아지는 것이 원인이었다.
  * 첫 번째 시도 : 함수 내부에서 여러 ajax 요청을 동시에 보내는 것이 문제라고 판단해서 promise 문법을 사용해 순차적 비동기 처리를 시도 -> ❌비정상작동
    
  * 두 번째 시도 : JSON 형식으로 요청이 되지 않아 발생하는 문제인지 확인하기 위해 JSON.stringify를 사용하여 정상적으로 JSON 요청을 보냄 -> ❌비정상작동
  * 세 번째 시도 : 리뷰 데이터 자체가 DB에서 UTF-8로 인코딩되지 않아 발생하는 문제인지 확인하기 위해 데이터를 utf8mb4로 인코딩 -> ❌비정상작동
  * 네 번째 시도 : 스프링 프레임워크에서 DB와 연결 시 UTF-8 설정이 안 되어 있는 문제인지 확인하기 위해 spring의 root-context.xml 파일을 확인 -> ❌비정상작동
  * 다섯 번째 시도 : API 요청을 보낼 때 인코딩/디코딩 문제인지 확인하기 위해 클라이언트에서 요청을 인코딩하여 보내고, 서버에서 디코딩하여 받은 후 서버에서 API 요청을 보냄 -> ❌비정상작동
  * 여섯 번째 시도 : 서버에서 API 요청을 보낼 때 base64로 인코딩하고 처리 후 클라이언트로 전달하였고, 클라이언트 측에서 디코딩하여 출력 -> ❌비정상작동
  * 일곱 번째 시도 : HttpEntity 객체 사용 및 ContentType에 UTF-8 명시 -> ⭕정상 작동!

	네이버 감정분석 API 공식문서를 보면 요청 헤더에 UTF-8을 명시하라고 되어있다. 이를 적용해 보니 정상적으로 요청이 이루어졌다.
	
	```
	headers.setContentType(new MediaType("application", "json", StandardCharsets.UTF_8));
	```

	이번 문제를 통해 API 요청을 보낼 때 인코딩과 헤더 설정의 중요성을 깨닫게 되었다. 또한, 공식문서를 주의 깊게 읽는 것의 중요성도 다시 한번 인지하게 되었다.
	
* 추가 에러 발생
   * 두 번째 문제점 : API 요청과 응답이 정상적으로 이루어지고, 긍정, 부정, 중립 응답도 정상적으로 받아오는 상황에서, 응답받은 페이지에서 'content'를 화면에 표시할 때 '???' 형태로 표시되는 문제가 발생
원인 분석 결과, 서비스 파일과 응답 타입 및 인코딩 형식을 맞추는 것이 아니라, 클라이언트 측과 맞추어야 했다. 감정 분석 API의 다른 오류 해결을 위해 코드를 수정하는 과정에서 이 부분을 놓치게 된 것으로 파악되었다.
	
   * 해결방법 : 컨트롤러 매핑에서 받아오는 타입을 클라이언트 측과 맞추어주니, 'content'가 정상적으로 출력되는 것을 확인할 수 있었다.
	
	```
	@GetMapping(value = "/analyze/{storeId}", produces = "application/json; charset=UTF-8")
	```

     이를 통해, 클라이언트와 서버 간 데이터 교환 시 데이터 형식과 인코딩 방식의 중요성을 재인식하게 되었다. 또한, API를 사용하면서 생기는 다양한 문제에 대응하기 위해서는 깊은 이해와 정확한 문제 파악 능력이 필요하다는 것을 깨달았다.

</details>	
	
	
<br>

#### 6) 포인트 시스템
<details>
  <summary>📌 핵심 기능 설명</summary>
	
  ##### `1. OCR을 활용한 영수증 등록 시 포인트 적립`
  * 먼저 OCR을 통한 영수증 등록 로직을 처리하는 DataValidationService에 포인트 적립 로직을 처리하는 PointSaveHistoryService를 @Autowired를 이용해 의존성 주입.
  * (DataValidationService에 있는 로직을 통해 영수증 등록의 가능여부를 판단한 이후 PointSaveHistoryService 로직이 동작하여, 따로 유효성 검사 로직을 사용하지 않았음)
  * PointSaveHistoryService에서는 @Autowired로 PointSaveHistoryDAO를 주입해 메서드 호출.
  * PointSaveHistoryDAO에 주입된 mybatis의 SqlSessionTemplate을 이용해서 pointMapper.xml에 있는 쿼리문을 수행.
  * **‼결과‼** 영수증 등록 시 등록에 성공하면 포인트 적립. DB 테이블에 포인트 내역 저장.

  ##### `2. 네이버 클라우드 SENS API를 활용한 포인트 교환(기프티콘)`
  * 기프티콘 교환 API를 사용하려 했으나 개인의 테스트 용도로 사용이 불가능하여, 네이버 SENS API를 이용해 원하는 상품 선택 시 해당 상품의 이미지를 MMS로 전송해주는 방법사용
    최대한 기존의 기프티콘 교환 방식과 비슷하게 구현.
  * 마이페이지에서 포인트 교환 페이지로 이동 -> 원하는 상품 선택 -> PointExchangeHistoryController에 Service 레이어 호출(세션에 저장된 user_id와 AJAX의 요청 data를 매개변수 전달)
  * Service 레이어에서 보유 포인트를 확인 후 상풍의 가격과 비교해서 보유 포인트가 적을 시 예외처리를 했습니다.
  * 보유 포인트를 확인 후 사용한 포인트를 DB에 저장하고, SENS API를 통해 MMS를 전송하게 됩니다.
  * @Transactional을 통해 예외 발생시 포인트 내역에 저장되기 전으로 롤백하도록 처리했습니다.(root-context에 Exception 설정을 추가해서 모든 예외 발생시 롤백되도록 설정했습니다)
  * **‼결과‼** 보유 포인트가 충분하고, 상품 교환에 성공 시 팝업창을 통해 결과를 알려주고, 회원의 핸드폰번호로 MMS가 전송되게 됩니다. 
	
  ##### `3. 포인트 상세이력 관리`
  * 배민 우아한기술블로그 참고(https://techblog.woowahan.com/2587/) 도메인 로직을 참고해서 설계했습니다.
  * 적립을 할 때 Insert만 존재하는 도메인 모델로 구현하였습니다.
  * 포인트를 사용하고 남은 포인트의 유효기간이 만료되면, 만료된 포인트만 처리해야 하는데 단순한 Insert 모델에서는 처리가 어려워 상세 테이블을 추가하였습니다.
  * 포인트 적립 시 상세 테이블에도 적립 기록이 저장되며, 사용 시 저장된 적립 이력을 큐(Queue)를 이용해서 빠른 시간순으로 정렬된 적립 기록을 불러옵니다.
  * poll을 이용해 List에 저장된 포인트를 상품의 가격과 비교하여 다시 상세 테이블에 저장하고, 상품의 가격이 0원이 되면 종료되는 로직을 구현했습니다.
  * 유효기간만료 이벤트가 발생하면 테이블의 적립아이디를 기준으로 GROUP BY해서 남은 금액을 만료 처리 하면됩니다.
  * 이렇게 하면 기존의 update 로직보다 상세한 이력관리가 가능합니다.
  * ![image](https://github.com/chujaeyeong/MAT_ZIP_readme_chujy/assets/123634960/47e96e9a-1591-4ede-ac4a-bac002e21264)


	
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>

<br>
	
  ##### `1. 포인트 교환 예외발생 시 트랜잭션(transaction) 롤백 미작동`
  * @Transactional exChange메소드 내부 checkPoint(), insertUsePoint(), sendSms() 메서드 Exception 발생 시 기존 DB에 저장된 데이터를 롤백
  * 첫 번째 시도 : sendSms() 메서드에 테스트용 런타임 에러 적용(DB에 저장된 후 동작하는 메서드) DB 롤백 확인  -> ❌롤백 미작동
  * 두 번째 시도 : root context에 트랜잭션 Bean 추가. -> ❌롤백 미작동
  * 세 번째 시도 : cglib 라이브러리를 추가 / servlet context에 proxy-target-class 속성 추가 -> ⭕정상작동!
	* Spring AOP 사용. 인터페이스를 사용하나 proxy-target-class 속성을 사용하기 위해 cglib 라이브러리 추가
	* DB설정을 root context 쪽에 할 경우, 이 DB설정은 servlet context쪽에 설정된 Bean들에는 적용이 안된다.
	* transaction관련 설정을 servlet context에 해줘야한다.
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	@Override
	@Transactional
	// 적립 포인트 상품 교환 비즈니스 로직
	public void exChange(String user_id, int id) {

		PointSaveHistoryVO userpoint = PointExchangeHistoryDAO.pointsaveFind(user_id);
		ProductPointVO product = PointExchangeHistoryDAO.productPointFind(id);

		try {
			// 보유 포인트 확인 메서드
			checkPoint(userpoint, product);
			// 보유 포인트 확인 후 교환된 포인트 INSERT
			insertUsePoint(userpoint, product);
			// 교환된 기프티콘 이미지 MMS 전송
	  		sendSms(userpoint, product);
	  
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	// MMS 전송(네이버 SENS API)
	private void sendSms(PointSaveHistoryVO userpoint, ProductPointVO product) {
	  
		SendSmsVO sms = new SendSmsVO();
		sms.setUser_id(userpoint.getUser_id());
		sms.setImg(product.getImg());
		//sms.setTel(tel);
	  
		sensapi.sendSMS(sms);
	  
		throw new IllegalArgumentException("메세지 전송 오류");
	}
  ```
  </div>
</details>
</details>

<br>

#### 7) 캘린더
<details>
  <summary>📌 핵심 기능 설명</summary>
    
  ##### `캘린더 API를 참고한 캘린더`
  * 캘린더 화면 출력 관련 코드 CalController에 Autowired로 CalDAO의 인스턴스를 주입해 메서드 호출. => 스프링의 의존성 주입
  * CalDAO에 주입된 mybatis의 SqlSessionTemplate를 이용해서 CalMapper.xml에 있는 쿼리문을 수행
  * **‼결과‼** 일정을 등록하고, 등록된 일정을 수정 및 삭제할 수 있음. DB 테이블에 등록/수정/삭제된 데이터 반영.
</details>

<details>
  <summary>⚽ 트러블 슈팅</summary>
	
  ##### `1. 500에러들(문법적 오류)`
  * 첫 번째 문제 : cal.do와 cal을 혼용하여 써서 인식을 제대로 하지 못한 문제 => .do와 같은 수식어를 붙이는 건 불필요한 관습이니 쓰지 않도록.
  * 두 번째 문제 : mybatis=confog.xml에 타입알리아스 맵퍼 등록을 안 해둔 문제.
  * 세 번째 문제 : CalDAO에서 interface 바로 쓸 수 없음.
    
  ##### `2. 새로 알게 된 것`
  * 첫 번째 : css와 jsp에 스타일 적용이 둘 다 되어있다면 css가 먼저 적용된다. => css는 외부에서 구한 자료이기에 수정을 하기 까다로워서 중앙배열 같은 문제는 java코드로 손보는 것에 어려움이 있음.
  * 두 번째 : jsp만 수정한 것은 서버를 중지하지 않고 구현 화면에서 바로 새로고침해도 적용이 되지만 자바코드가 수정된 것은 서버를 중지시킨 후 재실행해야 반영이 된다.(ex.Mapper에서 수정되면 서버 재실행)

<br>

</details>
