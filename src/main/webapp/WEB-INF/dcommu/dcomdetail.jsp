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
<link rel="stylesheet"
	href="${root}/css/dcommu/normalize.8.0.1.css">
	<link rel="stylesheet"
	href="${root}/css/dcommu/dcomdetail.css">
<title>Insert title here</title>
</head>
<body>
<div class="con-table">
	<div class="con-box">
	 	<!-- hidden start-->
        <input type="hidden" id="cnum" value="${dto.cnum}">
        <!-- hidden end-->
		<div class="con-title"><h1><b>${dto.csubject }</b></h1></div>
		<div class="con-writer"><b>${dto.cwriter }</b></div>
		<div class="con-writedate">
			<fmt:formatDate value="${dto.cwritedate }" pattern="yyyy-MM-dd HH:mm"/>
		</div>
		<div class="con-readcount">조회 ${dto.creadcount }</div>
		<div class="con-content">
			<hr class="con-line">
			<pre>${dto.ccontent}</pre>
			<hr class="con-line">
		</div>
		<div class="con-btn">		
			<button type="button" class="btn btn-info btn-sm" style="width: 80px;"
			onclick="location.href='list?pageNum=${pageNum}'">목록</button>
		
			<button type="button" class="btn btn-success btn-sm" style="width: 80px;"
			onclick="location.href='update?num=${dto.cnum}&pageNum=${pageNum}'">수정</button>
			
			<button type="button" class="btn btn-danger btn-sm" style="width: 80px;"
			onclick="location.href='delete?num=${dto.cnum}&pageNum=${pageNum}'">삭제</button>
		</div>
	</div>
</div>
</body>
</html>