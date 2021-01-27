<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$( document ).ready(function() {
    $.ajax({
        url:'medicine/test',
        type:'get',
        dataType:'text', // 리턴해주는 타입을 지정해줘야함
        beforeSend:function(jqXHR) {
            console.log("ajax호출전");
        },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
        success: function(data) {
            console.log("호출성공");
            console.log(JSON.parse(data));
        },// 요청 완료 시
        error:function(jqXHR) {
            console.log("실패입니다.");
        }// 요청 실패.
    });
});
</script>

</head>
<body>
스프링 부트 테스트
</body>
</html>