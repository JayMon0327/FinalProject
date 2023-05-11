package com.mat.zip.boss;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // 스프링에서 제어하는 역할로 등록!
public class ComController {

	@Autowired
	ComDAO dao;
//	@Autowired
//	ReplyDAO dao2;

	@RequestMapping("/boss/Board_insertcom")
	public void insert(ComVO bag, int board_id, Model model) {
		List<ComVO> list = dao.list(board_id);
		System.out.println("insert요청됨.");
		System.out.println(bag);
		model.addAttribute("Com_list", list);
		dao.insert(bag);
	}

	@RequestMapping("/boss/Com_update")
	public void update(ComVO bag) {
		System.out.println("update요청됨.");
		System.out.println(bag);
		dao.update(bag);
	}

	@RequestMapping("/boss/Com_delete")
	public void delete(int reply_id) {
		System.out.println("delete요청됨.");
		System.out.println(reply_id);
		dao.delete(reply_id);
	}

//	
//
//	
	@RequestMapping("Com_one")
	public void one(int Com_id, Model model) {
		System.out.println("one요청됨.");
		ComVO bag = dao.one(Com_id);
		System.out.println(bag);
		model.addAttribute("bag", bag);
	}

//	@RequestMapping("Com_list")
//	public void list(Model model) {
//		List<ComVO> list = dao.list();
//		System.out.println(list.size()); //사이즈를 찍어보세요.
//		model.addAttribute("Com_list", list);
//	}

//	
//	@RequestMapping("list5")
//	public void list5(Model model) {
//		ArrayList<ComVO> list = dao.list();
//		System.out.println(list.size()); //사이즈를 찍어보세요.
//		model.addAttribute("list", list);
//	}
//	
//	@RequestMapping("Bbsone")
//	public void Bbsone(int no, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(no);
//		ComVO bag = dao.one(no);
//		ArrayList<ReplyVO> list =dao2.list(no);
//		System.out.println(bag);
//		model.addAttribute("list", list);
//		model.addAttribute("bag", bag);
//	}
//	
//	@RequestMapping("one22")
//	@ResponseBody //views로 넘어가지 않고, return값이 bag데이터를 json으로 만들어서 클라이언트로 전송
//	//클라이언트 브라우저에서는 success: function(x);
//	//결과와 함수의 입력변수인 x로 쏙 들어간다 ! 
//	public ComVO one22(int no) {
//		System.out.println("one요청됨.");
//		System.out.println(no);
//		ComVO bag = dao.one(no);
//		return bag;
//	}
//	
//	@RequestMapping("list55")
//	@ResponseBody
//	public ArrayList<ComVO> list55() {
//		ArrayList<ComVO> list = dao.list();
//		System.out.println(list.size()); //사이즈를 찍어보세요.
//		return list;
//	}

	// https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%8F%99%EC%B0%A8

}