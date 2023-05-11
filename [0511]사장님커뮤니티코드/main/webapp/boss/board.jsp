<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재 게시물 조회수 ${count}
	<%
		if (session.getAttribute("id") != null) {
	%>
	<h3>게시물등록 화면입니다.</h3>
	<hr color="red">
	<form action="Board_insert" method="get">

		writer : <input name="writer" value="jason"><br> title :
		<input name="title" value="오늘은~"><br> content : <input
			name="content" value="화요일~"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr color="red">
	<h3>게시물수정 화면입니다.</h3>
	<hr color="red">
	<form action="Board_update" method="get">
		board_id : <input name="board_id"><br> content : <input
			name="content" value="오늘은~"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr color="red">
	<h3>게시물삭제 화면입니다.</h3>
	<hr color="red">
	<form action="Board_delete" method="get">
		board_id : <input name="board_id"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<h3>게시물검색 화면입니다.</h3>
	<hr color="red">
	<a href="Board_list">모든 게시판 리스트 가지고 오기</a>
	<hr color="red">
	<form action="Board_one" method="get">
		board_id : <input name="board_id" value="2"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<%
		} else {
	%>
	<a href="ownermember.jsp">
		<button style="background: pink;">회원가입화면으로go</button>
	</a>


	<%
		}
	%>
	<hr color="red">

</body>
</html>