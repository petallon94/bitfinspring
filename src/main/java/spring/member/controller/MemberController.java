package spring.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileSystemLoopException;
import java.util.HashMap;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
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
	
	
	//로그인 화면으로 이동
	@GetMapping("/member/login")
	public String goLogin()
	{
		return "/member/login";
	}

	//회원가입 mrole 선택 화면으로 이동
	@GetMapping("/member/signup")
	public String goSignUp()
	{
		return "/member/signup";
	}
	
	//일반회원가입 폼으로 이동
	@GetMapping("/member/msignup")
	public String goMSignUp()
	{
		return "/member/msignup";
	}
	
	//전문회원가입 폼으로 이동
	@GetMapping("/member/dsignup")
	public String goDSignUp()
	{
		return "/member/dsignup";
	}
	
	//입력한 회원정보 저장하고 로그인화면으로 이동.
	@PostMapping("/member/savemember")
	public String insertMember(@ModelAttribute MemberDto dto)
	{
		
		service.insertMember(dto);
		return "redirect:login";
	}

	
	
	
	//중복 아이디 확인
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
	
	
	
	
	//로그인 기능 구현
	@PostMapping("member/loginmethod")
	public String loginMethod(
		HttpServletRequest request, HttpServletResponse response,
		@RequestParam String mid, @RequestParam String mpw,
		Model model)
	{
	      
		String loginok = service.loginMember(mid,mpw);
		
		if(loginok=="ok") {
		    //loginok 저장
		    request.getSession().setAttribute("loginok","ok");
		    //입력된 id의 mdto를 가져옴.
		    MemberDto mdto=service.getData(mid);
		    //mdto를 세션에 넣음.
			request.getSession().setAttribute("mdto",mdto);
			
			System.out.println(mdto.getMemail());
			
			
			//새 화면 띄우고 alert 하는거.. 좀 그래도
			//장점은 여러군데 쉽게 사용가능함... 다른방법은 코드가 너무 지저분해짐..
			model.addAttribute("alert_title","환영합니다.");
			model.addAttribute("alert_icon","success");
			model.addAttribute("url","/bit/");
			return "/member/alert";
		}else {
			//실패시 nidlogin페이지로 이동
			return "/member/nidlogin";
		}
	 };

	 
	 
	  
	 //로그아웃기능
   @GetMapping("member/logout")
   public String logoutMethod(
         HttpServletRequest request, HttpServletResponse response, Model model)
   {
      //세션을 다 지워버림.
      request.getSession().invalidate();
      //alert 기능
      model.addAttribute("alert_title","로그아웃이 되었습니다.");
      model.addAttribute("alert_icon","success");
      model.addAttribute("url","/bit/");
      return "/member/alert";
   }
	  
   //업데이트 비밀번호 확인
   @PostMapping("/member/update.passcheck")
   public String goUpdateForm(@RequestParam String mpw,
		   HttpServletRequest request,
		   HttpServletResponse response,
		   Model model
		   )
   {
	   //세션의 mdto 얻기
	   MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
	   //mdto에서 일반/전문 회원정보 얻기 (0:일반 / 1:전문)
	   int mrole=mdto.getMrole();
	   //비밀번호 확인 메소드
	   boolean result=service.pwCheck(mdto.getMid(),mpw);
	   
	   //결과 확인
	   if(result)
	   {
		   if(mrole==0)
		   {
			   //일반회원
			   return "/member/mupdatemember";
		   }else {
			   //병원
			   return "/member/dupdatemember";
		   }
	   }else {
		   //비밀번호가 틀릴 경우 마이페이지의 마이 인포메이션으로 가기.
		   model.addAttribute("alert_title","패스워드가 맞지 않습니다.");
		   model.addAttribute("alert_icon","error");
		   model.addAttribute("url","/bit/mypage.information");
		   return "/member/alert";
	   }
	   
   }
	  
	   
   //업데이트 하기
   @PostMapping("/member/updatemember")
   public String memberUpdate(@ModelAttribute MemberDto dto,
		   Model model)
   {
      service.updateMember(dto);
      model.addAttribute("alert_title","정보가 수정되었습니다.");
	  model.addAttribute("alert_icon","success");
	  model.addAttribute("url","/bit/mypage.information");
      return "/member/alert";
   }
	
	   
	
    //삭제 패스워드 확인
	@PostMapping("/member/del.passcheck")
	public String goDelForm(@RequestParam String mpw
			,HttpServletRequest request
			,HttpServletResponse response
			,Model model 
			)
	{
		
		//세션 가져오기
		MemberDto mdto=(MemberDto)request.getSession().getAttribute("mdto");
		
		//세션의 아이디와 입력한 pw 비교.
		boolean result=service.pwCheck(mdto.getMid(), mpw);
		
		if(result)
		{
			//결과가 맞으면 삭제 메서드
			service.deleteMember(mdto.getMid());
		}else{
			//결과가 틀리면 마이페이지로 돌아가기
		    model.addAttribute("alert_title","패스워드가 알맞지 않습니다.");
			model.addAttribute("alert_icon","error");
			model.addAttribute("url","/bit/mypage.information");
			return "/member/alert";
		}
		
	      //세션을 다 지워버림.
	      request.getSession().invalidate();
	      model.addAttribute("alert_title","회원탈퇴를 하였습니다.");
		  model.addAttribute("alert_icon","success");
		  model.addAttribute("url","/bit");
		  return "/member/alert";
	}
		
		
	//패스워드 변경하기
	@PostMapping("updatepass")
	public String updatePass(@RequestParam String mpw,
			@RequestParam String upmpw,
			HttpServletRequest request,
			HttpServletResponse response){
		
		//세션에서 mdto 가져오기
		MemberDto mdto = (MemberDto)request.getSession().getAttribute("mdto");
		boolean result=service.pwCheck(mdto.getMid(), mpw);
		if(result)
		{
			//결과가 맞으면 패스워드 업데이트 시키기.
			service.updatePW(mdto.getMid(),upmpw);
		}else {
			return "/mypage/myinformation";
		}
		return "/mypage/myinformation";
	}
}