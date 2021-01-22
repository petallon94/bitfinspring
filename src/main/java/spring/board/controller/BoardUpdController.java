package spring.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.dao.BoardDao;
import spring.dto.BoardDto;
import spring.dto.MemberDto;


@Controller
public class BoardUpdController {
	
	@Autowired
	private BoardDao dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView passform(
			@RequestParam String num,
			@RequestParam String pageNum,
			HttpServletRequest request
			) {
		
		ModelAndView mview = new ModelAndView();
		
		BoardDto dto=dao.getData(num);
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	    
		
		mview.addObject("num", num);
		mview.addObject("mdto",mdto);
		mview.addObject("dto", dto);
		mview.addObject("pageNum", pageNum);
		mview.setViewName("/board/boardupdateform");
		return mview;
		
	}
	
	@PostMapping("board/update")
	public String bupdate(
			@ModelAttribute BoardDto dto,
			@RequestParam String bnum,
			@RequestParam String pageNum,
			HttpServletRequest request
			) {
		
		
		dao.updateBoard(dto);
		return "redirect:boardcontent?bnum="+bnum+"&pageNum="+pageNum;				
	}

}
