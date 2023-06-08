<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
$(function() {
    $('#1').click(function() {
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/point/exchange",
            data : {
                id : 1
            },
            success : function(data) {
               alert("요청하신 기프티콘 교환되었습니다.");
            },
            error : function(xhr, status, error) {
            	console.log(error.status, error.statusText, error.responseText);
            	alert("포인트 잔액을 확인해주세요.");
            }
        });
    });
});
</script>
</head>
<body>
	<c:forEach items="${list}" var="bag">
		<button id="${bag.id}">${bag.name}
			<img src="${pageContext.request.contextPath}/resources/images/gif${bag.id}.jpg" style="width: 100px; height: 100px;">
		</button>
	</c:forEach>
	<hr color="red">
</body>
</html>