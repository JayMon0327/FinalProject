package com.mat.zip.boss;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    @Autowired
    SqlSession sqlSession;
    
    @Autowired
	SqlSessionTemplate my;
    
    public MemberVO login(MemberVO bag) {
		return my.selectOne("member.member_login", bag);

	}
}
