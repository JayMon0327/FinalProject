package com.mat.zip.boss;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller // 스프링에서 제어하는 역할로 등록!
public class BoardController {

	@Autowired
	BoardDAO dao;
	@Autowired
	ComDAO dao2;
	@Autowired
	Boss_memberDAO dao3;

	@RequestMapping("/boss/Board_insert")
	public void insert(BoardVO bag) {

		System.out.println("insert요청됨.");
		System.out.println(bag);

		dao.insert(bag);

	}

	@PostMapping("/boss/Board_update")
	public String update(@ModelAttribute BoardVO bag, HttpSession session, Model model) {
	    System.out.println("update요청됨.");
	    dao.update(bag);
	    model.addAttribute("bag", bag);
	   System.out.println(bag);
	    // 이전 페이지로 리다이렉트
	    String prevPage = (String) session.getAttribute("prevPage");
	    if (prevPage != null) {
	        return "redirect:" + prevPage;
	    } else {
	        // 이전 페이지 정보가 없는 경우, 기본 페이지로 리다이렉트
	        return "forward:Board_list"; // 이 부분은 원하는 기본 페이지 URL로 변경하세요
	    }
	}


	@RequestMapping("/boss/Board_delete")
	public void delete(int board_id) {
		System.out.println("delete요청됨.");
		System.out.println(board_id);
		dao.delete(board_id);

	}

//	
//
//	
	@RequestMapping("/boss/Board_one")
	public void one(int board_id, Model model) {
		System.out.println("one요청됨.");
		dao.view(board_id);
		BoardVO bag = dao.one(board_id);
		System.out.println(bag);
		model.addAttribute("bag", bag);
	}

	@RequestMapping("/boss/Board_detail")
	public void detail(int board_id, Model model) {
		System.out.println("상세페이지요청됨.");
		BoardVO bag = dao.one(board_id);
		dao.view(board_id);
		List<ComVO> list = dao2.list(board_id);
		List<BoardVO> list2 = dao.list(30);
		model.addAttribute("Com_list", list);
		model.addAttribute("Board_list", list2);
		System.out.println("댓글테이블요청됨");
		model.addAttribute("bag", bag);

	}

	@RequestMapping("/boss/Board_list")
	public void list(Model model) {
		List<BoardVO> list = dao.list(30);
		System.out.println(list.size()); // 사이즈를 찍어보세요.
		model.addAttribute("Board_list", list);
	}

	@PostMapping("/boss/like")
	public ResponseEntity<?> like(HttpSession session, @RequestParam("board_id") int board_id) {
	    String user_id = session.getAttribute("user_id").toString();
	    if (dao.isLikedByUser(user_id, board_id)) {
	        dao.decreaseLikeCount(board_id);
	        dao.removeLike(user_id, board_id);
	    } else {
	        dao.increaseLikeCount(board_id);
	        dao.addLike(user_id, board_id);
	    }
	    int likeCount = dao.getLikeCount(board_id);
	    return new ResponseEntity<>(likeCount, HttpStatus.OK);
	}

	    }

	


//	@RequestMapping("Bbsone")
//	public void Bbsone(int no, Model model) {
//		System.out.println("one요청됨.");
//		System.out.println(no);
//		BoardVO bag = dao.one(no);
//		ArrayList<ReplyVO> list =dao2.list(no);
//		System.out.println(bag);
//		model.addAttribute("list", list);
//		model.addAttribute("bag", bag);
//	}
//	
//	@RequestMapping("list5")
//	public void list5(Model model) {
//		ArrayList<BoardVO> list = dao.list();
//		System.out.println(list.size()); //사이즈를 찍어보세요.
//		model.addAttribute("list", list);
//	}
//	
//	
//	@RequestMapping("one22")
//	@ResponseBody //views로 넘어가지 않고, return값이 bag데이터를 json으로 만들어서 클라이언트로 전송
//	//클라이언트 브라우저에서는 success: function(x);
//	//결과와 함수의 입력변수인 x로 쏙 들어간다 ! 
//	public BoardVO one22(int no) {
//		System.out.println("one요청됨.");
//		System.out.println(no);
//		BoardVO bag = dao.one(no);
//		return bag;
//	}
//	
//	@RequestMapping("list55")
//	@ResponseBody
//	public ArrayList<BoardVO> list55() {
//		ArrayList<BoardVO> list = dao.list();
//		System.out.println(list.size()); //사이즈를 찍어보세요.
//		return list;
//	}

	// https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%9E%90%EB%8F%99%EC%B0%A8

