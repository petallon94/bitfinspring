package spring.board.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.BoardDto;

@Repository
public class BoardDao extends SqlSessionDaoSupport implements BoardDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	      map.put("regroup", regroup);
	      map.put("restep", restep);
	      
	      getSqlSession().update("updateRestepOfBoard", map);
		
	}

	@Override
	public int getCheckPass(String num, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateReadCount(String num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		HashMap<String, Integer> map=new HashMap<String, Integer>();
	      map.put("start", start);
	      map.put("perpage", perpage);
	      return getSqlSession().selectList("selectAllOfBoard", map);
	}

	@Override
	public BoardDto getData(String num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(String num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
