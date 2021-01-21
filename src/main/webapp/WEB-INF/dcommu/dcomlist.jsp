<%@page import="java.util.List"%>
<%@page import="spring.card.dao.CardDao"%>
<%@page import="spring.dto.CardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>" />

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
<link rel="stylesheet" href="${root}/css/dcommu/dcomlist.css">
<link rel="stylesheet" href="${root}/css/dcommu/normalize.8.0.1.css">
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<title>Insert title here</title>
</head>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dcom-slider-list').slick({
			slide: 'li',		//슬라이드 되어야 할 태그 ex)
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 5,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 3,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
			autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
			dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : true, 	//드래그 가능 여부 
			
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 1000, //화면 사이즈 1000px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:4,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 800, //화면 사이즈 800px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 600, //화면 사이즈 600px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2,
						slidesToScroll : 2
					} 
				},
				{ 
					breakpoint: 400, //화면 사이즈 400px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:1,
						slidesToScroll : 1
					} 
				}
			]
		});
	})
</script>
<style>

</style>
<body style="background-color: #1f2c59;">
	
	
	<div class="dcom-top-bn-box con">
		<div class="dcom-img-mainbox">
			<img style="height: 400px;"
				src="https://www.fashionseoul.com/wp-content/uploads/2017/01/20170112_SBS-2.jpg"
				alt="">
		</div>
	</div>

	<!-- search start-->
	<div class="dcom-search-bar">
		<div class="dcom-search-box" id="slide-list">
			<div class="dcom-tc">
				<c:if test="${totalCount==0 }">
					<div>
						<b>등록된 글이 없습니다</b>
					</div>
				</c:if>
				<c:if test="${totalCount>0 }">
					<div>
						<b>총 ${totalCount }개의 게시글이 등록되어있습니다</b>
					</div>
				</c:if>
			</div>
			<input class="dcom-search" id="dcom-search" type="text" />
			<button type="button" class="dcom-search-btn" onclick="">검색하기</button>
			<!-- <div class="dcom-write-box"> -->
			<button type="button" class="dcom-write-btn" style="width: 100px;"
				onclick="location.href='writeform?cmidnum='">게시글작성</button>
			<!-- </div> -->
		</div>
	</div>
	<!-- search end-->
	<hr class="slideline">
	<!-- slide start-->
	<div class="dcom-slide-bar">
		<div class="dcom-slide-box">
			<div style="color: white;"><h4><b>인기 조회 게시물</b></h4></div>
			<ul class="dcom-slide-list" id="dcom-slider-list">
				<c:forEach var="d" items="${list }" varStatus="i">
					<li class="dcom-slide"><a
						href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="slide-img-bar">
								<div class="slide-img-box">
									<img
									src="https://thewiki.ewr1.vultrobjects.com/data/4861736874656173657232303230303132355f322e6a7067.jpg"
									alt="">
								</div>
								<div style="position: relative; max-width: 100%; background-color: black;">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day">
										<fmt:formatDate value="${d.cwritedate}" pattern="yyyy MM-dd HH:mm" />
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- slide end-->
	<hr class="slideline">
	<!-- card start-->
	<div class="dcom-prod-list-bar dcom-con">
		<div class="dcom-prod-list-box">
			<ul class="dcom-row">
				<c:forEach var="d" items="${list }" varStatus="i">
					<li class="dcom-cell"><a
						href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">
							<input type="hidden" value="${i.count}">
							<div class="dcom-img-bar">
								<div class="dcom-img-box">
									<img
										src="https://thewiki.ewr1.vultrobjects.com/data/4861736874656173657232303230303132355f322e6a7067.jpg"
										alt="">
								</div>
								<div style="position: relative; max-width: 100%; background-color: black;">
									<div class="dcom-prod-subject">${d.csubject}</div>
									<div class="dcom-prod-writer">${d.cwriter}</div>
									<div class="dcom-prod-day">
										<fmt:formatDate value="${d.cwritedate}"
											pattern="yyyy MM-dd HH:mm" />
									</div>
								</div>
							</div>
					</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- card end-->
<div class="page-bar">
		<ul class="pagination page-box">
			<c:if test="${startPage>1 }">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${startPage-1 }">이전</a>
				</li>
			</c:if>
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li class="page-item">
						<a class="page-link" href="list?pageNum=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li class="page-item">
					<a class="page-link" href="list?pageNum=${endPage+1 }">이전</a>
				</li>
			</c:if>
		</ul>
</div>
</body>
</html>