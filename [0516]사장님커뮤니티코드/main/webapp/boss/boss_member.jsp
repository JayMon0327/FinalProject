<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>로그인 화면입니다.</h3>
	<hr color="red">
	<form action="member_login" method="get">
		id : <input name="id" value="apple"><br> pw : <input
			name="pw" value="1234"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr color="red">

	 <h3>회원가입 화면입니다.</h3>
	<hr color="red">
	<form action="member_insert" method="get">
		id : <input name="id" value="apple"><br> pw : <input
			name="pw" value="1234"><br> homeNum : <input
			name="homeNum" value="1234"><br> address : <input
			name="address" value="1234"><br> address_de : <input
			name="address_de" value="1234"><br> picture : <input
			name="picture" value="1234"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr color="red"> 
	
</body>
</html>
