package spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HospitalListController {
	@GetMapping("/hospital/main")
   public String goHospital() {
      return "/hospital/hospitalmain";
   }
	
   @GetMapping("/hospital/list")
   public String goHlist() {
      return "/hospital/hospitallist";
   }
   
   @GetMapping("/hospital/detail")
   public String goHdetail() {
      return "/hospital/hospitaldetail";
   }


}
