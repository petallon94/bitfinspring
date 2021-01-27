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
			var searchType=$("#searchType").val();
			var keyword=$("#keyword").val();
			//alert(word+","+search);
			//alert(search+":"+word);
			//검색한 값이랑 단어의 값을 넣으면
			//전체 선택했을 경우,
			$.ajax({
				type:"get",
				dataType: "json",
				url:"/doctor/dsearch",
				data:{"searchType":searchType,"keyword":keyword},
				success:function(data){
					//alert(data);
					var s = '';
					$.each(data,function(index,item){
						var cphoto = item.cphoto;
						var csubject = item.csubject;
						var cwriter = item.cwriter;
						var cwritedate = item.cwritedate;
						
						s+='<div class="dcom-prod-list-bar dcom-con">';
						s+='<div class="dcom-prod-list-box">';
						s+='<ul class="dcom-row">';
						s+='<li class="dcom-cell">';
						s+='<a href="detail?num=${d.cnum}&pageNum=${currentPage }&key=list">';
						s+='<div class="dcom-img-bar">';
						s+='<div class="dcom-img-box">';
						s+='<img src="${pageContext.request.contextPath}/resources/save/'+cphoto+'"alt="">';
						s+='</div>';
						s+='<div style="position: relative; max-width: 100%; background-color: black; display: block; white-space: nowrap;">';
						s+='<div class="dcom-prod-subject">'+csubject+'</div>';
						s+='<div class="dcom-prod-writer">'+cwriter+'</div>';
						s+='<div class="dcom-prod-day">'+cwritedate+'</div>';	
						s+='</div></div></a></li></ul></div></div>';
						
					});
					$("#cnffur").html(s);	
			}
		});
	});	
		//전체 선택하면 입력단어 지워주기
		$("#searchType").change(function(){
			$("#keyword").val("");
		});
	});//$function close
</script>
<style>
	/* 배너 */
/* .img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.5);z-index:1;} */
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(https://previews.123rf.com/images/sapannpix/sapannpix1604/sapannpix160400008/54710924-%EC%9D%98%EC%82%AC%EC%99%80-%EA%B0%84%ED%98%B8%EC%82%AC-%EB%B0%8F-%EC%9D%98%EB%A3%8C-%EC%A7%81%EC%9B%90%EC%9D%80-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%84%B8%ED%8A%B8.jpg);height: 600px;background-size:cover;background-position:center;}
/* 배너 */
</style>
<body>
	<input type="hidden" id="loginok" value="${mdto.mid }" />
	


<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <!-- <h1>커뮤니티</h1>
        <p>의견을 공유하세요</p> -->
    </div>
    <div class="img-cover"></div>
</div>
	<!-- <div class="dcom-top-bn-box con">
		<div class="dcom-img-mainbox">
			<img style="height: 400px;"
				src="https://www.fashionseoul.com/wp-content/uploads/2017/01/20170112_SBS-2.jpg"
				alt="">
		</div>
	</div -->>

	<!— search start—>
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
					<option value="all">전체</option>
					<option value="t">제목</option>
					<option value="c">내용</option>
					<option value="w">작성자</option>
				</select> <input class="form-control" type="text" id="keyword" name="keyword"
					placeholder="검색어를 입력하세요" />
				<button id="searchBtn" class="btn btn-primary">Search</button>
			</div>
			<button type="button" id="btn-insert" class="dcom-write-btn" style="width: 100px;"
			>게시글작성</button>
		</div>
	</div>
	<!-- search end -->
	<hr class="slideline">
	<jsp:include page="dcomlistslide.jsp"></jsp:include>
	<hr class="slideline">
	<!-- card start-->
   <div id="cnffur"></div>
   
</body>
</html>