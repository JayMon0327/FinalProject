package com.mat.zip.boss.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mat.zip.boss.model.PaymentVO;

@Repository
public class PaymentDAO {

	@Autowired
    private SqlSession sqlSession;

    public void insert(PaymentVO paymentVO) {
    	System.out.println("Before insert: " + paymentVO.getStoreId());  // 이 부분을 추가
        sqlSession.insert("payment.insert", paymentVO);
    }
}
