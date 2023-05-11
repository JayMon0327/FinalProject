<%@page import="com.mat.zip.boss.BoardVO"%>
<%@page import="com.mat.zip.boss.ComVO"%>
<%@page import="com.mat.zip.boss.Boss_memberVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script type="text/javascript">
	$(function() {
		$('#b1').click(function() {
			content = $('#com').val()
			writer = "${user_id}"
			/* regdate = '${bag.regdate}' */
			$.ajax({
				url : "Board_insertcom",
				data : {
					board_id : '${bag.board_id}',
					content : content,
					writer : writer

				},
				success : function(x) {
					$('#result').load(location.href + ' #result')
					/* $('#result').empty();
					$('#result').append(x); */
					/* location.reload(); */
					/* $('#result').append(
						"- " + content + ", " + writer + "<br>") */
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

.id {
	text-align: center;
	position: absolute;
	right: 100px;
	top: 50px;
}
.logout {
	text-align: center;
	position: absolute;
	right: 100px;
	top: 90px;
	z-index: 100;
}

#search {
	position: relative;
	left: 430px;
	bottom: 25px;
}

#main {
	position: relative;
	left: 300px;
}

#main2 {
	position: relative;
	left: 300px;
	bottom: 47px;
} 
</style>
<meta charset="UTF-8">
<title>맛.zip</title>
</head>
<body>

	<h1 style="color: green;" id="main">
	<a href ="board_index.jsp">
		<button class="btn btn-outline-success"
			style="width: 100px; border-bottom: 2px solid green;">
			<em>맛.zip</em>
		</button></a>
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
						<td><a href="owner_login">
								<button style="background-color: #fafafa;">
									<h4>매출,마진계산기</h4>
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
	<div class="container">
		<!--컨테이너  -->
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em><span
						class="badge rounded-pill text-bg-success">자유게시판</span></em></strong>
			</h3>
		</div>
		<br>
		<div class="row" class="col-md-9">
			<!-- 로우설정  -->
			<h3>
				<strong><em>${bag.title}</em></strong>
			</h3>
		</div>
		<div class="row" class="col-md-9">
			<h5>${bag.writer}</h5>
		</div>
		<div class="row" class="col-md-9">
			<h6>${bag.content}</h6>
		</div>
	</div>
	<script>
$(document).ready(function(){
    $('form').on('submit', function(event){
        event.preventDefault(); // 폼의 기본 제출 동작을 방지
        var form = $(this);
        var board_id = form.find('input[name="board_id"]').val();
        
        $.ajax({
            url: form.attr('action'),
            type: 'POST',
            data: {
                board_id: board_id
            },
            success: function(response) {
                // 서버로부터의 응답을 처리
                // 예를 들어, '좋아요' 카운트를 업데이트하는 등의 동작을 여기서 수행할 수 있습니다.
                console.log(response);
            }
        });
    });
});
</script>
	<!-- 좋아요 버튼 -->
<form action="like" method="post">
    <input type="hidden" name="board_id" value="${bag.board_id}">
    <button type="submit">좋아요</button>
</form>

	
	<hr color="green">
	<div id="result">
		<div class="container">
			<div class="row">
				<h4>
					<strong>댓글</strong>
				</h4>
				<table>
					<c:forEach items="${Com_list}" var="bag">
						<tr>
							<em><span style="border-bottom: 2px solid green;">${bag.writer}<br></span></em>
						</tr>
						<tr>${bag.content}<br>
						</tr>
						<tr>
							<fmt:formatDate value="${bag.regdate}" pattern="yyyy-MM-dd HH:mm" />
							<hr>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="container">
		<%
			/* String comid = (String) session.getAttribute("id");
		ComVO combag = (ComVO)request.getAttribute("bag");
		String comwriter = combag.getWriter(); */
		if (session.getAttribute("boss_id") != null) {
		%>
		<h5 style="color: green;">회원:${nickName}</h5>

		<input id="com">
		<button id="b1" class="btn btn-outline-success">작성</button>
		<br>
		<%-- 		<%  if(comid.equals(comwriter)){}%>
	<h5 style="color: green;" class="id">회원:${id}</h5>

			<input id="com">
			<button id="b1">작성</button>
			<br> --%>

		<%
			} else {
		%>로그인시 작성가능<%
			}
		%>
		<!--댓글끝 -->


		<hr color="green">
		<%
			//세션에서 값을 꺼내는 방법
		String id = (String) session.getAttribute("user_id");
		//모델에서 값을 꺼내는 방법
		//model.addAttribute("bag",bag)
		BoardVO bag = (BoardVO) request.getAttribute("bag");
		String writer = bag.getWriter();
		// 접속중인 id와 writer가 같으면 수정 , 삭제버튼 출력
		if (id != null) {
			if (id.equals(writer)) {
				// 세션값으로 아래 내용4개를 저장해서 넘김
		session.setAttribute("board_id", bag.getBoard_id());
		session.setAttribute("title", bag.getTitle());
		session.setAttribute("content", bag.getContent());
		session.setAttribute("writer", bag.getWriter());
		%>
		<a href="boardUpdate.jsp">
			<button class="btn btn-outline-success">수정</button>
		</a> <a href="boardDelete.jsp">
			<button class="btn btn-outline-success">삭제</button>
		</a>
		
		<%
			}
		}
		%>
	</div>
	<br>

	<div class="container">
		<!--컨테이너  -->
		<div class="row">
			<!-- 로우설정  -->
			<table class="table"
				style="text-align: center; border: 1px solid #dddddd">
				<tr class="table-success">
					<td><input type="hidden" id></td>
					<div class="col-md-6">
						<td>제목</td>
					</div>
					<div class="col-md-1">
						<td>글쓴이</td>
					</div>
					<div class="col-md-3">
						<td>작성시간</td>
					</div>
					<div class="col-md-1">
						<td>조회수</td>
					</div>
					<div class="col-md-1">
						<td>좋아요</td>
					</div>
				</tr>
				<c:forEach items="${Board_list}" var="bag">
					<tr>
						<td><input type="hidden" ${bag.board_id}></td>
						<td><a href="Board_detail?board_id=${bag.board_id}">${bag.title}</a></td>
						<td>${bag.writer}</td>
						<td><fmt:formatDate value="${bag.regdate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td>${bag.viewscount}</td>
						<td>${bag.likecount}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- <form action="Board_like" method="get">
	<button>좋아요</button>
</form> -->
</body>
</html>