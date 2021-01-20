<%@page import="java.util.List"%>
<%@page import="spring.card.dao.CardDao"%>
<%@page import="spring.dto.CardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, minimum-scale=1, 
user-scalable=yes,initial-scale=1.0, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
	href="${root}/css/dcommu/dcomlist.css">
	<link rel="stylesheet"
	href="${root}/css/dcommu/normalize.8.0.1.css">
<title>Insert title here</title>
</head>
<body style="background-color: #1f2c59;">

	<div class="dcom-top-bn-box con">
		<div class="dcom-img-box">
			<img style="height: 400px;"
				src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg"
				alt="">
		</div>
	</div>


	<div class="dcom-search-bar">
		<div class="dcom-search-box">
			<div class="dcom-tc">
				<c:if test="${totalCount==0 }">
					<div><b>등록된 글이 없습니다</b></div>
				</c:if>
				<c:if test="${totalCount>0 }">
					<div><b>총 ${totalCount }개의 게시글이 등록되어있습니다</b></div>
				</c:if>
			</div>
			<input class="dcom-search" id="dcom-search" type="text"/>
			<button type="button" class="dcom-search-btn" onclick="">검색하기</button>
			<!-- <div class="dcom-write-box"> -->
				<button type="button" class="dcom-write-btn" style="width: 100px;"
				onclick="location.href='writeform?cmidnum='">게시글작성</button>
			<!-- </div> -->
		</div>
	</div>
	
	
	<div class="dcom-prod-list-bar dcom-con">
		<div class="dcom-prod-list-box">
			<ul class="dcom-row">
				<c:forEach var="d" items="${list }" varStatus="i">
					<li class="dcom-cell">
						<a href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="dcom-img-box">
								<img
									src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg"
									alt="">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day"><fmt:formatDate value="${d.cwritedate}" pattern="yyyy MM-dd HH:mm"/></div>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>