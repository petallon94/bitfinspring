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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="${root}/css/board/boardmain.css" />

</head>
<body>

	<div class="board_layout">

		<div class="board_main">
			<h3>의료정보 커뮤니티</h3>
			<div style="display: flex; justify-content: center;">

				<div class="hashtagform">
					<span>해시태그를 눌러서 검색해 보세요!</span>
					<div style="margin-top: 10px;">
						<!-- ★여기에 해시태그 for each 넣어야됩니당★ -->
						<div class="hashtag">
							<span class="glyphicon glyphicon-ok"></span> 수진이
						</div>

						<div class="hashtag">
							<span class="glyphicon glyphicon-ok"></span> 민정이
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="board_search">
			<h3>#해시태그 검색</h3>
			<input type="text" class="board_textfield" />
			<button type="button" class="board_searchbtn">검색하기</button>
		</div>
		

	<!-- board 출력 -->
	<div>
	<c:forEach var="b" items="${list}">
		<div class="board_list">
			<div class="board_left">
				<h4>${b.bsubject}</h4>
				<div class="board_content">
					본문
					<p>${b.bcontent}</p>
				</div>
				<div class="board_content_bottom">
					<div>
					<h5>
						<fmt:formatDate value="${b.bwritedate}" pattern="yyyy-MM-dd" />
					</h5>
					<h5>${b.bwriter}</h5>
					</div>
					<ul>
						<li>해시태그 자리</li>
						<li>추후구현예정</li>
					</ul>
				</div>
			</div>
			<div class="board_right">
				<img
					src="https://dispatch.cdnser.be/wp-content/uploads/2017/08/20170816091129_5.jpg"
					style="width: 200px; height: 200px;" />
			</div>
		</div>
	</c:forEach>
	</div>



	<hr>
	<div class="boardpage" style="width: 800px; text-align: center;">
		end
		<ul class="pagination">
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<c:if test="${pp==currentPage}">
					<li class="active"><a href="list?pageNum=${pp}">${pp}</a></li>
				</c:if>
				<c:if test="${pp!=currentPage}">
					<li><a href="list?pageNum=${pp}">${pp}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalPage}">
				<li><a href="list?pageNum=${endPage+1}">다음</a></li>
			</c:if>

		</ul>
	</div>

	<div class="board_bottom">
		<button type="button" class="board_write_btn"
			onclick="location.href='board/boardwrite'">글쓰기</button>

	</div>
	
	
</body>
</html>