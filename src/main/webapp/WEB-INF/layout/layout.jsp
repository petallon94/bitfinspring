<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="layout">
	레이아웃입니다.
   <div id="header">
      <tiles:insertAttribute name="header"/>
   </div>
   <div id="main">
      <tiles:insertAttribute name="main"/>
   </div>
   <div id="footer">
      <tiles:insertAttribute name="footer"/>
   </div>
</div>
</body>
</html>