package spring.safe.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

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


	
   @RequestMapping(value = "/mainsafe/list", method= {RequestMethod.GET, RequestMethod.POST})
   public Map<String, Object> callapihttp(@RequestParam Map<String, Object> paramMap) throws Exception {
	   
	        System.out.println("### getActualDealPrice paramMap=>"+paramMap);
	        Map<String, Object> resultMap = new HashMap<>();
	 
	        try {
	 
	            StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1262000/SafetyNewsList/getCountrySafetyNewsList");
	            urlBuilder.append("?"+URLEncoder.encode("serviceKey", "UTF-8")+"="+"0ikkJvVW7UM8H0a5VZwT%2BrON8XVeS2aeZC%2Bi51wnHpOIh34ihoZ5AMOhPDGnyKSOzSChEVHk2q1Ap8E%2BZrodSg%3D%3D");
				/*
				 * urlBuilder.append("&"+URLEncoder.encode("numOfRows", "UTF-8")+"="+"1");
				 * urlBuilder.append("&"+URLEncoder.encode("pageNo", "UTF-8")+"="+"10");
				 * urlBuilder.append("&"+URLEncoder.encode("title1",
				 * "UTF-8")+"="+"%EC%9E%85%EA%B5%AD");
				 */
	            URL url = new URL(urlBuilder.toString());
	 
	            System.out.println("###url=>"+url);
	 
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-Type", "application/json");
	            System.out.println("Response Code:"+conn.getResponseCode());
	 
	 
	            BufferedReader rd;
	            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            } else {
	                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	            }
	 
	            StringBuilder sb = new StringBuilder();
	            String line;
	            while ((line=rd.readLine()) != null) {
	                sb.append(line);
	            }
	            rd.close();
	            conn.disconnect();
	 
	            org.json.JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
	            String xmlJSONObjString = xmlJSONObj.toString();
	            System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);
	 
	            ObjectMapper objectMapper = new ObjectMapper();
	            Map<String, Object> map = new HashMap<>();
	            map = objectMapper.readValue(xmlJSONObjString, new TypeReference<Map<String, Object>>(){});
	            Map<String, Object> dataResponse = (Map<String, Object>) map.get("response");
	            Map<String, Object> body = (Map<String, Object>) dataResponse.get("body");
	            Map<String, Object> items = null;
				List<Map<String, Object>> itemList = null;
	 
				items = (Map<String, Object>) body.get("items");
				itemList = (List<Map<String, Object>>) items.get("item");
			
	 
	            System.out.println("### map="+map);
	            System.out.println("### dataResponse="+dataResponse);
	            System.out.println("### body="+body);
	            System.out.println("### items="+items);
				System.out.println("### itemList="+itemList);
	 
				/*
				 * resultMap.put("Result", "0000"); resultMap.put("numOfRows",
				 * body.get("numOfRows")); resultMap.put("pageNo", body.get("pageNo"));
				 * resultMap.put("totalCount", body.get("totalCount"));
				 */
				resultMap.put("item", itemList);
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            resultMap.clear();
	            resultMap.put("Result", "0001");
	        }
	 
	        return resultMap;
	    }
}

