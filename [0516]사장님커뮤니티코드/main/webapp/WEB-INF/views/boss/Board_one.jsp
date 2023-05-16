<%@page import="com.mat.zip.boss.BoardVO"%>
<%@page import="com.mat.zip.boss.ComVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#b1').click(
				function() {
					content = $('#com').val()
					writer = 'dao'
					/* regdate = '${bag.regdate}' */
					$.ajax({
						url : "Board_insertcom",
						data : {
							board_id : '${bag.board_id}',
							content : content,
							writer : writer

						},
						success : function(x) {
							$('#result').append(
									"- " + content + ", " + writer + "<br>")
						},
						error : function() {
							alert('computer요청 실패!')
						}//error
					})//ajax
				})//b1
	})//$
</script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap')
	;

body {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

td {
	width: 200px;
	text-align: center;
}

.top0 {
	background: gray;
	color: green;
}

.top {
	background: white;
	color: black;
}

.down {
	
}

#id {
	text-align: center;
	position: absolute;
	right: 10px;
	top: 10px;
}

#search {
	position: absolute;
	right: 500px;
	top: 30px;
}

.main {
	position: relative;
	left: 250px;
}
</style>
</head>
<body>
	<h1 style="color: green;" class="main">
		<em><span style="border-bottom: 2px solid green;"><a
				href="board2.jsp">맛.zip</a></span></em>
	</h1>
	<h3 style="color: gray;" class="main">
		<em><span style="border-bottom: 2px solid gray;">사장님</span></em>
	</h3>
	<form action="Board_one" method="get" id="search">
		검색어 : <input name="board_id" value="2">
		<button type="submit">검색</button>
	</form>
	<%
		if (session.getAttribute("id") != null) {
	%>
	<h3 style="color: green;" class="id">${id}님</h3>
	<%
		} else {
	%><a href="owner_login.jsp">
		<button style="background: green;">로그인</button>
	</a>
	<a href="owner_member.jsp">
		<button style="background: pink;">회원가입화면으로go</button>
	</a>
	<%
		}
	%>
	<hr color="green">

	<table>
		<tr>
			<td class="top0"><a href="owner_login">
					<button style="background: gray;">
						<h4>매출,마진계산기</h4>
					</button>
			</a></td>
			<td class="top0"><a href="owner_login">
					<button style="background: gray;">
						<h4>맛 News</h4>
					</button>
			</a></td>
			<td class="top0"><a href="Board_list">
					<button style="background: grey;">
						<h4 style="color: green">자유게시판</h4>
					</button>
			</a></td>
			<td class="top0"><a href="owner_login">
					<button style="background: gray;">
						<h4>전문가QnA</h4>
					</button>
			</a></td>
			<td class="top0"><h4></h4></td>
			<td class="top0"><h4></h4></td>
		</tr>
	</table>
	<hr color="green">
	<table>
		<tr>
			<td class="top"><input type="hidden" id></td>
			<td class="top">제목</td>
			<td class="top">글쓴이</td>
			<td class="top">작성시간</td>
			<td class="top">조회수</td>
			<td class="top">좋아요</td>
		</tr>
		<tr>
			<td class="down"><input type="hidden" ${bag.board_id}></td>
			<td class="down"><a href="Board_detail?board_id=${bag.board_id}">${bag.title}</a></td>
			<td class="down">${bag.writer}</td>
			<td class="down">${bag.regdate}</td>
			<td class="down">${bag.viewscount}</td>
			<td class="down">${bag.likecount}</td>
		</tr>
	</table>
	<hr color="green">
	<%-- 댓글달기<input id="com"><button id="b1">댓글달기</button><br>
<div id="result">
<table>

<c:forEach items="${list}" var="bag" >
<tr>
	<td class="down">${bag.board_id}</td>
			<td class="down">${bag.writer}</td>
			<td class="down"><a href="Board_one?board_id=${bag.board_id}">${bag.title}</a></td>
			<td class="down">${bag.content}</td>
			<td class="down">${bag.regdate}</td>
			<td class="down">${bag.updatedate}</td>
			<td class="down">${bag.deletedate}</td>
			<td class="down">${bag.viewscount}</td>
			<td class="down">${bag.likecount}</td>
</tr>
</c:forEach>
</table>
</div>
<hr color="red">
<a href="Board.jsp">처음페이지로</a>
<a href="Board_list">게시물 전체 목록 페이지</a>
<%
//세션에서 값을 꺼내는 방법
String id=(String)session.getAttribute("id");
//모델에서 값을 꺼내는 방법
//model.addAttribute("bag",bag)
BoardVO bag =(BoardVO)request.getAttribute("bag");
String writer = bag.getWriter();
if(id !=null){
if(id.equals(writer)){
%>
<a href="update2.multi?no=${bag.board_id}">
	<button style="background: pink ">수정</button>
	</a>
<a href="delete2.multi?no=${bag.board_id}">
	<button style="background: pink ">삭제</button>
	</a>
	<%}else{ %>
<h3>게시판검색 처리 요청이 완료되었습니다.</h3><br>
<table>
<tr>
	<td class="top">id</td>
		<td class="top">작성자</td>
		<td class="top">제목</td>
		<td class="top">내용</td>
		<td class="top">작성시간</td>
		<td class="top">수정날짜</td>
		<td class="top">삭제시간</td>
		<td class="top">조회수</td>
		<td class="top">좋아요</td>
</tr>
<tr>
	<td class="down">${bag.board_id}</td>
			<td class="down">${bag.writer}</td>
			<td class="down"><a href="Board_one?board_id=${bag.board_id}">${bag.title}</a></td>
			<td class="down">${bag.content}</td>
			<td class="down">${bag.regdate}</td>
			<td class="down">${bag.updatedate}</td>
			<td class="down">${bag.deletedate}</td>
			<td class="down">${bag.viewscount}</td>
			<td class="down">${bag.likecount}</td>
</tr>
</table>
<hr color="red">
댓글달기<input id="reply"><button id="b1">댓글달기</button><br>
<div id="result">
<%}} %>
<form action="Board_like" method="get">
	<button>좋아요</button>
</form>  --%>
</body>
</html>