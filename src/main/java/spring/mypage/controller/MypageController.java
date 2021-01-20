package spring.mypage.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MypageController {
	
	@Autowired

	@GetMapping("/mypage")
	public String goMypage()
	{
		return "/mypage/main";
	}

	
}
