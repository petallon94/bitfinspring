package spring.member.controller;

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
	
	//로그인창
	@GetMapping("/member/login")
	public String goLogin()
	{
		return "/member/login";
	}
	
	//가입선택
	@GetMapping("/member/signup")
	public String goSignUp()
	{
		return "/member/signup";
	}
	
	//일반가입or의사가입창
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
	
	
	//insert
	@PostMapping("member/savemember")
	public String insertMember(@ModelAttribute MemberDto dto)
	{
		
		service.insertMember(dto);
		return "redirect:login";
	}
	//////////////////////////////////////

}
