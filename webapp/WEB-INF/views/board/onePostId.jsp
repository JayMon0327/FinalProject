<%@page import="com.mat.zip.board.PostVO"%>
<%@page import="com.mat.zip.board.PostComVO"%>
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
<script type="text/javascript">

// JSP로부터 값을 가져와 JavaScript 변수에 저장
var userId = "${vo.user_id}";
var writerId = "${vo.user_id}";
var post_id = parseInt("${vo.post_id}");


$(function() {
	// 댓글 list 요청 
	$.ajax({
	    url: "postComList",
	    type: "GET",
	    data : {
	    	post_id : post_id
	    },
	    success : function(data) {
	      // 댓글 리스트를 가져와서 화면에 출력 
	      for (var i = 0; i < data.length; i++) {
  			var postCom = data[i];
  			var updatedDate = new Date(postCom.updated_date); // 새 Date 객체 생성
  			var postComElement = "<p>" + postCom.post_comment + ", " + postCom.user_id + "</p>" +
                       "<p>댓글 작성 시간: " + updatedDate.toLocaleString() + "</p><hr>";
  			$("#postComList").append(postComElement);
		} // for 
	    }, // success 
	    error : function(jqXHR, textStatus, errorThrown) {
	      console.log(textStatus, errorThrown);
	    } // error 
	  }); // ajax 
	
	// 게시글 로드 완료 후 조회수 증가 요청
	$.ajax({
		url : "increasePostViewCount",
		data : {
			post_id : post_id
		},
		success : function() {
			console.log("조회수 증가");
		},
		error : function(request, status, error) {
			console.log("오류 발생");
		}
	});
	
	$("#b1").click(function() {
		var userId = $("#user_id").val(); // input 필드에서 사용자 ID 가져오기
		var post_comment = $("#postCom").val(); // 댓글 내용 
		if (!userId) { // 사용자가 로그인하지 않은 상태
	        alert("로그인 후 댓글을 작성할 수 있습니다.");
	        return;
	    }
		
		$.ajax({
			type : "POST", // 요청 방식을 POST로 지정
			url : "createPostCom",
			data : {
				post_id: post_id,
				user_id: userId, 
				post_comment: post_comment 
			},
			success : function() {
				alert("댓글 달기 성공!");
				var newRow = "<tr><td>" + userId + "</td><td>" + post_comment + "</td><td>" + new Date().toLocaleString() + "</td></tr>";
				$("#postCommentInsert").append(newRow);
				$("#postCom").val('');
			}, // success
			error: function() {
				alert("댓글 달기 실패!");
			}
		}); // ajax  
	}); // b1 
	
 	// 수정 버튼 클릭 시
    $("#updateBtn").click(function() {
    	if (confirm("정말로 게시물을 수정하시겠습니까?")) {
    		location.href = "updatePost.jsp?post_id=" + post_id;	
    	}
    });
	
 	// 삭제 버튼 클릭 시
    $("#deleteBtn").click(function() {
        if (confirm("정말로 게시물을 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "deletePost",
                data: { 
                	post_id: post_id,
                	user_id: userId
                },
                success: function() {
                    alert("게시물이 삭제되었습니다.");
                    window.location.href = "boardPost.jsp";
                },
                error: function() {
                    alert("게시물 삭제에 실패했습니다.");
                }
            });
        }
    });
});

</script>

<a href="boardPost.jsp">
		<button style="background: pink;">자유게시판으로 돌아가기</button>
	</a>
<hr color="red">
<br>
post id : ${vo.post_id} <br> 
user id : ${vo.user_id} <br>
게시물의 음식 카테고리 : ${vo.food_cg} <br>
${user_id} 님의 선호 음식 카테고리 : ${vo.category} <br>
<br>
제목 : ${vo.post_title} <br>
내용 : ${vo.post_content} <br>
<c:choose>
  <c:when test="${not empty vo.post_file}">
    <img src="${pageContext.request.contextPath}/resources/img/${vo.post_file}" width=300 height=300> <br>
  </c:when>
  <c:otherwise>
    첨부 이미지가 없습니다.
  </c:otherwise>
</c:choose>
<br>
작성 시간 : ${vo.created_date}  /  게시물 최종 수정 시간 : ${vo.updated_date}
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

<hr color="green">

<div id="postCommentInsert">
	<c:forEach items="${postComList}" var="postCom"> 
	- ${postCom.content}, ${postCom.writer} <br>
	댓글 작성 시간 : ${postCom.updated_date} <br> <br>
	</c:forEach>
</div>

<div id="postComList"></div>

</body>
</html>