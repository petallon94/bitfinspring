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
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
$(function(){
		$("#btn-insert").click(function() {
			var loginok= $("#loginok").val();
			if(loginok != ""){
				location.href="writeform?cmidnum=${mdto.mnum}&pageNum=${currentPage }";
			}else{
				alert("회원가입후 다시 이용해주세요");
				location.href="/member/login";
			}
		});
		//검색 
		$("#searchBtn").click(function(){
			//변수
			var search=$("#searchType").val();
			var word=$("#keyword").val();
			//alert(search+":"+word);
			//검색한 값이랑 단어의 값을 넣으면
			//전체 선택했을 경우,
			$.ajax({
				type:"get",
				dataType:"html",
				url:"gonji/gonsavesession.jsp",
				data:{"searchType":searchType,"keyword":keyword},
				success:function(data){
					//페이지 번호를 없애고 전체 새로고침한다
					location.href="list"
				}
			});//$.ajax close
		});//$("#btndatasearch") close
		
		//전체 선택하면 입력단어 지워주기
		$("#searchType").change(function(){
			$("#keyword").val("");
		});
	});//$function close
</script>
<body style="background-color: #1f2c59;">
	<input type="hidden" id="loginok" value="${mdto.mid }" />

	<div class="dcom-top-bn-box con">
		<div class="dcom-img-mainbox">
			<img style="height: 400px;"
				src="https://www.fashionseoul.com/wp-content/uploads/2017/01/20170112_SBS-2.jpg"
				alt="">
		</div>
	</div>

	<!-- search start-->
	<div class="dcom-search-bar">
		<div class="dcom-search-box">
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
			<div class="form-inline">
				<select id="searchType" name="searchType">
					<option value="all">전체조건</option>
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="w">작성자</option>
				</select> <input class="form-control" type="text" id="keyword" name="keyword"
					value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요" />
				<button id="searchBtn" class="btn btn-primary">Search</button>
			</div>
			<button type="button" id="btn-insert" class="dcom-write-btn" style="width: 100px;"
			>게시글작성</button>
		</div>
	</div>
	<!-- search end-->
	<hr class="slideline">
	<jsp:include page="dcomlistslide.jsp"></jsp:include>
	<hr class="slideline">
	<jsp:include page="dcomlistbox.jsp"></jsp:include>
</body>
</html>