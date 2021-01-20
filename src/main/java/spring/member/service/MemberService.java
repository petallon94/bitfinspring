package spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dto.MemberDto;
import spring.member.dao.MemberDaoInter;

@Service
public class MemberService implements MemberServiceInter{

	@Autowired
	private MemberDaoInter dao;

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		dao.insertMember(dto);
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

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		int a = dao.idCheck(mid);
		return a;
	}

	@Override
	public int pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDto getLogin(MemberDto dto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String loginMember(String mid, String mpw) {
		int logincheck = dao.loginmember(mid, mpw); //id,pw가 같은게 존재하면1, 아니면 0
		String loginok;
		System.out.println("loginok method");
		if(logincheck==1) {
			loginok="ok";
			System.out.println("login ok!@!!!@!@!");
		}else {
			loginok=null;
			System.out.println("login ok null");
		}
		System.out.println("login ok의 값은:" + loginok);
		return loginok;
	}
	
	
}
