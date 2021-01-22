package spring.member.service;

import spring.dto.MemberDto;

public interface MemberServiceInter {
	
	public void insertMember(MemberDto dto);
	public void updateMember(MemberDto dto);
	public void deleteMember(String mid);
	public MemberDto getData(String mid);
	public int idCheck(String mid);
	public boolean pwCheck(String mid, String mpw);
	public String loginMember(String mid, String mpw);
	public void updatePW(MemberDto dto);
}
