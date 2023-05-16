package com.mat.zip.boss;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Boss_memberDAO { // CRUD
	@Autowired
	SqlSessionTemplate my;

	public void innerJoinAndInsert(Boss_memberVO bag) {
        my.insert("boss.insertJoinedData", bag);
    }

	public Boss_memberVO login(Boss_memberVO bag) {
		return my.selectOne("boss.boss_login", bag);
		
	}
//	public int update(Boss_memberVO bag) {
//		int result = my.update("boss.up", bag);
//		return result;
//	}
//
//	public int delete(String id) {
//
//		int result = my.delete("boss.del", id);
//
//		return result;
//
//	}
//
//	public Boss_memberVO one(String id) {
//		Boss_memberVO bag = my.selectOne("boss.one", id);
//
//		return bag;
//
//	}// one
//
//	public List<Boss_memberVO> list() {
//		List<Boss_memberVO> list = my.selectList("boss.list");
//		System.out.println(list.size());
//		return list;
//
//	}

}
