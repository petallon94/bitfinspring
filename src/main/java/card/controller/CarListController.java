package card.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import spring.card.dao.CardDaoInter;

@Controller
public class CarListController {
	
	@Autowired
	private CardDaoInter carddi;
	
	
}
