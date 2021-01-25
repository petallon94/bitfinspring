package spring.answer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.answer.dao.AnswerDao;
import spring.dto.AnswerDto;

@RestController
public class AnswerController {
	
	@Autowired
	AnswerDao dao;
	
	@PostMapping("/board/answersave")
	public void insertAnswer(@RequestParam String acnum,
			@RequestParam String amidnum,
			@RequestParam String awriter,
			@RequestParam String amemo)
	{
		AnswerDto dto=new AnswerDto();

		dto.setAcnum(Integer.parseInt(acnum));
		dto.setAmidnum(Integer.parseInt(amidnum));
		dto.setAwriter(awriter);
		dto.setAmemo(amemo);

		//db 에 저장

		dao.insertAnswer(dto);

	}
	
	@GetMapping("/board/answerlist")

	public List<AnswerDto> list (@RequestParam String num){

		return dao.getAnswerList(num);

	}
	
	

}
