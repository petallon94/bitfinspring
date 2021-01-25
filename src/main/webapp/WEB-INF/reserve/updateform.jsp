<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<body>
<div class="rsv__con">
<div class="rsv__container">
		<h2 class="rsv__title">병원예약수정</h2>
		<h3 class="rsv__section_title">산넘어산병원</h3>
		<p class="rsv__section_txt">
			영업시간: 월~ 금 8:30~ 16:00<br>
		<hr>		
		<form action="update" method="post" enctype="multipart/form-data">
	<!-- hidden -->
	<input type="hidden" name="rnum" value="${dto.rnum}">

	<div class="rsv__section1">
				<input type="text" id="rsv__select_date" name="rdate"
					value="${dto.rdate}"/> 
					<input type="text"
					id="rsv__select_time" class="rsv__select" name="rtime"
					value="${dto.rtime}"/>
			</div>
			<div class="rsv__section2">
				<input type="text" name="rmnum" class="rsv__select" value="${dto.rmnum}" readonly="readonly"> 
				<input type="text" name="rdmnum" class="rsv__select" value="${dto.rdmnum}" readonly="readonly">
				<input id="rsv__memo" name="rmemo" class="rsv__select" value="${dto.rmemo}">
			</div>
		
		<div class="rsv__section3">
			<hr>
			<button type="submit" class="rsv__updateformbtn">예약수정</button>
			<button type="button" class="rsv__gotolistbtn" onclick="location.href='list'">목록</button>
		</div>
		</form>
</div>
</div>
</body>
<script type="text/javascript">

//datepicker기능
$("#rsv__select_date").flatpickr({ 
inline: true,
dateFormat: "Y-m-d",
minDate:"today",//오늘이전은 선택불가 
//maxDate: new Date().fp_incr(30) //오늘로부터 30일이후까지만 선택가능
});

//timepicker기능
$("#rsv__select_time").flatpickr({ 
	enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",    
    minTime: "08:00",
    maxTime: "20:00",
    minuteIncrement : "30"	
	});

</script>

</html>