package spring.controller.bit;


import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@GetMapping({"/","/home"})
	public String goMain(HttpServletRequest request, HttpServletResponse response)
	{
		HashMap<String, String> inflectionData=inflection2.getInflectionData();
		String inflectionpeople =  inflectionData.get("inflectionPeople");
		String inflectiondate = inflectionData.get("inflectionDay");

		request.getSession().setAttribute("inflectionpeople", inflectionpeople);
		request.getSession().setAttribute("inflectiondate", inflectiondate);
		
		return "/layout/main";
	}
}

