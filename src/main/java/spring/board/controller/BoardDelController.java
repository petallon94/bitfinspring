package spring.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.board.dao.BoardDao;
import upload.util.SpringFileWriter;

@Controller
public class BoardDelController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView delform(
			@RequestParam String num
			) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("num", num);
		//mview.addObject("pageNum",pageNum);
		
		mview.setViewName("/board/boarddelete");
		return mview;
	}
	
	
	@PostMapping("/board/delete")
	public String deleteBoard(
			@RequestParam String num,
			HttpServletRequest request
			) {
		
			dao.deleteBoard(num);
			return "redirect:list?";
			
		}
	

}
