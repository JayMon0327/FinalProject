<%@page import="com.mat.zip.board.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table border=1>
	<tr>
		<td class="top">review_id</td>
		<td class="top">board name</td>
		<td class="top">store name</td>		
		<td class="top">store food category</td>
		<td class="top">review title</td>
		<td class="top">user_id</td>
		<td class="top">date</td>
		<td class="top">view count</td>
	</tr>

	<c:forEach items="${review}" var="reviewVO">

		<tr>
			<td class="down">${reviewVO.review_id}</td>
			<td class="down">리뷰게시판</td>
			<td class="down">${reviewVO.store_id}</td>
			<td class="down">${reviewVO.store_cg}</td>
			<td class="down"><a href="oneReviewId?review_id=${reviewVO.review_id}">${reviewVO.review_title}</a></td>
			<td class="down">${reviewVO.user_id}</td>
			<td class="down">${reviewVO.updated_date}</td>
			<td class="down">${reviewVO.review_view_count}</td>
		</tr>

	</c:forEach>
	
</table>
