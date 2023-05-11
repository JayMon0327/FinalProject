package com.mat.zip.boss;

import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 세션에서 store_id를 가져옴
            String storeId = (String) request.getSession().getAttribute("store_id");

            // 토스 API로부터 받은 파라미터 값
            String orderId = request.getParameter("orderId");
            String orderName = request.getParameter("orderName");
            int amount = Integer.parseInt(request.getParameter("amount"));

            // Unix timestamp를 java.util.Date로 변환
            long requestedAtTimestamp = Long.parseLong(request.getParameter("requestedAt"));
            Date requestedAt = new Date(requestedAtTimestamp * 1000L);  // 초를 밀리초로 변환

            // DTO 객체 생성
            PaymentVO payment = new PaymentVO();
            payment.setStoreId(storeId);
            payment.setOrderId(orderId);
            payment.setOrderName(orderName);
            payment.setAmount(amount);
            payment.setRequestedAt(requestedAt);

            // DAO 객체 생성 및 DB 삽입
            PaymentDao paymentDao = new PaymentDao();
            paymentDao.insertPayment(payment);
            
         // 성공 페이지로 리다이렉트
            response.sendRedirect("paymentSuccess.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


