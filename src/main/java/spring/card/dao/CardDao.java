package spring.card.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.CardDto;

@Repository
public class CardDao extends SqlSessionDaoSupport implements CardDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
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
	public void insertCard(CardDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CardDto> getCardList(int start, int perpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CardDto getCardData(String num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCard(CardDto dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteCard(String num) {
		// TODO Auto-generated method stub

	}

}
