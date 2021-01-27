package spring.chat.dao;

import java.util.ArrayList;
import java.util.Map;

public interface ChatDaoInter {

	public ArrayList<ChatDto> getChatList(String chtime);

	public void add(Map<String, Object> param);
	
}
