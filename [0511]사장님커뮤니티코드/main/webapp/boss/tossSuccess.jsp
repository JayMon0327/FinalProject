<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
</head>
<body>
    <h1>결제가 완료되었습니다.</h1>
    <p>주문 상품: 사장님 커뮤니티 구독 결제</p>
    <p>결제 금액: <%= request.getParameter("amount")%> 원</p>

    <form action="innerJoinAndInsert" method="post">
        <h2>Store ID를 입력하세요.</h2>
        <input type="text" name="store_id">
        <input type="submit" value="사장회원등록">
    </form>
</body>
</html>
