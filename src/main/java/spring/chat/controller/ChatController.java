package spring.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.dto.MemberDto;

@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String goChat(HttpServletRequest request, HttpServletResponse response)
	{
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		return "/chat/chatmain";
	}
}
