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
    
<!-- css -->
<link rel="stylesheet" href="${root}/css/board/boardcontent.css" />

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<div class="board_contentlayout">

		<div class="board_contentsmain">
			<h3 onclick = "location.href='../board/'" >의료정보 커뮤니티</h3>
		</div>
	</div>
	
	<div class="board_contentsc">			
		<div class="board_contentsform">						
			<h3> ${dto.bsubject}</h3>
			<h4> ${dto.bwriter}</h4>
			<h4> 조회수 : ${dto.breadcount}</h4>
			 
			 <c:forEach var="a" items="${hdto}">
						<div class="hashtag">
							<span class="glyphicon glyphicon-ok"></span> ${a.hashtag}
						</div>
			</c:forEach>
			 
		</div>
		<hr>
			<div class ="board_concon">
			<p>${dto.bcontent}</p>
			</div>				
	</div>	
			<div class ="board_conbtngrp">
			<hr>
			<button type="button" class="board_clistbtn" onclick = "location.href='../board/list'">목록</button>
			<button type ="button" class ="board_cupdbutton" onclick="location.href='updatepassform?num=${dto.bnum}&pageNum=${pageNum}'" >수정</button>			
			<button type ="button" class ="board_cdelbutton" onclick="location.href='deletepassform?num=${dto.bnum}'">삭제</button>
			</div>
</body>

</html>


