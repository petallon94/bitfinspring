package spring.hospital.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.dto.MemberDto;
import spring.dto.ReserveDto;
import spring.reserve.dao.ReserveDao;

@Controller
public class ReserveController {
	
	@Autowired
	ReserveDao dao;
	
	//member dao 선언
	MemberDto mdto;
	
	@GetMapping("/reserve/list")
	public String reserveList(Model model)
	{
		//전체 갯수 얻기
		int totalCount=dao.getTotalCount();
		//전체 데이터 얻기
		List<ReserveDto> list=dao.getAllDatas();
		
		//model에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "/reserve/list";
	}
	
	//예약버튼을 눌렀을 때 입력하는 폼
	@GetMapping("/reserve/writeform")
	public String reserveForm()
	{	
		//member의 mnum확인하기
		//mdto.getMnum();
		//System.out.println("mnum: "+mdto.getMnum());
		
		return "/reserve/writeform";
	}
	
	//insert
	@PostMapping("/reserve/insert")
	public String reserveInsert(
			@ModelAttribute ReserveDto dto)
	{				
		dao.insertReserve(dto);
		return "/reserve/success";
	}
	
	//getData:dto보내기
	@GetMapping("/reserve/updateform")
	public ModelAndView updateForm(
			@RequestParam String rnum)
	{
		//선언
		ModelAndView model=new ModelAndView();
		//db로부터 num에 해당하는 dto를 얻는다
		ReserveDto dto=dao.getData(rnum);
		//model에 저장
		model.addObject("dto", dto);
		//포워드
		model.setViewName("/reserve/updateform");
		
		return model;
	}
	
	//update
    @PostMapping("/reserve/update")
    public String updateReserve(
         @ModelAttribute ReserveDto dto)
    {
		dao.updateReserve(dto);
		return "redirect:list";
    }
   
    //delete
    @GetMapping("/reserve/delete")
    public String deleteReserve(
         @RequestParam String rnum)
    {
	    dao.deleteReserve(rnum);
	    return "redirect:list";
    }
   

}
	