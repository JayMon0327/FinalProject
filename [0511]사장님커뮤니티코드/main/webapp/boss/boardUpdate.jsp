<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
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
	bottom: 31px;
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
		<h3>
			<span class="badge rounded-pill text-bg-success">자유게시판 글 수정</span>
		</h3>

		<hr color="green">
		<form action="Board_update" method="post">
			<input name="board_id" value= "${sessionScope.board_id}"
			type="hidden" style="width: 600px;"><br>
			<input name="title" value="${sessionScope.title}" placeholder="제목을 입력해주세요"
				style="width: 600px;"><br> <input name="content"
				value="${sessionScope.content}" placeholder="내용을 입력해주세요" maxlength="1000"
				style="width: 600px; height: 350px;"><br> <input
				type="file" name="SelectFile" /><br>
			<hr color="green">
			<button type="submit" class="btn btn-success">등록</button>
		</form>
	</div>

</body>
</html>