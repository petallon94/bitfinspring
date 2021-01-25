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
<link rel="stylesheet" href="${root}/css/dcommu/normalize.8.0.1.css">
<link rel="stylesheet" href="${root}/css/dcommu/dcomdetail.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
	  $("#delete-btn").click(function(){
	    $("#myModal").modal();
	  });
	});  
</script>
<body>
	<div class="con-table">
		<div class="con-box">
			<div class="con-title">
				<h1>
					<b>${dto.csubject }</b>
				</h1>
			</div>
			<div class="con-writer">
				<b>${dto.cwriter }</b>
			</div>
			<div class="con-writedate">
				<fmt:formatDate value="${dto.cwritedate }"
					pattern="yyyy-MM-dd HH:mm" />
			</div>
			<div class="con-readcount">조회 ${dto.creadcount }</div>
			<div class="con-content">
				<hr class="con-line">
				<pre style="background-color: #fff;padding:10px;
				overflow: auto;white-space: pre-wrap;border: none; ">${dto.ccontent}</pre>
				<hr class="con-line">
			</div>
			<div class="con-btn">
				
				<%//세션에서 로그인 상태를 알 수 있는 loginok 얻기
		        String loginok=(String)session.getAttribute("loginok");
		        if(loginok!=null){%>
				<button type="button" class="btn btn-success btn-sm"
					style="width: 80px;"
					onclick="location.href='updateform?num=${dto.cnum}&pageNum=${pageNum}'">수정</button>

				<button type="button" class="btn btn-danger btn-sm" id="delete-btn"
					style="width: 80px;">삭제</button>
				<button type="button" class="btn btn-info btn-sm"
				style="width: 80px;"
				onclick="location.href='list?pageNum=${pageNum}'">목록</button>
				<%}else{ %>
				<button type="button" class="btn btn-info btn-sm"
				style="width: 80px; margin-left: 160px;"
				onclick="location.href='list?pageNum=${pageNum}'">목록</button>
				<%} %>
			</div>
		</div>
	</div>

	<!-- 모달 -->

	<div class="modal fade" id="myModal" role="dialog" style="margin-top: 100px;">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						게시물을 정말 삭제하시겠습니까?
					</h4>
				</div>
				<form action="delete" method="post" class="form-inline">
					<input type="hidden" name="cnum" value="${dto.cnum}">
  					<input type="hidden" name="pageNum" value="${pageNum }">	
					<div class="modal-body" style="padding: 40px 50px; text-align: center;">
						<button type="submit" style="width: 80px;">
							<span class="glyphicon glyphicon-trash"></span> 삭제
						</button>
						<button type="button" style="width: 80px;" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 취소
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
</body>
</html>