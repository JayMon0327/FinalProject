<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
</head>
<body>
    <h1>결제가 완료되었습니다.</h1>
    <p>주문 상품: <%= request.getParameter("orderName") %></p>
    <p>결제 금액: <%= request.getParameter("amount") %> 원</p>
</body>
</html>
