<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p class="hospital__rsv_hname">산넘어산 병원</p>
<span class="hospital__rsv_hnamesub">운영시간 기재</span><br>
<form action="insert" method="post">
	<div class="hospital__rsv">	
		<table class="table table-bordered" style="width: 600px;">
		<caption style="caption-side: top;"><b>예약하기</b></caption>
		<tr>
			<th style="width: 120px;" bgcolor="#ddd">성함</th>
			<td>
			 	<input type="text" name="rmnum" class="rmnum" required="required">
			</td>
		</tr>
			<tr>
			<th style="width: 120px;" bgcolor="#ddd">전문의 이름</th>
			<td>
			 	<input type="text" name="rdmnum" class="rdmnum" required="required">
			</td>
		</tr>
			<tr>
			<th style="width: 120px;" bgcolor="#ddd">증상정보</th>
			<td>
			 	<textarea style="width: 490px; height: 100px;"
				name="rmemo" class="form-control"
				required="required"></textarea>
			</td>
		</tr>
		<tr>
			<th style="width: 120px;" bgcolor="#ddd">예약날짜</th>
			<td>
				<input type="date" name="rdate" class="form-control"
				value="2021-01-19">
			 	
			</td>
		</tr>
		<tr>
			<th style="width: 120px;" bgcolor="#ddd">예약시간</th>
			<td>
				<select name="rtime" class="form-control" style="margin-right: 10px;">
							<option value="08:30" selected="selected">08:30</option>
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
				</select>  	
			</td>
		</tr>
			<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-info btn-sm"
				style="width: 100px;" >예약하기</button>
				<button type="button" class="btn btn-warning btn-sm"
				style="width: 150px;"
				onclick="location.href='list'">나의 예약목록보기</button>
			</td>
		</tr>
		</table>
</div>
</form>
</body>
</html>