<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>
<div>			
 <c:if test="${totalCount==0 }">
	<span class="alert alert-info">
	저장된 데이터가 없습니다.
	</span>
</c:if>
<c:if test="${totalCount>0 }">
	<span class="alert alert-info">
	총 ${totalCount}개의 예약정보가 있습니다.
	</span>
</c:if>
</div>	
<br><br>
<table class="table table-bordered" style="width: 700px;">
	<tr bgcolor="#ddd">
		<th style="width: 200px;">번호</th>
		<th style="width: 200px;">내 id</th>
		<th style="width: 200px;">의사 id</th>
		<th style="width: 1000px; text-align: center">증상</th>
		<th style="width: 300px;">예약날짜</th>
		<th style="width: 300px;">예약시간</th>
		<th style="width: 300px;">관리</th>
	</tr>	
 <c:forEach var="a" items="${list}" varStatus="i">
	<tr align="center">
		<td>${i.count}</td>
		<td>${a.rmnum}</td>
		<td>${a.rdmnum}</td>
		<td>${a.rmemo}</td>
		<td>${a.rdate}</td>
		<td>${a.rtime}</td>
		
		<td>
			<button type="button" class="btn btn-info btn-sm" onclick="location.href='updateform?rnum=${a.rnum}'" >수정</button>
			<button type="button" class="btn btn-info btn-sm" onclick="location.href='delete?rnum=${a.rnum}'">삭제</button>
		</td>
		</tr>
		</c:forEach> 
		</table> 
</body>
</html>