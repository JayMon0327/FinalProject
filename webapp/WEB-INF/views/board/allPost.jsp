<%@page import="com.mat.zip.board.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mat.zip.board.PostVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border=1>
	<tr>
		<td class="top">post_id</td>
		<td class="top">board name</td>
		<td class="top">food_cg</td>		
		<td class="top">title</td>
		<td class="top">user_id</td>
		<td class="top">date</td>
		<td class="top">view count</td>
	</tr>

	<c:forEach items="${list}" var="vo">

		<tr>
			<td class="down">${vo.post_id}</td>
			<td class="down">자유게시판</td>
			<td class="down">${vo.food_cg}</td>
			<td class="down"><a href="onePostId?post_id=${vo.post_id}">${vo.post_title}</a></td>
			<td class="down">${vo.user_id}</td>
			<td class="down">${vo.updated_date}</td>
			<td class="down">${vo.post_view_count}</td>
		</tr>

	</c:forEach>
</table>
