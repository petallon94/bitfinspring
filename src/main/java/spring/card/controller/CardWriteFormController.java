package spring.card.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;

@Controller
public class CardWriteFormController {
	
	@Autowired
	private CardDaoInter carddi;
	
	@GetMapping("/docter/writeform")
	public String goCardWriteForm()
	{
		return "/dcommu/dcomwriteform";
	}
}