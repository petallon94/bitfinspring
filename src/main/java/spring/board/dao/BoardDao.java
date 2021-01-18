package spring.board.dao;

import java.util.List;

import spring.dto.BoardDto;

public class BoardDao implements BoardDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		
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
		
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		return null;
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
