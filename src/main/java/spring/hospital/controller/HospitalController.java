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
   
   @GetMapping("/hospitaldetail")
   public String goHdetail(@RequestParam String name
         ,@RequestParam String addr
         ,@RequestParam String tel
         ,Model model) {
      //System.out.println(name);
      
      model.addAttribute("name",name);
      model.addAttribute("addr",addr);
      model.addAttribute("tel",tel);
      
      return "/hospital/hospitaldetail";
   }
   
   @GetMapping("/tablist")
   public String goTablist() {
      return "/hospital/tablist";
   }

   
}