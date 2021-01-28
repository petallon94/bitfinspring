package spring.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.dto.MemberDto;


@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String goChat()
	{
		//MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	    //request.getSession().setAttribute("nickname", mdto.getMnum());
		return "/chat/chatmain";
	}
}
