package spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.dto.MemberDto;
import spring.member.service.MemberServiceInter;

@Controller
public class MemberController {
	
	@Autowired
	private MemberServiceInter service;
	
	

	@GetMapping("/member/login")
	public String goLogin()
	{
		return "/member/login";
	}

	@GetMapping("/member/signup")
	public String goSignUp()
	{
		return "/member/signup";
	}
	

	@GetMapping("/member/msignup")
	public String goMSignUp()
	{
		return "/member/msignup";
	}
	
	@GetMapping("/member/dsignup")
	public String goDSignUp()
	{
		return "/member/dsignup";
	}
	

	@PostMapping("/member/savemember")
	public String insertMember(@ModelAttribute MemberDto dto)
	{
		
		service.insertMember(dto);
		return "redirect:login";
	}

	
	@ResponseBody
	@PostMapping("/member/idcheck")
	public String idCheck(String mid)
	{
		int result=service.idCheck(mid);
		
		if(result!=0)
		{
			return "fail";
		}else {
			return "success";
		}
	}
	
	
	
	
	
	@PostMapping("member/loginmethod")
	   public String loginMethod(
	         HttpServletRequest request, HttpServletResponse response,
	         @RequestParam String mid, @RequestParam String mpw) {
	      
		String loginok = service.loginMember(mid,mpw);
	      String path=null;
	      if(loginok=="ok") {
	         path="redirect:/";
	         System.out.println(path);
	         request.getSession().setAttribute("loginok","ok");
	         request.getSession().setAttribute("loginid",mid);
	         
	         
	         String loginid=(String)request.getSession().getAttribute("loginid");
	         
	         MemberDto mdto=service.getData(loginid);
	         System.out.println("로그인"+mdto);
			 request.getSession().setAttribute("mdto",mdto);
	      }else {
	         path="/member/nidlogin";
	      }
	      System.out.println(path);
	      return path;
	   };

	  
	   
	   @GetMapping("member/logout")
	   public String loginMethod(
	         HttpServletRequest request, HttpServletResponse response)
	   {
	      
	      request.getSession().invalidate();
	      
	      return "redirect:/";
	   }
	   
	   
	   
	   
	   

	   
	   
	   
	   
	   
	   @GetMapping("/member/updatepwchk")
	   public String updatePwCheck(HttpServletRequest request,
			   HttpServletResponse response)
	   {
//		   request.getSession().setAttribute("loginid","soo");
//		   String loginid=(String)request.getSession().getAttribute("loginid");
//		   MemberDto mdto=service.getData(loginid);
//		   request.getSession().setAttribute("mdto",mdto);
//		   System.out.println(loginid);
//		   System.out.println(mdto.getMrole());
		   
		   
//		   boolean result=service.pwCheck(mdto.getMid(), mdto.getMpw());
//		   String path=null;
//		   if(result)
//		   {
//			   path="/member/updateform";
//			   
//		   }else {
//			   path="/member/updatepwchk";
//		   }
//		   
		   return "/member/updatepwchk";
	   }
	   
	   
	   
	   
	   
	   @PostMapping("/member/updatepwchk")
	   public String goUpdateForm(@ModelAttribute MemberDto dto,
			   HttpServletRequest request,
			   HttpServletResponse response
			   )
	   {
		   
		   
		   
		   //request.getSession().setAttribute("loginid",dto.getMid());
		   //MemberDto mdto=service.getData(dto.getMid());
		   
		   //세션에 dto값 가꼬오기
		   MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		   int mrole=mdto.getMrole();
		   
		   boolean result=service.pwCheck(dto.getMid(), dto.getMpw());
		   //int mrole=mdto.getMrole();
		   System.out.println("mrole:"+mrole);
		   if(result)
		   {
			   if(mrole>0)
			   {
				   return "redirect:/member/dupdatemember";
			   }else {
				   return "redirect:/member/mupdatemember";
			   }
		   }else {
			   return "/member/updatepwchk";
		   }
		   
	   }
	   
	   
	   
	   @GetMapping("/member/mupdatemember")
		public String goMUpdate()
		{
			return "/member/mupdatemember";
		}
		
		@GetMapping("/member/dupdatemember")
		public String goDUpdate()
		{
			return "/member/dupdatemember";
		}
	   
	   
	   
	   
	   
	   
	   
	   @GetMapping("/member/updateform")
	   public String goUpdateForm(
			   HttpServletRequest request, HttpServletResponse response)
	   {
//		   //세션잠깐너어둔거
//		   request.getSession().setAttribute("loginid","soo1");
//		   String loginid=(String)request.getSession().getAttribute("loginid");
//		   MemberDto mdto=service.getData(loginid);
//		   request.getSession().setAttribute("mdto",mdto);
//		   System.out.println(loginid);
//		   System.out.println(mdto);
		   return "/member/updateform";
	   }
	   
	   
	   
	   @PostMapping("/member/update")
	   public String memberUpdate(MemberDto dto)
	   {

	      service.updateMember(dto);
	      return "redirect:/";
	   }
	
	
	   
	   
	   
	   
	   public String delPwChk()
	   {
		   return "";
	   }
	   
	
	
}
