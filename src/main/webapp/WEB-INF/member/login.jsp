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
<div class="login_container">
	<div>
		<form action="#" method="post">
			<div>
				<p>로그인</p>
				<input type="text" name="login_id" class="login_id" placeholder="ID" />
				<input type="text" name="login_pw" class="login_pw" placeholder="PW" />
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button" onclick="location.href='signup'">회원가입</button>
				<button type="button" onclick="location.href=''">아이디 패스워드 찾는고</button>
				
			</div>
		</form>
	</div>
</div>
</body>
</html>