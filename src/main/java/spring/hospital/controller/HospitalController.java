package spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HospitalController {
	@GetMapping("/hospitalmain")
   public String goHospital() {
      return "/hospital/hospitalmain";
   }
	
   @GetMapping("/hospitallist")
   public String goHlist() {
      return "/hospital/hospitallist";
   }
   
	/*
	 * @GetMapping("/hospitallist")
	 * 
	 * public String goHlist(@RequestParam(value = "pageNo",defaultValue = "1") int
	 * currentPage,
	 * 
	 * @RequestParam(value = "numOfRows",defaultValue = "9") int perPage,
	 * 
	 * @RequestParam String hcate, Model model) { if(hcate =="A0") { int totalCount
	 * = 261; }else if(hcate == "97") { int totalCount = 101; }else if(hcate ==
	 * "99") { int totalCount = 653; }else int totalCount = 1017;
	 * 
	 * int startPage; int endPage; //������ �������� ��ȣ int start; //�� ���� �ҷ���
	 * ���� ���۹�ȣ
	 * 
	 * totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	 * startPage=(currentPage-1)/perBlock*perBlock+1; endPage=startPage+perBlock-1;
	 * if(endPage>totalPage) endPage=totalPage;
	 * 
	 * //mysql �� ù ���� 0��(����Ŭ�� 1��) start=(currentPage-1)*perPage;
	 * 
	 * //�� ���������� ����� ���۹�ȣ //�� 50���ϰ�� 1�������� 50 // 2�������� 40 int
	 * no=totalCount-(currentPage-1)*perPage; //mysql ���� �ش� �������� �ʿ��� ���
	 * �������� List<ReBoardDto> list=service.getList(start, perPage); //�ش�
	 * ���������� ������ �ϳ����� ������ ������ �����Ͱ� �ȳ����� �Ǵ� ���� �ذ�
	 * if(list.size()==0) { return "redirect:list?pageNum="+(currentPage-1); }
	 * 
	 * for(ReBoardDto dto:list) { //�� �Խñۿ� �޸� ����� ������ ���ؼ� cnt�� ���� int
	 * n=adao.getAnswerList(dto.getNum()).size(); dto.setCnt(n);; } //model�� ����
	 * model.addAttribute("currentPage",currentPage);
	 * model.addAttribute("list",list); model.addAttribute("no",no);
	 * model.addAttribute("startPage",startPage);
	 * model.addAttribute("endPage",endPage);
	 * model.addAttribute("totalCount",totalCount);
	 * model.addAttribute("totalPage",totalPage);
	 
	 
      return "/hospital/hospitallist";
   }*/
   
   
   @GetMapping("/hospitaldetail")
   public String goHdetail() {
      return "/hospital/hospitaldetail";
   }
   
   @GetMapping("/tablist")
   public String goTablist() {
      return "/hospital/tablist";
   }

	
}
