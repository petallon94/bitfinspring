package spring.chat.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImple implements ChatService{

	@Autowired
	private ChatDaoInter chatdi;
	
	@Override
	public Map<String, Object> doChatAdd(Map<String, Object> param) {
		chatdi.add(param);
		Map<String, Object> rs = new HashMap<>();
		
		rs.put("resultCode", "S-1");
		rs.put("msg", "채팅방이 생성되었습니다");
		rs.put("id", param.get("chusername"));
		
		return rs;
	}
	
}
