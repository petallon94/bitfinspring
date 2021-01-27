package spring.safe.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class SafeMainController {
   @RequestMapping(value = "/safe/list",method = {RequestMethod.GET,RequestMethod.POST},produces="text/plain;charset=UTF-8")
   public String callapihttp() {
      StringBuffer result = new StringBuffer();
      try {
         String urlstr = "http://apis.data.go.kr/1262000/SafetyNewsList/getCountrySafetyNewsList?serviceKey=0ikkJvVW7UM8H0a5VZwT%2BrON8XVeS2aeZC%2Bi51wnHpOIh34ihoZ5AMOhPDGnyKSOzSChEVHk2q1Ap8E%2BZrodSg%3D%3D&numOfRows=10&pageNo=1&title2=%EC%BD%94%EB%A1%9C%EB%82%98";
         
         //String urlstr = "http://apis.data.go.kr/1262000/SafetyNewsList/getCountrySafetyNewsList?serviceKey=0ikkJvVW7UM8H0a5VZwT%2BrON8XVeS2aeZC%2Bi51wnHpOIh34ihoZ5AMOhPDGnyKSOzSChEVHk2q1Ap8E%2BZrodSg%3D%3D&numOfRows=10&pageNo=1&title1=%EC%9E%85%EA%B5%AD";
         
         URL url = new URL(urlstr);
         HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
         urlconnection.setRequestMethod("GET");
         BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
         
         String returnLine;
         
         while ((returnLine = br.readLine()) != null) {
            result.append(returnLine);
            System.out.println(br.readLine());
            
         }
         urlconnection.disconnect();
         
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      return result+toString();
   }
}

