# [팀프로젝트] 맛.JAVA - 맛.ZIP
#### 💡 맛.ZIP은 “진짜 믿고 먹을 수 있는 맛집” 을 공유하는 플랫폼입니다.
* (여기 뭐라고 소개를 해야하냐.................?)

<br>

## 1. 제작 기간
#### `2023년 4월 28일 ~ 6월 9일 (1개월)`

<br>

## 2. 사용 기술
### `Back-end`
* Java 8
* Spring Framework 5.0.1
* Maven
* Mybatis
* MySQL 8.0.32

### `Front-end`
* HTML
* CSS
* JavaScript
* JQuery 3.6.4
* BootStrap 4.1

### `Server`
* tomcat 8.5
* AWS

<br>

## 3. 기능 구현
* #### `회원가입, 로그인, 마이페이지, AI챗봇`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `영수증 등록, 검색기능`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `음식점 상세페이지`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `회원 커뮤니티`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `사장 커뮤니티`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `포인트 시스템, 랭킹 시스템(또슐랭 가이드)`
  * (각자 본인의 기능 간략하게 작성바람)

* #### `캘린더`
  * (각자 본인의 기능 간략하게 작성바람)

<br>

## 4. 핵심 기능 설명 & 트러블 슈팅
#### 1. 포인트 시스템
<details>
  <summary>📌핵심 기능 설명</summary>
	
  ##### `1. OCR을 활용한 영수증 등록 시 포인트 적립`
  * 먼저 OCR을 통한 영수증 등록 로직을 처리하는 DataValidationService에 포인트 적립 로직을 처리하는 PointSaveHistoryService를 @Autowired를 이용해 의존성 주입.
  * (DataValidationService에 있는 로직을 통해 영수증 등록의 가능여부를 판단한 이후 PointSaveHistoryService 로직이 동작하여, 따로 유효성 검사 로직을 사용하지 않았음)
  * PointSaveHistoryService에서는 @Autowired로 PointSaveHistoryDAO를 주입해 메서드 호출.
  * PointSaveHistoryDAO에 주입된 mybatis의 SqlSessionTemplate을 이용해서 pointMapper.xml에 있는 쿼리문을 수행.
  * **‼결과‼** 영수증 등록 시 등록에 성공하면 포인트 적립. DB 테이블에 포인트 내역 저장.
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161678010-5aac77c5-1f72-4ae2-a74b-af5bed0deb9f.png)

  ##### `2. 네이버 클라우드 SENS API를 활용한 포인트 교환(기프티콘)`
  * 기프티콘 교환 API를 사용하려 했으나 개인의 테스트 용도로 사용이 불가능하여, 네이버 SENS API를 이용해 원하는 상품 선택 시 해당 상품의 이미지를 MMS로 전송해주는 방법사용
    최대한 기존의 기프티콘 교환 방식과 비슷하게 구현.
  * 마이페이지에서 포인트 교환 페이지로 이동 -> 원하는 상품 선택 -> PointExchangeHistoryController에 Service 레이어 호출(세션에 저장된 user_id와 AJAX의 요청 data를 매개변수 전달)
  * Service 레이어에서 보유 포인트를 확인 후 상풍의 가격과 비교해서 보유 포인트가 적을 시 예외처리를 했습니다.
  * 보유 포인트를 확인 후 사용한 포인트를 DB에 저장하고, SENS API를 통해 MMS를 전송하게 됩니다.
  * @Transactional을 통해 예외 발생시 포인트 내역에 저장되기 전으로 롤백하도록 처리했습니다.(root-context에 Exception 설정을 추가해서 모든 예외 발생시 롤백되도록 설정했습니다)
  * **‼결과‼** 보유 포인트가 충분하고, 상품 교환에 성공 시 팝업창을 통해 결과를 알려주고, 회원의 핸드폰번호로 MMS가 전송되게 됩니다.  
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161677883-4e4976b7-81ee-480f-98e8-ba1563627b0b.png)
	
  ##### `3. 포인트 상세이력 관리`
  * 배민 우아한기술블로그 참고(https://techblog.woowahan.com/2587/) 도메인 로직을 참고해서 설계했습니다.
  * 적립을 할 때 Insert만 존재하는 도메인 모델로 구현하였습니다.
  * 포인트를 사용하고 남은 포인트의 유효기간이 만료되면, 만료된 포인트만 처리해야 하는데 단순한 Insert 모델에서는 처리가 어려워 상세 테이블을 추가하였습니다.
  * 포인트 적립 시 상세 테이블에도 적립 기록이 저장되며, 사용 시 저장된 적립 이력을 큐(Queue)를 이용해서 빠른 시간순으로 정렬된 적립 기록을 불러옵니다.
  * poll을 이용해 List에 저장된 포인트를 상품의 가격과 비교하여 다시 상세 테이블에 저장하고, 상품의 가격이 0원이 되면 종료되는 로직을 구현했습니다.
  * 유효기간만료 이벤트가 발생하면 테이블의 적립아이디를 기준으로 GROUP BY해서 남은 금액을 만료 처리 하면됩니다.
  * 이렇게 하면 기존의 update 로직보다 상세한 이력관리가 가능합니다.
</details>
<details>
  <summary>⚽트러블 슈팅</summary>

<br>
	
  ##### `1. 포인트 교환 예외발생 시 트랜잭션(transaction) 롤백 미작동`
  * 첫 번째 시도 : 아이디 중복 검사 클래스, 비밀번호 일치 검사 클래스를 addValidators() 메서드를 사용해 각각 바인딩 -> ⭕정상작동!  
  * 두 번째 시도 : 두 클래스를 하나의 클래스로 구현해도 될 것 같다는 생각에 JoinCkValidator클래스를 만들어 코드를 합친 후 바인딩할 객체가 하나이기 때문에 setValidator() 메서드로 변경 -> ❌비정상작동
    * 하고자 했던 바인딩을 통한 유효성 검사는 잘 되었지만, 잘 되던 데이터 형식 유효성 검사가 작동하지 않았다.
  * 세 번째 시도 : 객체가 하나이지만 혹시나 하는 마음에 addValidators() 메서드로 다시 변경 -> ⭕정상작동!
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	  //첫 번째 코드 - 정상작동
	  @InitBinder
	  public void validator(WebDataBinder binder) {
		  binder.addValidators(IdDuplCkValidator);
	  	  binder.addValidators(passMctCkValidator);
	  }
	  
	  //두 번째 코드 - 비정상작동
	  @InitBinder
	  public void validator(WebDataBinder binder) {
		  binder.setValidator(joinCkValidator);
	  }

	  //세 번째 코드 - 정상작동
	  @InitBinder
	  public void validator(WebDataBinder binder) {
		  binder.addValidators(joinCkValidator);
	  }
  ```
  </div>
</details>
	
객체가 하나인데 setValidator() 메서드가 아닌 addValidators() 메서드를 사용했을 때 정상 작동하는 이유가 무엇일까?  
사실 정확한 이유는 찾지 못했지만, 아래 로그인 시 유효성 검사까지 완료해보니 짐작 가는 부분이 생겼다.  
	
  ##### `2. 로그인 시 유효성 검사 미작동`
  * 첫 번째 시도 : validator가 아닌 Model을 사용해서 아이디, 비밀번호가 존재하지 않으면 메시지를 전송하는 방식을 적용 -> ⭕정상작동!
  * 두 번째 시도 : 로그인도 validator를 적용해보고 싶다는 생각에 아이디, 비밀번호 존재 여부를 검사하는 클래스를 만든 후 회원가입과 똑같이 addValidators() 메서드 사용 -> ❌비정상작동
    * 회원가입 시에 필요한 MemberDto객체의 데이터 형식 검사를 진행하며 에러 발생
  * 세 번째 시도 : setValidator() 메서드로 변경 -> ⭕정상작동!
<details>
  <summary>👉코드확인</summary>

  <div markdown="1">    

  ```java
	  //첫 번째 코드 - 정상작동 (login메서드)
	  if(memberService.login(memberDto) != 1){
		  model.addAttribute("loginFailMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
		  return "/member/loginForm";
          }
	  
	  //두 번째 코드 - 비정상작동
	  @InitBinder
	  public void validator(WebDataBinder binder) {
		  binder.addValidators(LoginCkValidator);
	  }
	  
	  //세 번째 코드 - 정상작동
	  @InitBinder
	  public void validator(WebDataBinder binder) {
		  binder.setValidator(LoginCkValidator);
	  }
  ```
  </div>
</details>

<br>
	
로그인 시에는 데이터 형식을 검사하길 원하지 않았는데 두 번째 시도에선 데이터 형식을 검사하며 에러가 발생했다.  
문득 setValidator() 메서드가 아닌 addValidators() 메서드를 사용하고 있었다는 사실을 깨닫고, setValidator() 메서드로 수정해주었다.  
이 과정에서 회원가입 두 번째 시도와 같이 데이터 형식 검사를 하지 않는다는 것을 알아냈고,  힌트를 얻을 수 있었다.

위 두 경우를 보면 회원가입 유효성 검사에서는 addValidators()메서드를,  
로그인 유효성 검사에서는 setValidator()메서드를 사용해야 정상작동하는 것을 알 수 있다.  
회원가입도 검사할 객체가 하나인데 왜 addValidators() 메서드만 정상작동하는걸까?  
내가 찾은 답은 `'어노테이션을 통한 데이터 유효성 검사 또한 하나의 유효성 검사 객체(?)로 인식한다.'` 이다.  

`그렇다면?`  
회원가입에서는 ①데이터 형식 유효성 검사와 ②커스텀 유효성 검사 두 개가 이루어지니 **addValidators()메서드를**,  
로그인은 ①커스텀 유효성 검사만 하면 되니 **setValidator()메서드를** 사용하면 된다는 것이 내가 찾은 결론이다.  
또한 검증객체가 하나 이상일 땐 제약조건 어노테이션으로 정의한 데이터 형식 유효성 검사가 우선적으로 이루어진다는 것을 예상할 수 있다.
	
</details>

<br>

#### 2. 구독결제 시스템
<details>
  <summary>📌핵심 기능 설명</summary>
  
  ##### `1. 토스 API를 이용한 결제하기`
  * 먼저, JavaScript 코드에서는 'https://js.tosspayments.com/v1/payment' JavaScript 라이브러리를 사용하여 TossPayments 객체를 초기화합니다. 이 객체는 토스 결제 클라이언트 키인 clientKey를 인자로 받아, 결제 시스템과의 연결을 설정합니다.
  * 사용자가 '결제하기' 버튼을 클릭하면, jQuery를 이용한 이벤트 처리를 통해 requestPayment 함수가 호출됩니다. 이 함수 내부에서는 두 가지 주요 작업을 수행합니다: 첫째, jQuery의 $.ajax 메서드를 사용하여 사용자가 입력한 상점 ID(storeId)의 중복 여부를 서버에 비동기적으로 요청하고 응답을 처리합니다. 둘째, 중복되지 않는 storeId를 확인한 후, 랜덤으로 orderID를 생성합니다. 이렇게 생성된 orderID는 결제 요청 시 사용됩니다. 이 두 작업이 모두 성공적으로 이루어진 경우에만 결제 요청이 이루어집니다.
  * 결제 요청은 TossPayments API로 전송되며, 결제 정보를 담은 JavaScript 객체를 JSON.stringify 함수를 사용하여 JSON 문자열로 변환한 뒤 전송합니다. 이 때, Apache의 CloseableHttpClient와 HttpPost를 사용하여 HTTP 요청을 보내며, 요청 헤더를 setHeader 메서드로 설정하고, 요청 엔티티를 StringEntity 객체를 통해 설정합니다. 결제가 성공적으로 이루어지면, 결제 성공 URL로 이동하게 됩니다.
  * **‼결과‼** 결제하기 버튼 클릭 시 토스 결제 API와 연결되어 상점 ID의 중복 여부를 체크하고 결제를 진행합니다.	
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939355-cac8c85a-0e30-429c-909a-fde92dd30b57.png)
  
  ##### `2. 사장 회원 등록`
  * 결제가 성공적으로 완료되면 다음 단계로 넘어가서, 상점 ID(storeId)와 세션의 user_id를 이용해 사장 멤버로의 회원 등록을 처리합니다. 이 과정은 jQuery와 AJAX를 사용하여 클라이언트에서 서버로 비동기적으로 요청을 보내는 방식으로 처리됩니다. 이 AJAX 요청은 특정 엔드포인트인 '/innerJoinAndInsert'로 전송되며, 서버에서는 이 요청을 받아 처리하게 됩니다.
  * 서버 사이드에서는 MemberAndPaymentService 클래스가 이 요청을 처리합니다. MemberAndPaymentService는 의존성 주입(Dependency Injection)을 통해 필요한 객체를 주입받습니다. 이 클래스는 회원 등록과 결제를 동시에 처리하는 트랜잭션을 관리합니다.
  * 클라이언트에서는 AJAX 요청의 성공 여부에 따라 콘솔에 성공 또는 실패 메시지를 출력합니다. 이때 성공 메시지가 출력되는 경우는 서버에서 회원 등록이 정상적으로 완료되었을 때이며, 그렇지 않은 경우 실패 메시지가 출력됩니다. 회원 등록 요청이 성공적으로 처리되면, 클라이언트에서는 이 storeId를 세션에서 제거합니다. 이를 통해 사용자의 인터페이스를 업데이트하고, 상점 ID를 재사용 가능하게 만듭니다.
  * **‼결과‼** 서버에서 회원 등록이 성공적으로 처리되면, 클라이언트 콘솔에 성공 메시지가 출력되고, 상점 ID는 세션에서 제거됩니다.
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png)

  ##### `3. 결제 내역 저장하기`
  * 결제가 성공적으로 완료된 후, 결제 내역은 서버로 전송됩니다. 이 정보는 /payment 엔드포인트로 전송되며, 서버는 이 정보를 받아 데이터베이스에 저장합니다. 이 때의 서버 사이드 처리는 PaymentService와 PaymentController 클래스에서 수행되며, 이들 클래스 역시 의존성 주입을 통해 필요한 객체를 주입받습니다.
  * PaymentVO 객체에는 주문 ID, 결제 금액, 주문 이름 등의 정보가 포함되어 있습니다. 이러한 정보는 서버로부터 받은 응답에서 추출하며, 이 과정에서 Apache의 HttpComponents 클라이언트를 사용합니다.
  * 클라이언트는 CloseableHttpClient 객체를 사용하여 서버로 HTTP 요청을 전송합니다. 이때 HttpPost 객체를 사용하여 요청 헤더와 엔티티를 설정합니다. 헤더는 클라이언트와 서버가 데이터를 어떻게 처리해야 할지에 대한 정보를 전달하고, 엔티티는 POST 요청을 통해 서버로 전송될 데이터를 담고 있습니다.
  * 요청이 서버로 전송된 후, 클라이언트는 CloseableHttpResponse 객체를 통해 서버로부터의 응답을 받습니다. 서버로부터 받은 응답은 EntityUtils의 toString 메서드를 사용하여 문자열로 변환합니다. 이 문자열은 JSON 형태로 되어 있으므로, JsonParser.parseString 메서드를 사용하여 JSON 문자열을 JsonObject로 파싱합니다.
  * 이렇게 파싱된 JsonObject에서, 주문 ID, 결제 금액, 주문 이름 등의 정보를 추출하여 PaymentVO 객체에 설정합니다. 이렇게 생성된 PaymentVO 객체는 서버에 보내집니다. 이를 통해 서버는 결제가 성공적으로 이루어졌음을 확인하고, 해당 결제 정보를 데이터베이스에 저장할 수 있습니다.
  * **‼결과‼** 결제 정보가 서버에 전달되고, 해당 정보가 데이터베이스에 성공적으로 저장됩니다.
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/161939367-2daf8776-9865-45d0-94bf-3eb7ba5bf886.png)

	### Requirement

> 일반 야구 level 1 은 샘플 + 테스트코드가 구현되어 있습니다.

| Level | 일반 야구                                                                                            | 우주 야구                                                                                                                              |
|-------|--------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| 1     | - 선수는 1명으로 타자로만 플레이 합니다.<br/>- 스트라이크, 볼, 안타은 같은 확률을 가집니다.<br/>- 1개의 게임은 1개의 타석으로 구성 됩니다.         | - 즉시 아웃되는 `bullseye strike` 추가 (strike 의 20%)<br/>- 즉시 출루되는 `bullseye ball` 추가 (ball 의 20%)<br/>- 즉시 득점되는 `homerun` 추가 (hit 의 20%) |
| 2     | - 게임 생성시 스트라이크, 볼, 안타의 확률을 입력 받습니다.<br/>- 1개의 게임은 1개의 회로 구성됩니다.<br/>- 전광판으로 득점을 표현합니다.           | - 3루가 없어집니다.                                                                                                                       |
| 3     | - 1개의 게임은 3개의 회로 구성됩니다.                                                                          | - 게임 생성시 `fever inning` 을 입력 받습니다. (hit rate 2배, 득점 2배)<br/>- 마지막 회는 5 아웃시 종료됩니다.                                                  |
| 4     | - 애플리케이션 재기동 후에도 게임을 재개할 수 있습니다.<br/>- 동시에 여러 개의 게임을 진행할 수 있습니다. <br/>- idea 없이도 독립적인 실행이 가능합니다. |                                                                                                                                    |
| 5     | ...                                                                                              |                                                                                                                                    |

	
  ##### `새로 알게된 점`
Spring Security는 같은 비밀번호로 회원가입을 해도 매번 다른 랜덤키를 부여한다.  
같은 문자열임에도 각기 다른 랜덤키를 어떻게 비교를 하는건지 궁금해서 더 알아보았다.  
	
BCryptPasswordEncoder는 **비밀번호의 단방향 암호화**를 지원하는 PasswordEncoder 인터페이스의 구현체이고,  
해시 함수를 사용하여 비밀번호를 암호화하고, **복호화를 할 수 없도록** 만들어졌다고 한다.  

때문에 비밀번호를 서로 비교할 땐 equals()가 아닌 matches()를 사용해야 하는데,
matches()는 내부적으로 입력받은 패스워드와 암호화된 패스워드가 서로 대칭되는지에 대한 알고리즘을 구현하고 있다고 한다.  
matches()는 보안을 위해 복호화 할 수 없는 비밀번호를 다룰 때 사용한다는 것을 알게되었다.
	
</details>

<br>

#### 3. Open API를 활용한 지하철역 검색
<details>
  <summary>📌핵심 기능 설명</summary>

  #### `1. URL연결해서 JSON 데이터 받아오기`
  * 먼저 서울 열린데이터광장에서 제공하는 URL로 JSON데이터를 받기 위해 URL객체를 생성해 주었다.
  * 생성된 URL객체에 서울 열린데이터광장에서 받은 고유 key를 넣고, 매개변수로 지하철역 명을 받아 URL을 호출시켰다.
  * 연결된 URL에서 받은 데이터는 openStream()메서드를 사용해 InputStreamReader에 문자스트림을 보냈고,
  * 문자스트림은 다시 BufferedReader를 사용해 문자열로 만들어 String 타입으로 result변수에 저장했다.
  
  #### `2. JSON 파싱하기`
  * 위에서 result변수에 저장된 값을 JSON객체로 변환하고 저장하기 위해 JSONObject클래스를 사용했다.
  * 그렇게 변환된 JSON객체에서 원하는 value 값을 얻어오기 위해 getJSONObject(), getJSONArray()메서드를 사용하였고, for문을 사용해 배열로 된 value값을 얻어와 String 타입의 lineNum변수에 구분자 #을 넣어 담아주었다.
  * 최종적으로 lineNum변수에 담긴 String객체를 return하여 지하철역 명을 검색하면 해당하는 노선을 반환하는 기능을 구현할 수 있었다.
  * [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/163132706-c953acb4-d510-494f-b4ba-ee7800bd46e9.png) [👉코드로 확인하기](https://github.com/jeejee1106/ToyProject-RunningGo/blob/0d1a247ff1ba952406353856e31afe61b39c8ceb/src/main/java/com/runninggo/toy/service/PlaceRecmndServiceImpl.java#L19)

</details>
<details>
  <summary>⚽트러블 슈팅</summary>
	
  ##### `1. 매개변수로 받은 지하철역 명(한글)이 깨져 올바른 데이터를 반환하지 않음`
  * 첫 번째 시도 : 지하철역 명을 URL에 바로 넣어 데이터 호출 -> ❌비정상작동
    * 'INFO-200	해당하는 데이터가 없습니다.' 라는 데이터를 반환
  * 두 번째 시도 : URLEncoder 객체를 사용해 한글 인코딩 후 데이터 호출 -> ⭕정상작동!

서울 열린데이터광장에서 제공한 샘플 URL을 통해 브라우저에서 호출했을 땐 올바른 데이터가 반환되었지만,  
매개변수로 받은 지하철역 명을 URL에 넣어 호출하니 원하는 대로 동작하지 않았다. (JSON데이터는 잘 받아왔기 때문에 URL문제라고 판단)  
찾아보니 URL은 운영체제마다 일부 문자를 인식하는 방식이 다르기 때문에 일부 문자는 규칙에 맞게 변환되어야 하고,  
한글은 인코딩을 통해 규칙에 맞게(ASCII코드를 16진수화한 결과를 두자리의 대문자로) 변환시켜야 한다는 것을 알게 되었다.  
```
String encodeSubwayName = URLEncoder.encode(subwayName, "UTF-8");
```
위 코드를 추가해 URL에 들어갈 지하철역 명을 인코딩해주었고, 원하는 JSON데이터를 불러올 수 있었다.

  ##### `2. API는 그냥 갖다쓰기만 하면 된다면서요?`
개발을 처음 접했을 때 부터 들었던 'API는 그냥 가져다 쓰기만 하면 된다.'라는 이야기...  
정말 제공해주는 코드만 복붙하면 끝나는 건줄 알았다. 그게 아니라면, 사용법이 자세하게 나와있는 줄 알았다.  
그러나 실제로 내가 할 수 있는 것은 key발급과 샘플코드를 브라우저에 입력해보는 것 뿐이었다.  

`이걸로 뭘 어쩌라고??`  
이틀간의 구글링을 통해 Open API 사용법을 익혔고, 여러 시행착오 끝에 기능을 구현할 수 있었다.  
덕분에 연결된 URL로부터 데이터 읽는 방법, 자바의 여러가지 입력 객체들, JSON을 파싱하는 방법 등에 대해서 공부할 수 있었고, 조금 헤매긴 했지만 부족한 점을 깨닫고 더욱 보완할 수 있는 계기가 되었다.
	
</details>

<br>

#### 4. 예외 처리 ExceptionHandler
<details>
  <summary>📌핵심 기능 설명</summary>

##### `1. 500 Internal Server Error 처리`
* 각 컨트롤러마다 예외처리 메서드를 만들어 처리할 수도 있지만 나는 클래스를 생성해서 전역으로 처리해주었다.
* 예외처리 클래스에는 @ControllerAdvice를, 예외를 받아 줄 메서드에는 @ExceptionHandler를 적용했다.
* @ExceptionHandler의 속성으로는 Exception.class를 지정해주어 모든 Exception을 처리할 수 있게 했다.
* 반환값으로 500 에러를 받아줄 view를 return시켰다.
* 이렇게 하면 예외 처리는 잘 되지만 HTTP 상태코드에서 200이 나오게 된다.
* 상태코드를 500으로 바꿔주기 위해 @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)를 적용해주었다.
* [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/163983221-646c2a95-e28e-48d1-a468-036ff3ee6cde.png)

##### `2. 404 Not Found  처리`
* 404에러는 서버에러가 아닌 클라이언트 에러이기 때문에 따로 처리를 해주었다.
* web.xml파일에 404 에러를 받기 위한 설정을 해주었고, 예외처리 클래스에도 따로 메서드를 만들어 @ExceptionHandler의 속성으로 NoHandlerFoundException.class를 지정해주었다.
* 반환값으로는 404 에러를 받아줄 view를 return시켰다.
* 마찬가지로 상태코드 200을 404로 바꿔주기 위해 @ResponseStatus(value = HttpStatus.NOT_FOUND)를 적용해주었다.
* [👉이미지로 전체 흐름 확인하기](https://user-images.githubusercontent.com/84839167/163983392-b969adfa-c5a8-438b-9ed5-5e088966f084.png)

</details>
<details>
  <summary>⚽트러블 슈팅</summary>

##### `1. @ExceptionHandler(Exception.class)로 처리되지 않는 404 Not Found`
* 첫 번째 시도 : 하나의 @ExceptionHandler로 모든 에러를 처리하고자 함 -> ❌비정상작동
    * 500에러는 return해준 jsp로 연결 되었지만, 404에러는 WAS의 기본 오류 페이지로 연결됨.
* 두 번째 시도 : 404에러 처리를 위해 설정 추가, 메서드 추가 생성 -> ⭕정상작동!

예외처리 클래스에서 모든 에러를 처리하기 위해 Exception.class를 받았지만 404에러는 WAS의 기본 오류 페이지로 연결되었다.  
공부해보니 요청은 받았으나 연결할 컨트롤러가 없기 때문에 컨트롤러 자체가 동작하지 않아 Exception이 발생하지 않았고, 이는 DispacherServlet이 처리해주어야 한다는 것을 알게되었다.  

해결방법으로는 throwExceptionIfNoHandlerFound라는 매개변수를 web.xml에 추가함으로써 DispatcherServlet을 커스터마이징 해주는 것이다.  
이는 요청에 대응되는 Handler를 찾지 못할 경우 예외를 발생시킨다는 의미라고 한다.  
이 때 발생하는 예외가 NoHandlerFoundException이기 때문에 @ExceptionHandler(NoHandlerFoundException.class)  
어노테이션과 속성을 적용한 메서드를 새로 만들어서 404에러 처리를 할 수 있었다.

[//]: # (##### `2. Exception의 분류`)


</details>
