<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services"></script>

</head>
<body>
<div class="hospital_detail_container">
   <div class="hospital_detail form-inline">
      <input type="hidden" name="hname" velue="${hname}">
      <input type="hidden" id="loginok" value="${mdto.mid }" />
      <input type="hidden" id="keyword" name="keyword" value="${name}" />
      
      <div id="hospital__detail_title" name="hname" value="">${name}</div>
      <br><br>
   
      <div class="hospital__detail_addr glyphicon glyphicon-home">
      ${addr}</div>
      <br><br>
      <div class="hospital__detail_time">
      <b>진료시간</b><br>
      평   일: 09:00 ~ 21:00<br>
      토요일: 09:00 ~ 19:00<br>
      일요일: 09:00 ~ 19:00<br>
      </div>
      <br>
      <div class="hospital__detail_tel glyphicon glyphicon-earphone">
      ${tel}</div>
      <br><br>
      
      <button type="button" id="btn-insert" class="btn btn-info">예약하기</button>
      <br><br>
   </div>   
   <!-- 지도를 표시할 div 입니다 -->
   <div id="hospital__map" class="form-control"></div>
</div>

                  
<script type="text/javascript">
$(function() {
   $("#btn-insert").click(function() {
      var loginok= $("#loginok").val();
      if(loginok != ""){
         location.href="/reserve/writeform";
      }else{
         swal("로그인후 다시 이용해주세요","","warning")
         .then(function(){
            location.href="/member/login";
         });
      }
   });
});

</script>

</body>
</html>