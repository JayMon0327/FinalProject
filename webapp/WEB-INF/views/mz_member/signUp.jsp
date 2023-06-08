<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String valid_user_id = (String) request.getAttribute("valid_user_id"); %>
<% String valid_password = (String) request.getAttribute("valid_password"); %>
<% String valid_name = (String) request.getAttribute("valid_name"); %>
<% String valid_gender = (String) request.getAttribute("valid_gender"); %>
<% String valid_birthDate = (String) request.getAttribute("valid_birthDate"); %>
<% String valid_phNum = (String) request.getAttribute("valid_phNum"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>맛.zip 회원가입</title>
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

  <script type="text/javascript">
  $(function(){
	  
	  $('#emailCheck-Btn').click(function(){
		  const email = $('#user_id').val();
		  console.log('회원 이메일: ' + email);
		  alert('인증번호가 전송되었습니다.');
		  $.ajax({
			  type: 'GET',
			  url: '<c:url value="/mz_member/mailCheck?email="/>' + email,
			  success: function(data){
				  console.log("data: " + data);
				  $('#authInput').removeAttr('disabled');
				  code = data;
			  }, 
			  error: function(e){
				alert('이메일 전송 중 오류가 났습니다.' + e);  
			  }
		  })
	  }) //이메일 인증 버튼 클릭 시
	  
	  $('#authInput').change(function() {
			const inputCode = $(this).val();
			const resultMsg = $('#mail-warn');
			
			if (inputCode == code) {
				resultMsg.html('인증번호가 일치합니다.');
				resultMsg.css('color', 'green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#user_id').attr('readonly',true);
				$('#signUp').removeAttr('disabled');
			} else {
				resultMsg.html('인증번호가 불일치 합니다. 다시 확인해 주세요.');
				resultMsg.css('color', 'red');
				$('#signUp').attr("disabled", "disabled");
			}  
			}) //인증번호 확인 메서드
  
	$('#pwCheck').change(function() {
		
  		if($('#password').val() != '' && $('#pwCheck').val() != '') {
	  		if($('#password').val() == $('#pwCheck').val()) {
	  			document.getElementById('pwCk').innerHTML='비밀번호가 일치합니다.'
	  			document.getElementById('pwCk').style.color='blue';
	  			//$('#signUp').removeAttr("disabled");
	  		} else {
	  			document.getElementById('pwCk').innerHTML='비밀번호가 일치하지 않습니다.'
	  			document.getElementById('pwCk').style.color='red';
	  		}
  		}
  	}) //비밀번호 확인 메서드
  
  }) //$
  	
  	</script>
</head>
<body>
	        <!-- header section strats -->
    <header class="header_section" style="background-color: #343a40;">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <span>
              Mat.zip
            </span>
          </a>
        </nav>
      </div>
    </header>
	
<form action="signUp" method="post" accept-charset="utf-8">
<div class="member-container">

  <h1 style="text-align: center; margin-top: 20px;">SIGN UP</h1>
  <hr style="border: solid 2px;">

    <div class="form-group" style="margin-bottom: 0;">
      <label for="user_id">이메일</label>
	 	<div class="input-group">
     		<input type="email" class="form-control pl-1r" id="user_id" value="${memberDTO.user_id}" placeholder="이메일을 입력해 주세요." name="user_id">
     	<div class="input-group-btn" style="padding-bottom: 0; padding-top: 0">
      		<button class="btn btn-default p2-10" type="button" id = "emailCheck-Btn" style="background-color: #dcdcdc;">이메일 인증</button>
    	</div>
  		</div>
  	</div>
  	
    <div class="form-group">
      <input type="text" class="form-control pl-1r" id="authInput" placeholder="인증번호를 입력해 주세요." name="authInput" disabled="disabled">
      <span id="mail-warn"></span>
      <% if(valid_user_id != null) { %>
  		<span id="valid"><%= valid_user_id %></span>
      <% } %>
  	</div>
	 
    <div class="form-group" style="margin-bottom: 0;">
      <label for="password">비밀번호</label>
      <input type="text" class="form-control pl-1r" id="password" value="${memberDTO.password}" placeholder="대소문자, 특수문자를 포함하여 입력하세요." name="password">
      <% if(valid_password != null) { %>
      <span id="valid"><%= request.getAttribute("valid_password") %></span>>
      <% } %>
    </div>
	 
    <div class="form-group">
      <label for="pwCheck">비밀번호 확인</label>
      <input type="text" class="form-control pl-1r" id="pwCheck" value="${memberDTO.pwCheck}" placeholder="비밀번호를 한번 더 입력해 주세요." name="pwCheck">
      <span id="pwCk"></span>
    </div>
      
    <div class="form-group" style="margin-bottom: 5px;">
      <label for="name">이름</label>
      <input type="text" class="form-control pl-1r" id="name" name = "name" value="${memberDTO.name}" placeholder="이름을 입력하세요.">
      <% if(valid_name != null) { %>
      <span id="valid"><%= request.getAttribute("valid_name") %></span>
      <% } %>
    </div>
	  
      <div class="gender" style="text-align: center;">
    	<label class="radio-inline">
      	  <input type="radio" name="gender" value="남">남
    	</label>
    	<label class="radio-inline">
      	  <input type="radio" name="gender" value="여">여
    	</label>
    </div>
    <div class="form-group" style="text-align: center; margin-bottom: 0;">
      <% if(valid_gender != null) { %>
    	<span><%= valid_gender %></span>
      <% } %>
    </div>
    
    
    <div class="form-group">
      <label for="birthDate">생년월일</label>  
      <input type="date" class="form-control pl-1r" id="birthDate" name = "birthDate" value="${memberDTO.birthDate}" placeholder="생년월일을 입력하세요.">
      <% if(valid_birthDate != null) { %>
      <span id="valid"><%= valid_birthDate %></span>
      <% } %>
    	</div>

    <div class="form-group">
      <label for="phNum">전화 번호</label>  
      <input type="text" class="form-control pl-1r" id="phNum" value="${memberDTO.phNum}" placeholder="-를 포함하여 11자리를 입력해 주세요." name="phNum">
      <% if(valid_phNum != null) { %>
      <span id="valid"><%= valid_phNum %></span>
      <% } %>
    	</div>
    		<hr style="margin-top: 25px; margin-bottom: 25px;">
        	<button type="submit" class="btn bt-1" id="signUp" name="signUp"  disabled="disabled">가입하기</button> &ensp;&nbsp;
        	<button type="button" class="btn p2-10 bt-1" name="noSignUp" onclick="location.href='index.jsp'">가입취소</button>
	</div>
</form>
	<div class="member-container">
		<div class="form-group">
			  <p style="text-align: center; font-size: small; margin: 13px 0px;">
			     맛.zip의 회원이신가요? <a href="login" style="font-size: small; color: green; font-weight: 700; padding-left: 5px;">로그인</a>
			  </p>
		</div>
</div>
</body>
</html>