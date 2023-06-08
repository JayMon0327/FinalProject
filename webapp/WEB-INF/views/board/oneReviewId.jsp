<%@page import="com.mat.zip.board.ReviewVO"%>
<%@page import="com.mat.zip.board.ReviewComVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"> /* ajax */ 
	
	// JSP로부터 값을 가져와 JavaScript 변수에 저장
	var review_id = parseInt("${data.review_id}");
	
	$(function() {
		
		// 게시글 로드 완료 후 조회수 증가 요청
		$.ajax({
		    url : "incrementReviewViewCount",
		    data : {
		        review_id : review_id
		    },
		    success : function() {
		        console.log("조회수 증가");
		    },
		    error : function(request, status, error) {
		        console.log("오류 발생");
		    }
		});
		
	}) // function

	</script>
	
	
	<a href="boardReview.jsp">
		<button style="background: #c5ff9c;">리뷰게시판으로 돌아가기</button>
	</a>
	<hr color="red">
	<br>
	review id : ${data.review_id} <br> 
	user id : ${data.user_id} <br>
	<br>
	상호명 : ${data.store_id} <br>
	판매 음식 종류 : ${data.store_cg} <br>
	<br>
	${user_id} 님의 선호 음식 카테고리 : ${data.category} <br>
	<br>
	<br>
	제목 : ${data.review_title} <br>
	내용 : ${data.review_content} <br>
	<c:choose>
	  <c:when test="${not empty data.review_file}">
	    <img src="${pageContext.request.contextPath}/resources/img/${reviewVO.review_file}" width=300 height=300> <br>
	  </c:when>
	  <c:otherwise>
	    <p style="color:#919191">첨부 이미지가 없습니다.</p>
	  </c:otherwise>
	</c:choose>
	<br>
	작성 시간 : ${data.created_date}  /  게시물 최종 수정 시간 : ${data.updated_date}
	<br>
	
	<hr color="red">
	<c:choose>
	    <c:when test="${session.getAttribute('user_id') == writerId}">
	        <button id="updateBtn">게시물 수정</button>
	        <button id="deleteBtn">게시물 삭제</button>
	    </c:when>
	</c:choose>
	
	<hr color="red">
	
	<c:choose>
	    <c:when test="${session.getAttribute('user_id') != null}">
	        회원 ID : <input id="user_id" value="${user_id}" readonly/><br>
	        댓글달기 <input id="postCom"> <button id="b1">댓글달기</button>
	    </c:when>
	    <c:otherwise>
	        <input id="user_id" type="hidden" value="${user_id}">
	        댓글달기 <input id="postCom"> <button id="b1">댓글달기</button>
	    </c:otherwise>
	</c:choose>
	
	
</body>

</html>