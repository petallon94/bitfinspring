<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="margin: 500px;">예약성공</h1>
<button type="button" class="btn btn-warning btn-sm"
				style="width: 150px;"
				onclick="location.href='${root}'">메인으로 돌아가기</button>
<button type="button" class="btn btn-warning btn-sm"
				style="width: 150px;"
				onclick="location.href='list?rnum=${a.rnum}'">나의 예약목록보기</button>
</body>
</html>