<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: yellow;
}

td {
	width: 100px;
	text-align: center;
}

.top {
	background: black;
	color: white;
}

.down {
	background: lime;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td class="top">아이디</td>
			<td class="top">타입</td>
			<td class="top">포인트</td>
		</tr>
		<c:forEach items="${list}" var="bag">
			<tr>
				<td class="down">${bag.user_id}</td>
				<td class="down">${bag.type}</td>
				<td class="down">${bag.point}</td>
			</tr>
		</c:forEach>
	</table>
</html>