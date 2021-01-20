package spring.member.dao;


import java.util.HashMap;

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
		
	}

	@Override
	public void deleteMember(String mnum) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberDto getData(String mnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override // 아이디 존재시 1 반환
	public int idCheck(String mid) {
		return getSqlSession().selectOne("idCheckOfMember", mid);
	}

	@Override
	public int pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto getLogin(MemberDto dto) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("loginOfMember", dto);
	}
	
	@Override
	public int loginmember(String mid,String mpw) {
		HashMap<String, String> params=new HashMap<String, String>();
		params.put("mid", mid);
		params.put("mpw", mpw);
		System.out.println(mid+","+mpw);
		System.out.println(params);
		return getSqlSession().selectOne("loginOfMember",params);
	}
	

	
	
}
