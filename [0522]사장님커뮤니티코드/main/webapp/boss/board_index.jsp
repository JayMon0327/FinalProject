<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../resources/css/boss.css" rel="stylesheet">
<!-- boss.css 파일을 추가합니다 -->

<style>
  @import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap')
	; 
</style>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script>
  var clientKey = 'test_ck_Wd46qopOB89oxwWnw2OVZmM75y0v'
  var tossPayments = TossPayments('test_ck_Wd46qopOB89oxwWnw2OVZmM75y0v')

  function generateOrderId() {
  // 영문 대소문자, 숫자, 특수문자 (-, _)로 이루어진 문자열
  const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
  
  let orderId = "";
  
  // 길이가 10인 주문 ID 생성
  for (let i = 0; i < 10; i++) {
    // characters 문자열에서 무작위로 문자 선택
    const randomIndex = Math.floor(Math.random() * characters.length);
    // 선택된 문자를 주문 ID에 추가
    orderId += characters.charAt(randomIndex);
  }
  
  return orderId;
}

  // 결제 요청 함수
  function requestPayment() {
    <% if (session.getAttribute("user_id") != null) { %>
      var userId = '<%= session.getAttribute("user_id") %>';
      var orderId = generateOrderId();
      console.log("생성된 orderId:", orderId);
      tossPayments.requestPayment('카드', {
        amount: 2900,
        orderId: orderId,
        orderName:'사장님커뮤니티 구독결제',
        customerName: userId,
        successUrl: 'http://localhost:8887/MAT_ZIP/boss/tossSuccess',
        failUrl: 'http://localhost:8887/MAT_ZIP/boss/tossFail', 
      });
    <% } else { %>
      // 세션에 user_id가 없는 경우에 대한 처리
      console.log("세션에 user_id가 없습니다.");
      // 적절한 대체 처리 방식을 추가하세요.
    <% } %>
  }
</script>



<meta charset="UTF-8">
<title>맛.zip</title>
</head>
<body>

	<h1 style="color: green;" id="main">
		<button class="btn btn-outline-success"
			style="width: 100px; border-bottom: 2px solid green;">
			<em>맛.zip</em>
		</button>
	</h1>
	<form action="Board_one" method="get" id="search">
		<input name="board_id" type="text" size="40" placeholder="내용을 입력해주세요">
		<button type="submit" class="btn btn-success">
			검색<i class="bi bi-search"></i>
		</button>
	</form>
	<h3 style="color: gray;" id="main2">
		<em><span style="border-bottom: 2px solid gray;">사장님</span></em>
	</h3>


	<div class="container">
		<!--컨테이너  -->
		<div class="row">
		<!-- 음식결제하기 메뉴는 세션 잡지않은상태 아직 고민중  -->
		<a href="paymentTest.jsp"> <button class="btn btn-success" style="z-index:200;">음식결제하러가기</button></a>
			<%
				if (session.getAttribute("user_id") != null) {
			%>
			<h3 style="color: green;">
				<em class="id"><span class="badge text-bg-warning">${nickName}님</span></em>
			</h3>
			<h3 style="color: green;">
				<em class="logout"> <a href="logout"><button type="button"
							class="btn btn-danger opacity-75 bi bi-box-arrow-right">로그아웃  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-box-arrow-right"
						viewBox="0 0 16 16">
  <path fill-rule="evenodd"
							d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
  <path fill-rule="evenodd"
							d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
</svg></button>
				</a> </em>
			</h3>
			<%
				} else {
			%>
			<a href="boss_member.jsp"> <span class="id2"><button
						class="btn btn-warning">회원가입</button></span>
			</a><a href="boss_login.jsp"> <span class="id"><button
						class="btn btn-success">로그인</button></span>
			</a>
			<%
				}
			%>
		</div>
	</div>



	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				<tr class="table-success">
					<div class="col-md-3">
						<!-- 12개의 컬럼중에 3개씩 할당 -->
						<td><a href="boss_chartIndex.jsp">
								<button style="background-color: #fafafa;">
									<h4>매출장부</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>맛 News</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="Board_list">
								<button style="background-color: #fafafa;">
									<h4>자유게시판</h4>
								</button>
						</a></td>
					</div>
					<div class="col-md-3">
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>전문가QnA</h4>
								</button>
						</a></td>
					</div>
				</tr>
			</table>
		</div>
	</div>

	<%
		if (session.getAttribute("boss_id") != null) {
	%>
	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table>
				<tr>
					<td class="down">추천게시물</td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table" style="border: 1px solid #dddddd">
				<tr>
					<div class="col-md-2">
						<td>1</td>
					</div>
					<div class="col-md-4">
						<td>[매출]4월매출어떤가요?</td>
					</div>
					<div class="col-md-2">
						<td>사장이될고야1233</td>
					</div>
					<div class="col-md-1">
						<td>like16</td>
					</div>
					<div class="col-md-1">
						<td>댓글10</td>
					</div>
					<div class="col-md-2">
						<td>2023.04.19</td>
					</div>
				</tr>
				<tr>
					<div class="col-md-2">
						<td>2</td>
					</div>
					<div class="col-md-4">
						<td>[일상]등산객진상들 진짜 어쩌죠?</td>
					</div>
					<div class="col-md-2">
						<td>내 꿈은 미슐랭3스타</td>
					</div>
					<div class="col-md-1">
						<td>like12</td>
					</div>
					<div class="col-md-2">
						<td>댓글11</td>
					</div>
					<div class="col-md-2">
						<td>2023.04.18</td>
					</div>
				</tr>
			</table>
		</div>
	</div>
	<!-- 여기까지가 사장세션 접속시 보이는 리얼값 -->
	<%
		} else {
	%>
	<!-- 여기서부터 블러처리 구독결제 유도 -->
	<div class="container blur parent">
		<!-- 블러 클래스를 추가합니다 -->
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table>
				<tr>
					<td class="down">추천게시물</td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
					<td class="top"></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="payment-container"></div>
	<div class="overlay" >
		<!-- 오버레이를 추가합니다 -->
		<button class="subscribe-btn" onclick="requestPayment()">구독 결제하기</button>
	</div>
	
	<div class="container blur">
		<!-- 블러 클래스를 추가합니다 -->
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table" style="border: 1px solid #dddddd">
				<tr>
					<div class="col-md-2">
						<td>1</td>
					</div>
					<div class="col-md-4">
						<td>[매출]4월매출어떤가요?</td>
					</div>
					<div class="col-md-2">
						<td>사장이될고야1233</td>
					</div>
					<div class="col-md-1">
						<td>like16</td>
					</div>
					<div class="col-md-1">
						<td>댓글10</td>
					</div>
					<div class="col-md-2">
						<td>2023.04.19</td>
					</div>
				</tr>
				<tr>
					<div class="col-md-2">
						<td>2</td>
					</div>
					<div class="col-md-4">
						<td>[일상]등산객진상들 진짜 어쩌죠?</td>
					</div>
					<div class="col-md-2">
						<td>내 꿈은 미슐랭3스타</td>
					</div>
					<div class="col-md-1">
						<td>like12</td>
					</div>
					<div class="col-md-2">
						<td>댓글11</td>
					</div>
					<div class="col-md-2">
						<td>2023.04.18</td>
					</div>
				</tr>
			</table>
		</div>
	</div>
	
	<%
		}
	%>
</body>
</html>