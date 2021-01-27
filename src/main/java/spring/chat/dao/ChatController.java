package spring.chat.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat")
	@ResponseBody
	public String doChatAdd(@RequestParam Map<String, Object> param) {
		Map<String, Object> rs = chatService.doChatAdd(param);
				
		return "채팅방이 생성되었습니다";
	}
}
