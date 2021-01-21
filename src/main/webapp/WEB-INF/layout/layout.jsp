
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
<!-- JQuery minimal version 입니당.-->
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"
></script>

<!-- Boot Strap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- CSS 파일 -->
<link rel="stylesheet" href="${root}/css/fullpage.min.css" />
<link rel="stylesheet" href="${root}/css/layout.css" />
<link rel="stylesheet" href="${root}/css/hospital.css" />
<link rel="stylesheet" href="${root}/css/member.css" />
<link rel="stylesheet" href="${root}/css/mypage/m_member.css" />
<!-- JS 파일 -->
<script src="${root}/js/fullpage.min.js" ></script>
<script src="${root}/js/member.js"></script>
<script src="${root}/js/map.js"></script>


</head>
<body>
<div class="layout">
	<div id="header">
		<%//세션에서 로그인 상태를 알 수 있는 loginok 얻기
	        String loginok=(String)session.getAttribute("loginok");
	        if(loginok==null){%>
            	<tiles:insertAttribute name="header"/>
            <%}else{%>
            	<tiles:insertAttribute name="header2"/>
          	<%}%>
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