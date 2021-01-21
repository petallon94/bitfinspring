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
	   
	   int perPage=5;       //이런 한글이 왜 깨지는 거야
	   int perBlock=4;     // 
	   int totalPage;      //
	   int startPage;      //
	   int endPage;      //
	   int start;         //

	   
	   totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	   
	   
	   startPage=(currentPage-1)/perBlock*perBlock+1;
	   endPage=startPage+perBlock-1;
	   
	   
	   if(endPage>totalPage)
	      endPage=totalPage;
	   
	   
	   start=(currentPage-1)*perPage;
	   
	   
	   int no = totalCount-(currentPage-1)*perPage;
	   
	  
	   List<BoardDto> list =dao.getList(start, perPage);
	   
	  // @Autowired
	
	   if(list.size()==0)
	   {
		   
		   return "redirect : list?pageNum="+(currentPage-1);
		   
	   }
	   
		
		/* �뙎湲� : 異뷀썑�뿉 援ы쁽
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

	
	///////////由ъ뒪�듃 異쒕젰 �셿猷�
	
	
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
