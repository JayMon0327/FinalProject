<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  $(document).ready(function() {
	  
    });
</script>
<div style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
    <h3>Kakao_Login Success</h3>
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라짐 
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/index.jsp"},2000);
		// 2초 뒤에 메인 화면으로  
    
    })
  </script>
</body>
</html>