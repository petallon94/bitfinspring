package spring.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.answer.dao.AnswerDao;
import spring.board.dao.BoardDao;
import spring.board.dao.BoardDaoInter;
import spring.dto.BoardDto;
import spring.dto.MemberDto;
import spring.member.service.MemberServiceInter;


@Controller
public class BoardContentController {
	
	@Autowired
	private BoardDao dao;
	private AnswerDao adao;
	//private MemberServiceInter mservice;
	
	
	@GetMapping({"/board/boardcontent"})
	public ModelAndView bcontent(
			@RequestParam("bnum") String bnum,
			@RequestParam("pageNum") String pageNum,
			@RequestParam(required = false) String key,
			HttpServletRequest request/*필수입력아님,null값허용*/
			)
	{
		ModelAndView mview=new ModelAndView();
		
		//System.out.println("bnum is "+ bnum);
		
		//key 가 널이 아닌경우 조회수 1 증가
		 dao.updateReadCount(bnum);
		 //dto 얻기
		
		BoardDto dto=dao.getData(bnum);
		//
		List<BoardDto> hdto = dao.getOneTagList(bnum);
		
		//login test
		
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	   
		//int totalCount = adao.totalCountAnswer(bnum);
		
		mview.addObject("dto", dto);
		mview.addObject("hdto",hdto);
		//mview.addObject("totalCount",totalCount);
		mview.addObject("pageNum", pageNum);
		mview.addObject("mdto",mdto);

		mview.setViewName("/board/boardcontent");
		return mview; 
		
	} 
	
	/*
	 * @GetMapping({"/board/boardcontent"}) public ModelAndView bcc() { ModelAndView
	 * mview=new ModelAndView();
	 * 
	 * 
	 * mview.setViewName("/board/boardcontent"); return mview;
	 * 
	 * }
	 */
	
	

}
