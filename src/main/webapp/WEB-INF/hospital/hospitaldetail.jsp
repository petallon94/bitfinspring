<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=87ba928e25c8fcc2c9de8e5b9ed0814f"></script>
  
</head>

<body>
<div class="hospital_detail">
<input type="hidden" name="hname" velue="${hname}">
<input type="hidden" id="loginok" value="${mdto.mid }" />
<div id="hospital__detail_title" name="hname" value="">산넘어산 병원</div>
<!-- 지도를 표시할 div 입니다 -->
<div id="hospital__map"></div>
<div class="hospital__detail_addr">서울 강남구 삼성동(삼성2동) 8 강남구보건소
</div>
<div class="hospital__detail_time">평일: 09:00 ~ 21:00	토요일: 09:00 ~ 19:00	일요일: 09:00 ~ 19:00
</div>
<div class="hospital__detail_tel">02-3423-5555</div>

<button type="button" class="btn btn-info" onclick="location.href='./reserve/writeform'">예약하기</button>
<!-- <button type="button" class="btn btn-info" onclick="location.href='./reserve/writeform?hname=${hname}'">예약하기</button>
-->
<button type="button" class="btn btn-warning">1대1 채팅하기</button>
</div>							
<script type="text/javascript">
function goWrite() {
$("#btn-insert").click(function() {
	var loginok= $("#loginok").val();
	if(loginok != ""){
		location.href="writeform?cmidnum=${mdto.mnum}&pageNum=${currentPage }";
	}else{
		alert("회원가입후 다시 이용해주세요");
		location.href="/member/login";
	}
});
</script>

</body>
</html>