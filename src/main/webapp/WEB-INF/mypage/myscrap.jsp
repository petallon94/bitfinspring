<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="mypage_wrapper">
	<div class="mypage_title">
		My Page
	</div>
	
	<!-- 메뉴 -->
	
	<div class="mypage_menubar">
		<ul class="mypage_menu_icon">
			<li>
				<a href="${root}/mypage.main">
					<div class="mypage_icon icon_mycontent"></div>
					마이페이지
				</a>
			</li>
			<li>
				<a href="${root}/mypage.content">
					<div class="mypage_icon icon_mycontent"></div>
					내가 쓴 글
				</a>
			</li>
			<li class="mpick">
				<a href="${root}/mypage.scrap">
					<div class="mypage_icon icon_scrap"></div>
					스크랩
				</a>
			</li>
			<li>
				<a href="${root}/mypage.reservation">
					<div class="mypage_icon icon_reservation"></div>
					예약내역
				</a>
			</li>
			<li>
				<a href="${root}/mypage.information">
					<div class="mypage_icon icon_myinformation"></div>
					나의 정보
				</a>
			</li>
		</ul>
	</div>
	
	
	<!-- 내용 시작 -->
	<h2>스크랩</h2>
	<c:if test="${totalCount==0}">
		<div class="alert alert-info">
			<b>스크랩한 글이 없습니다</b>
		</div>
	</c:if>
	<c:if test="${totalCount>0}">
		<div class="alert alert-info">
			<b>총 ${totalCount}개의 글이 있습니다</b>
		</div>
	</c:if>
	<br>
	
	<table class="table table-bordered" style="width: 1000px;">
		<caption><b>스크랩 목록 출력</b></caption>
		<tr bgcolor="#ddd">
			<th style="width: 60px">번호</th>
			<th style="width: 400px">제목</th>
			<th style="width: 80px">작성자</th>
			<th style="width: 120px">작성일</th>
			<th style="width: 60px">조회수</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="i">
			<tr align="center" style="cursor: pointer;"
			onclick="location.href=detail?num=${dto.snum}">
			<!-- 글번호 -->
			<td>${i.count}</td>
			<!-- 이미지 -->
			<c:if test="${dto.cphoto!='no'}">
				<img src="../../resources/save/${dto.cphoto}"
				style="width: 60px;height: 60px;">
			</c:if>
			<!-- 제목 -->
			<td>${dto.csubject}</td>
			<!-- 작성자 -->
			<td>${dto.cmidnum}</td>
			<!-- 작성일  -->
			<td>
				<fmt:formatDate value="${dto.cwritedate}"	
				pattern="yyyy-MM-dd"></fmt:formatDate>			
			</td>
			<!-- 조회수 -->
			<td>${dto.creadcount}</td>
			</tr>
		</c:forEach>
	</table>
	
</div>
</body>
</html>









