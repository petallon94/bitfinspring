package spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
	

	@PostMapping("member/savemember")
	public String insertMember(@ModelAttribute MemberDto dto)
	{
		service.insertMember(dto);
		return "redirect:login";
	};
	
	@PostMapping("member/loginmethod")
	public String loginMethod(
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam String mid, @RequestParam String mpw) {
		String loginok = service.loginMember(mid,mpw);
		String path;
		if(loginok=="ok") {
			path="redirect:/";
			System.out.println(path);
			request.getSession().setAttribute("loginok","ok");
			request.getSession().setAttribute("loginid",mid);
		}else {
			path="/member/nidlogin";
		}
		System.out.println(path);
		return path;
	};
	
	@GetMapping("member/logout")
	public String loginMethod(
			HttpServletRequest request, HttpServletResponse response) {
		
		request.getSession().invalidate();
		
		return "redirect:/";
	}
}
