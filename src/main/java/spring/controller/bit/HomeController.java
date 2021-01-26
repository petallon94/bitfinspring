package spring.controller.bit;

import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


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

