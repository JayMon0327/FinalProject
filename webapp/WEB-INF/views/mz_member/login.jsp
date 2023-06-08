<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛.zip 로그인</title>
<meta charset="utf-8">
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
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>
        </nav>
      </div>
    </header>
	        <!-- End header section -->
	<form action="login" method="post">
		<div class="member-container">
			<h1 style="text-align: center; margin-top: 20px;">LOGIN</h1>
			<hr style="border: solid 2px;">

			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control  pl-1r" id="user_id" placeholder="이메일을 입력하세요."
					name="user_id">
			</div>

			<div class="form-group">
				<label for="usr">비밀번호</label> <input type="text"
					class="form-control  pl-1r" id="password"
					placeholder="비밀번호를 입력하세요." name="password">
			</div>
			<hr>
			<div style="text-align: center;">
				<c:if test="${memberVal == null}">
					<button type="submit" class="btn p2-10"
						style="width: 320px; background-color: #dcdcdc" id="loginCk">로그인</button>
				</c:if>
				<c:if test="${msg eq 'miss'}">
			<p style="color: red;" >로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
			</div>
			<hr style="border: solid 1px;">
		</div>
	</form>
	<!-- 컨트롤러에서 Url이 넘어옴 -->
	<div class="OAuth-btn" id="naver_id_login" style=""><a href="${naverUrl}">
	<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
	
	<div class="OAuth-btn" style="">
	<a id="kakao-login-btn" href="${kakaoUrl}">
	  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="223"
	    alt="카카오 로그인 버튼" />
	</a>
	<p id="token-result"></p>
	</div>
	<div class="member-container">
    	<div class="form-group">
			<p style="text-align: center; font-size: small;">
				맛.zip이 처음이신가요? <a href="signUp"
					style="font-size: small; color: green; font-weight: 700; padding-left: 5px;">회원가입</a>
			</p>
		</div>
    </div>
</body>
</html>