package spring.answer.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.AnswerDto;

@Repository
public class AnswerDao extends SqlSessionDaoSupport implements AnswerDaoInter {

	@Override
	public void insertAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfAnswer", dto);
	}

	@Override
	public List<AnswerDto> getAnswerList(String num) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectAllOfAnswer", num);
	}

	@Override
	public void deleteAnswer(String idx) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfAnswer", idx);
	}

	@Override
	public AnswerDto getData(String idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAnswer(AnswerDto dto) {
		// TODO Auto-generated method stub

	}

}
