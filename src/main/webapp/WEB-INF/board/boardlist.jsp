<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="${root}/css/board/boardmain.css" />

</head>
<body>
	<div class="layout">
		보드 레이아웃입니다.
		<div class="hashtagform">해시태그 출력
		<div class="hashtag"><span class="glyphicon glyphicon-ok"></span> 수진이</div>
		
		
		</div>
		<div class="search">
			검색 <input type="text" />
			<button type="button">버튼</button>
		</div>
		<hr>
		<div class="boardlist">
		<div class ="boardleft">
		제목
		<div class ="boardcontent">
		본문
		<p>
		14일 방송되는 SBS 예능프로그램 ‘맛남의 광장’에서는 백종원, 양세형, 김희철, 유병재, 
		김동준이 게스트 이지아와 함께 제철 시금치 소비 촉진을 위해 포항으로 향하는 모습이 그려진다.
		</p>
		</div>
		</div>
		<div class ="boardright">
		<img src ="https://dispatch.cdnser.be/wp-content/uploads/2017/08/20170816091129_5.jpg" style ="width :200px; height : 200px;"/>
		
		</div>
		
		</div>
		<hr>
	</div>
	<div class = "boardpage"> 보드페이지 </div>
</body>
</html>