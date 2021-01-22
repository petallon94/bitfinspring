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
			<li>
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
			<li class="mpick">
				<a href="${root}/mypage.information">
					<div class="mypage_icon icon_myinformation"></div>
					나의 정보
				</a>
			</li>
		</ul>
	</div>
	
	
	<!-- 내용 시작 -->
	
	나의 정보
	<button type="button" id="mupdate_btn">버튼</button>
	<hr>
	<table>
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${mdto.mid }</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${mdto.mnick}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${mdto.memail}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${mdto.mhp}</td>
			</tr>
			<tr>
				<th>회원타입</th>
				<td>
					<c:if test="${mdto.mrole==0}">
						일반회원
					</c:if>
					<c:if test="${mdto.mrole==1}">
						전문회원
					</c:if>
				</td>
			</tr>
			<c:if test="${mdto.mrole==1}">
				<tr>
					<th>채팅사용여부</th>
					<td></td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>


<!-- 회원수정 모달 -->

	<div class="modal fade" id="updateMember" role="dialog" style="margin-top: 100px;">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						정보 수정을 원하시면 비밀번호를 입력해주세요.
					</h4>
				</div>
				<form action="${root}/member/update.passcheck" method="post" class="form-inline">
					<input type="text" name="mid" value="${mdto.mid}">
					<input type="hidden" name="mid" value="${mdto.mrole}">
  					<input type="text" name="mpw" >
					<div class="modal-body" style="padding: 40px 50px; text-align: center;">
						<button type="submit" style="width: 80px;">
							<span class="glyphicon glyphicon-trash"></span> 수정하기
						</button>
						<button type="button" style="width: 80px;" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 취소
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#mupdate_btn").click(function(){
			$("#updateMember").modal();
		});
	});
</script>
</html>