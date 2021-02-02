<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services"></script>
 
</head>
<body>
<div class="hospital_detail">
<input type="hidden" id="loginok" value="${mdto.mid }" />
<input type="hidden" id="mnick" name="mnick" value="${mdto.mnick }" />
<div id="hospital__detail_title" name="hname" id="hdetail_name"><c:out value="${param.name}"></c:out></div>
<!-- 지도를 표시할 div 입니다 -->
<div id="hospital__map"></div>
<div class="hospital__detail_addr" id="hdetail_addr"><c:out value="${param.addr}"></c:out></div>
<div class="hospital__detail_tel" id="hdetail_tel"><c:out value="${param.tel}"></c:out></div>
<button type="button" id="btn-insert" class="btn btn-info">예약하기</button>
</div>							
<script type="text/javascript">
$(function() {
	$("#btn-insert").click(function() {
		var loginok= $("#loginok").val();
		if(loginok != ""){
			location.href="/reserve/writeform";
		}else{
			alert("회원가입후 다시 이용해주세요");
			location.href="/hospitaldetail";
		}
	});
});



</script>

</body>
</html>