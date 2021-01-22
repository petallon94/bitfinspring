
package spring.card.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.card.dao.CardDaoInter;
import spring.dto.CardDto;
import spring.dto.MemberDto;
import upload.util.SpringFileWriter;

@Controller
public class CardWriteFormController {
	
	@Autowired
	private CardDaoInter carddi;
	
	
	@GetMapping("/doctor/writeform")
	public String goCardWriteForm(HttpServletRequest request, HttpServletResponse response)
	{
		request.getSession().setAttribute("cmidnum","1");
		return "/dcommu/dcomwriteform";
	}
	
	@PostMapping("/doctor/insert")
	public String cardWrite(@ModelAttribute CardDto dto,@RequestParam MultipartFile cphoto, HttpServletRequest request,@RequestParam String pageNum)
	{
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		ModelAndView model = new ModelAndView();
		String path = request.getSession().getServletContext().getRealPath("/resources/save");
		System.out.println(path);
		
		SpringFileWriter writer = new SpringFileWriter();
		String fileName=writer.changeFilename(cphoto.getOriginalFilename());
		
		writer.writeFile(cphoto, fileName, path);
		
		dto.setCphoto(fileName);
		
		carddi.insertCard(dto);
		
		return "redirect:list?pageNum="+pageNum;
	}

}