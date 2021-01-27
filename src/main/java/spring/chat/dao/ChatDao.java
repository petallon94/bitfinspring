package spring.chat.dao;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao extends SqlSessionDaoSupport implements ChatDaoInter {

	@Override
	public ArrayList<ChatDto> getchatliList(String chtime) {
		ArrayList<ChatDto> chat = new ArrayList<ChatDto>();
		
		
		return null;
	}

}
