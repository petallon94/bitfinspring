<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/css/medicine/mainlayout.css" />
<title>Insert title here</title>

<script>
	function test() {
		//document.getElementById(“test1”).innerHTML = “이렇게”;
		var input = document.getElementById("text1").value;

		var test1 = document.getElementById("test1");
		test1.innerHTML = "<b><font color='red'>" + input + "</font></b>";

	}
</script>

</head>

<body>
	<div class="layout">
		메디신 레이아웃입니다.
		<div class="search">
			<input class="text1" id="text1" type="text" />
			<button type="button" class="searchbtn" onclick="test()">
				검색하기</button>
			<div class="test" id="test1"></div>
			<%
				StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1471000/MdcinSdefctInfoService/getMdcinSdefctInfoList"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
					+ "=awJQs2s2oBzS%2FIFjgUKTgd2MOLPvsT2ZaaM7pDdyHRvQK3q5yoI%2FIwIMB%2BichUDYbekgDwCYoRak96M7GYjf4g%3D%3D"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수*/
			urlBuilder.append("&" + URLEncoder.encode("col_001", "UTF-8") + "=" + URLEncoder.encode("이소니아지드", "UTF-8")); /*품명*/
			urlBuilder.append(
					"&" + URLEncoder.encode("col_002", "UTF-8") + "=" + URLEncoder.encode("Isoniazide", "UTF-8")); /*품명(영문)*/

			//사용자가 url을 만드는 클래스

			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			System.out.println("Response code: " + conn.getResponseCode());

			//커넥션을 시작한다.

			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			} //스트링빌더에 라인을 붙여준다 == 여기 이해가 필요함
			rd.close();
			conn.disconnect();//
			System.out.println(sb.toString());
			%>


			<div class="test2" id="test2"></div>
		</div>

		<div class="searchlist">
			리스트</br>

		</div>

	</div>
</body>
</html>