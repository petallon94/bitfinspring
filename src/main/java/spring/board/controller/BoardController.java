package spring.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.dto.BoardPhotoDto;

@Controller
public class BoardController {
	
	@GetMapping({"/board"})
	   public String goMed() 
	 {	
	    return "/board/boardlist";
	 }
	
	@GetMapping({"/board/boardwrite"})
	   public String gobowrite() 
	{	
	    return "/board/boardwriteform";
	}
	
	

}
