package spring.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.board.dao.BoardDao;
import spring.dto.BoardDto;
import spring.dto.BoardPhotoDto;


@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	@GetMapping({"/board"})
	   public String goboard(
			   @RequestParam(value="pageNum",defaultValue="1")int currentPage,
				Model model
			   ) 
	 {	int totalCount = dao.getTotalCount();
	  // System.out.println(totalCount);
	   
	   int perPage=5;       //한페이지당 보여질 글의 갯수
	   int perBlock=4;    //한 블럭당 출력할 페이지의 갯수
	   int totalPage;      //총 페이지의 갯수
	   int startPage;      //각 블럭당 시작할 페이지번호
	   int endPage;      //각 블럭당 끝 페이지 번호
	   int start;         //각 블럭당 불러올 글의 시작번호  

	   
	   totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	   
	   //시작페이지와 끝페이지 구하기(시작페이지=sp, 끝페이지=ep)
	   //예:한페이지당 3개만 볼 경우 현재 페이지가 2라면 sp:1, ep:3
	   //현재 페이지가 7이라면 sp:7, ep:9
	   startPage=(currentPage-1)/perBlock*perBlock+1;
	   endPage=startPage+perBlock-1;
	   
	   //마지막 블럭은 endPage를 totalPage로 해놔야 한다
	   if(endPage>totalPage)
	      endPage=totalPage;
	   
	   //mysql은 첫 글이 0번(오라클은 1번이라서 +1을 해줬었음)
	   start=(currentPage-1)*perPage;
	   
	   //각 페이지에서 출력할 시작번호
	   //총 50개일 경우 1페이지는 50, 2페이지는 40
	   int no = totalCount-(currentPage-1)*perPage;
	   
	  
	   List<BoardDto> list =dao.getList(start, perPage);
	   // 게시물의 글들 시작되는 글번호부터 10개 출력
	 ///////////////////////////////////////////////////////
	   
	   
	  // @Autowired
	
	   if(list.size()==0)
	   {
		   
		   return "redirect : list?pageNum="+(currentPage-1);
		   
	   }
	   
		
		/* 댓글 : 추후에 구현
		 * for(BoardDto dto:list) {
		 * 
		 * int n= adao.getAnswerList(dto.getNum()).size(); dto.setCnt(n);
		 * 
		 * }
		 */
	   
	   
	   
	//////////////////////////////////   
	   model.addAttribute("currentPage",currentPage);
	   model.addAttribute("list",list);
	   model.addAttribute("no",no);
	   model.addAttribute("startPage",startPage);
	   model.addAttribute("endPage",endPage);
	   model.addAttribute("totalPage",totalPage);	  
	   model.addAttribute("totalCount",totalCount);
	   
	    return "/board/boardlist";
	 }

	
	///////////리스트 출력 완료
	
	
	@GetMapping({"/board/boardwrite"})
	   public String gobowrite() 
	{	
	    return "/board/boardwriteform";
	}
	
	
	
	@PostMapping("/board/write")
	public String write(
			@ModelAttribute BoardDto dto
			)
	{
		dao.insertBoard(dto);
		return "redirect:list?";
	}


}
