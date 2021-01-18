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
<div class="signup_container">
<br><br><br><br><br><br>
	<a href="${root}/member/msignup">
		<div>
			일반회원
		</div>
	</a>
	<a href="${root}/member/dsignup">
		<div>
			전문회원
		</div>
	</a>
	



</div>
</body>
</html>