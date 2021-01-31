package spring.hospital.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
 
@RestController
public class HospitaListController {
		
		@RequestMapping(value = "hospital/list",method = {RequestMethod.GET,RequestMethod.POST},produces="text/plain;charset=UTF-8")
    	 public static String getHlist(@RequestParam String hcate) throws IOException {
			
    	        
    		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/pubReliefHospService/getpubReliefHospList"); /*URL*/
    	        
    	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ELPlnUlo0CxXA8FbXT0V%2B0wkutn45xHxgWifiU35dIFwr3r1ngGdPJCbxlz59QRhYMoSmt2nzUIZYiCxjFQXgg%3D%3D"); /*Service Key*/
    	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
    	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("9", "UTF-8")); /*한 페이지 결과 수*/
    	        urlBuilder.append("&" + URLEncoder.encode("spclAdmTyCd","UTF-8") + "=" + URLEncoder.encode(hcate, "UTF-8")); /*A0: 국민안심병원/97: 코로나검사 실시기관/99: 코로나 선별진료소 운영기관*/
    	        

    	        URL url = new URL(urlBuilder.toString());
    	        //웹url에 테스트해보기
    	        System.out.println(url);

    	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    	        conn.setRequestMethod("GET");
    	        conn.setRequestProperty("Content-type", "application/json");
    	        //Response code값 확인해 보기
    	        //System.out.println("Response code: " + conn.getResponseCode());
    	        BufferedReader rd;
    	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
    	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    	        } else {
    	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
    	        }
    	        StringBuilder sb = new StringBuilder();
    	        String line;
    	        while ((line = rd.readLine()) != null) {
    	            sb.append(line);
    	        }
    	        rd.close();
    	        conn.disconnect();
    	        //결과 출력: 이클립스콘솔로 확인
    	        //System.out.println(sb.toString());
    	        return sb.toString();
    	    }
		
//	
//
//		@GetMapping("/hospital/list")
//		public String goBoardList(
//				@RequestParam(value = "pageNo",defaultValue = "1") int currentPage,
//				@RequestParam(value = "numOfRows",defaultValue = "9") int perPage,
//				Model model
//				) 
//		{
//	        int totalCount = service.getTotalCount();
//	        int perBlock = 5; //�Ѻ��� Ǯ���� �������� ����    
//	        int totalPage; //�� �������� ����
//	        int startPage; //������ ���� ������ ��ȣ
//	        int endPage; //������ �������� ��ȣ
//	        int start; //�� ���� �ҷ��� ���� ���۹�ȣ
//			
//	        totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
//	    	startPage=(currentPage-1)/perBlock*perBlock+1;
//	    	endPage=startPage+perBlock-1;
//	    	if(endPage>totalPage)
//	    		endPage=totalPage;
//
//	    	//mysql �� ù ���� 0��(����Ŭ�� 1��)
//	    	start=(currentPage-1)*perPage;
//	    	
//	    	//�� ���������� ����� ���۹�ȣ
//	    	//�� 50���ϰ�� 1�������� 50
//	    	//              2�������� 40
//	    	int no=totalCount-(currentPage-1)*perPage;
//	    	//mysql ���� �ش� �������� �ʿ��� ��� ��������
//	    	List<ReBoardDto> list=service.getList(start, perPage);
//	    	//�ش� ���������� ������ �ϳ����� ������ ������ �����Ͱ� �ȳ����� �Ǵ� ���� �ذ�
//	    	if(list.size()==0)
//	    	{
//	    		return "redirect:list?pageNum="+(currentPage-1);
//	    	}
//	    	
//	    	for(ReBoardDto dto:list)
//	    	{
//	    		//�� �Խñۿ� �޸� ����� ������ ���ؼ� cnt�� ����
//	    		int n=adao.getAnswerList(dto.getNum()).size();
//	    		dto.setCnt(n);;
//	    	}
//	    	//model�� ����
//	    	model.addAttribute("currentPage",currentPage);
//	    	model.addAttribute("list",list);
//	    	model.addAttribute("no",no);
//	    	model.addAttribute("startPage",startPage);
//	    	model.addAttribute("endPage",endPage);
//	    	model.addAttribute("totalCount",totalCount);
//	    	model.addAttribute("totalPage",totalPage);
//			
//			return "/board/boardlist";
//		}
		
		
}
