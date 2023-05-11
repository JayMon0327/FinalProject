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

//테이블 하나당 DAO 하나 ! -->CUD를 완성 !! 
@Component
public class ComDAO {

	@Autowired
	SqlSessionTemplate my;

	public int insert(ComVO bag) {
		int result = my.insert("com.create", bag);
		return result;
	}

	public int update(ComVO bag) {
		int result = my.update("com.up", bag);
		return result;
	}

	public int delete(int com_id) {
		int result = my.update("com.del", com_id);
		return result;

	}

	public ComVO one(int board_id) {
		ComVO bag = my.selectOne("com.one", board_id);
		return bag;
	}// one

	public List<ComVO> list(int board_id) {
		List<ComVO> list = my.selectList("com.list", board_id);
		System.out.println(list.size());
		return list;

	} // list

}
