package com.mat.zip.boss;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

public class PaymentDao {
    public void insertPayment(PaymentVO payment) {
        try {
            // 데이터베이스 연결
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "username", "password");

            // SQL 쿼리 준비
            String sql = "INSERT INTO payment (store_id, order_id, order_name, amount, requestedAt) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // 파라미터 설정
            pstmt.setString(1, payment.getStoreId());
            pstmt.setString(2, payment.getOrderId());
            pstmt.setString(3, payment.getOrderName());
            pstmt.setInt(4, payment.getAmount());
            pstmt.setTimestamp(5, new Timestamp(payment.getRequestedAt().getTime()));

            // 쿼리 실행
            pstmt.executeUpdate();

            // 리소스 정리
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

