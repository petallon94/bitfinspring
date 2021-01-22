package spring.member.dao;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import spring.dto.MemberDto;

@Repository
public class MemberDao extends SqlSessionDaoSupport implements MemberDaoInter {
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfMember", dto);
	}

	@Override
	public void updateMember(MemberDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfMember", dto);
		
	}

	@Override
	public void deleteMember(String mnum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDto getData(String mid) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfMember", mid);
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("idCheckOfMember", mid);
	}

	@Override
	public boolean pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		boolean result=false;
		Map<String, String> map=new HashMap<String, String>();
		map.put("mid",mid);
		map.put("mpw",mpw);
		int count=getSqlSession().selectOne("pwCheckOfMember", map);
		if(count==1) result=true;
		return result;
	}



	
	@Override
	public int loginmember(String mid,String mpw)
	{
		HashMap<String, String> params=new HashMap<String, String>();
		params.put("mid", mid);
		params.put("mpw", mpw);
		return getSqlSession().selectOne("loginOfMember",params);
	}
	
    @Override
    public void updatePW(String mid, String mpw) {
        // TODO Auto-generated method stub
        HashMap<String, String> params=new HashMap<String, String>();
        params.put("mid", mid);
        params.put("mpw", mpw);
        getSqlSession().update("updatePwOfMember",params );
    }
}
