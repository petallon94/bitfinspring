<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<html>
<head>
    <title>알림창</title>
</head>
<style>
	body{
		background-color:#1f2c59;
	}
	
</style>
<body>
<script>
	swal({
        title: "${alert_title}",
        icon: "${alert_icon}",
        button: true,
        closeOnClickOutside: false
    })
        .then(function () {
            location.href = "${url}";
        });
    
</script>
</body>
</html>