<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/css/fullpage.min.css" />
<script src="${root}/js/fullpage.min.js" ></script>
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