<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 수정 </title>
<meta charset="utf-8" content="charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <!-- nice select  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <!-- font awesome style -->
  <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet" />
<style type="text/css">
	input{
		margin-bottom: 15px;
	}
</style>

</head>
<body>
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
        </nav>
      </div>
    </header>
	
	<div class="member-container">

  <h1 style="text-align: center; margin-top: 20px;">${memberInfo.nickName} 님의 정보</h1>
  <hr style="border: solid 2px;">

    <div class="form-group">
    
      <label for="user_id">이름</label>
     		<input type="email" class="form-control pl-1r" id="user_id" value="${memberInfo.name}" placeholder="이메일을 입력하세요." name="user_id">
	 
      <label for="password">닉네임</label>
      <input type="text" class="form-control pl-1r" id="password" value="${memberInfo.nickName}" placeholder="비밀번호를 입력하세요." name="password" onchange="pwCheckMethod()">
	 
      <label for="pwCheck">성별</label>
      <input type="text" class="form-control pl-1r" id="pwCheck" value="${memberInfo.gender}" placeholder="비밀번호를 한번 더 입력해 주세요." name="pwCheck" onchange="pwCheckMethod()">

      <label for="name">출생일자</label>
      <input type="text" class="form-control pl-1r" id="name" name = "name" value="${memberInfo.birthDate}" placeholder="">
    
      <label for="name">가입 일자</label>
      <input type="text" class="form-control pl-1r" id="name" name = "name" value="${memberInfo.accountDate}" placeholder="이름을 입력하세요.">

    <hr style="margin-top: 25px; margin-bottom: 25px;">
    <div style="margin: auto;">
        	<button type="submit" class="btn p2-10 bt-1" id="signUp" name="signUp" style="width: 100%;">정보 수정하기</button>
    </div>
    	</div>
    </div>
    
    <div class="member-container">
			  <p style="text-align: center; font-size: small;">
			     맛집 보러가기 <a href="/tastezip/index.jsp" style="font-size: small; color: green; font-weight: 700; padding-left: 5px;">맛.zip</a>
			  </p>
</div>
</body>
</html>