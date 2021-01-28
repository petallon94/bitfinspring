package spring.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import spring.dto.ScrapDto;
import spring.scrap.dao.ScrapDao;

@Controller
public class ScrapInsertController {

	@Autowired
	private ScrapDao dao;
	
	
	@PostMapping("/doctor/cardscrap")
	public String cardScrap(@ModelAttribute ScrapDto dto)
	{
		//id가 스크랩했는지 확인
		//int cardcheck=dao.cardScrapCheck(dto.getScnum(),dto.getSmidnum());
		
		//이미스크랩했을경우
//		if(cardcheck==1)
//		{
//			
//		}else {
//			
//		}
		//System.out.println(cardcheck);
		
		//db에저장
		dao.insertScrap(dto);
		return "redirect:/mypage.scrap";
	}
}
