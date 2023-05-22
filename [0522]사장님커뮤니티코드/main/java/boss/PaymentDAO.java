package com.mat.zip.boss;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {

	@Autowired
    private SqlSession sqlSession;

    public void insert(PaymentVO paymentVO) {
    	System.out.println("Before insert: " + paymentVO.getStoreId());  // 이 부분을 추가
        sqlSession.insert("payment.insert", paymentVO);
    }
}
