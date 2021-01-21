package spring.mypage.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MypageController {
	
	@Autowired

	//마이페이지 메인
	@GetMapping("/mypage.main")
	public String goMypage()
	{
		return "/mypage/main";
	}
	
	//내 정보
	@GetMapping("/mypage.information")
	public String goMypageinformation()
	{
		return "/mypage/myinformation";
	}
	
	//내 스크랩
	@GetMapping("/mypage.scrap")
	public String goMypagescrap()
	{
		return "/mypage/myscrap";
	}
	
	//내 예약
	@GetMapping("/mypage.reservation")
	public String goMypagereservation()
	{
		return "/mypage/myreservation";
	}
	
	//내가 쓴 글
	@GetMapping("/mypage.content")
	public String goMypagecontent()
	{
		return "/mypage/mycontents";
	}

	
}
