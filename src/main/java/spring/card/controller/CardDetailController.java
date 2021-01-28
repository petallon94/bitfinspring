package spring.card.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;
import spring.dto.MemberDto;
import spring.dto.ScrapDto;
import spring.scrap.dao.ScrapDao;

@Controller
public class CardDetailController {

	@Autowired
	private CardDaoInter carddi;
	@Autowired
	private ScrapDao sdao;
	
	@GetMapping("/doctor/detail")
	public ModelAndView cardDetail(@RequestParam String num, 
									@RequestParam String pageNum, 
									@RequestParam(required = false) String key,
									HttpServletRequest request)
	{
		ModelAndView mview = new ModelAndView();
		
		//key가 null이 아닌 경우 조회수 1 증가
		if(key!=null)
			carddi.updateReadCount(num);
		
		//dto얻기
		CardDto dto = carddi.getCardData(num);
		
		HttpSession session = request.getSession();
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		System.out.println("1mdto.getMnum:"+mdto.getMnum());
		
		//로그인했는지확인
		if(mdto!=null)
		{
			//id가 스크랩한거 있나확인하기
			int data=sdao.getTotalCount(Integer.toString(mdto.getMnum()));
			
			System.out.println("2mdto.getMnum:"+mdto.getMnum());
			System.out.println("data:"+data);
			
			//id에 스크랩한거있는경우
			if(data>0)
			{
				
				//ScrapDto sdto=sdao.getCardData(num);
				
				
				//해당 글 스크랩했는지안했는지확인(글num, 아디num)
				int cardcheck=sdao.cardScrapCheck(num, Integer.toString(mdto.getMnum()));
				System.out.println("cardcheck:"+cardcheck);
				
				
				mview.addObject("cardcheck", cardcheck);
				mview.addObject("dto", dto);
				mview.addObject("pageNum", pageNum);
				
				mview.setViewName("/dcommu/dcomdetail");
				return mview;
				
			//id에 스크랩한거 없는경우
			}else {
				mview.addObject("dto", dto);
				mview.addObject("pageNum", pageNum);
				
				System.out.println("스크랩0");
				
				mview.setViewName("/dcommu/dcomdetail");
				return mview;
			}
		//로그인안한경우	
		}else {
			mview.addObject("dto", dto);
			mview.addObject("pageNum", pageNum);
			mview.setViewName("/dcommu/dcomdetail");
			System.out.println("로그인x");
			return mview;
		}

	}

}
