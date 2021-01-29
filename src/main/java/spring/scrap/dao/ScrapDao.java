package spring.scrap.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.ScrapDto;

@Repository
public class ScrapDao extends SqlSessionDaoSupport implements ScrapDaoInter {

	@Override
	public int getNumMax() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCount(String smidnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfScrapID",smidnum);
	}

	@Override
	public List<ScrapDto> getScrapList(int start, int perpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ScrapDto getScrapData(String num) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void insertScrap(ScrapDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfScrap", dto);
		
	}

	@Override
	public int cardScrapCheck(String scnum, String smidnum) {
		// TODO Auto-generated method stub
		//System.out.println(scnum);
		//System.out.println(smidnum);
		HashMap<String, String> params=new HashMap<String, String>();
		params.put("scnum", scnum);
		params.put("smidnum", smidnum);
		return getSqlSession().selectOne("cardCheck", params);
	}

	@Override
	public ScrapDto getCardData(String scnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfCardScrap", scnum);
	}

	@Override
	public void deleteCardScrap(ScrapDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfScrap",dto);
	}


	
	
	
	

}
