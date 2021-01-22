package spring.member.service;

import javax.servlet.http.HttpSession;

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
		dao.updateMember(dto);
	}

	@Override
	public void deleteMember(String mid) {
		// TODO Auto-generated method stub
		dao.deleteMember(mid);
	}

	@Override
	public MemberDto getData(String mid) {
		// TODO Auto-generated method stub
		return dao.getData(mid);
	}

	@Override
	public int idCheck(String mid) {
		// TODO Auto-generated method stub
		return dao.idCheck(mid);
	}

	@Override
	public boolean pwCheck(String mid, String mpw) {
		// TODO Auto-generated method stub
		return dao.pwCheck(mid, mpw);
	}



	@Override
	   public String loginMember(String mid, String mpw) {

	      int logincheck = dao.loginmember(mid, mpw); //id,pw�� ������ �����ϸ�1, �ƴϸ� 0
	      String loginok;
	      if(logincheck==1) {
	         loginok="ok";
	      }else {
	         loginok=null;
	      }
	      return loginok;
	   }

	@Override
	public void updatePW(String mid, String mpw) {
		// TODO Auto-generated method stub
		dao.updatePW(mid,mpw);
	}
	
	
	
	
	
	
	
	
}
