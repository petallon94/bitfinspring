package spring.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.chat.dao.ChatDaoInter;


@Controller
public class ChatController {
	
	@Autowired
	private ChatDaoInter chatdi;
	
	@GetMapping("/chat")
	public String goChat()
	{
		return "/chat/chatmain";
	}
	
	
}
