package spring.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

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
   
   @GetMapping("/hospitaldetail")
   public String goHdetail() {
      return "/hospital/hospitaldetail";
   }
   
   @GetMapping("/tablist")
   public String goTablist() {
      return "/hospital/tablist";
   }

   
}
