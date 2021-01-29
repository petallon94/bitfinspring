<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, maximum-scale=1.0, minimum-scale=1, 
user-scalable=yes,initial-scale=1.0, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<style>
body,ul,li {
	margin: 0;
	padding: 0;
	list-style: none;
}

a  {
	color: inherit;
	text-decoration: none;
}

html,body {
	overflow-x: hidden;
}

.safe-con {
	margin: 0 auto;
}

.safe-row::after {
	content: "";
	display: block;
	clear: both;
}

.safe-cell {
	float: left;
}


.safe-img-box img {
	display: block;
	width: 100%;

}

.safe-con {
	max-width: 100%
}

.safe-list-bar .safe-list-box ul li {
	width: calc(100%/3);
	box-sizing: border-box;
	padding: 0 10px;
	margin-top: 10px;
}

.safe-list-bar .safe-list-box ul {
	margin: 0 -10px;
}



@media (max-width: 1024px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/2);
	}
}
@media (max-width: 800px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/2);
	}
}
@media (max-width: 640px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/1);
	}
} 


</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 
<script>
	$(document).ready(function(){
		callApiXml();
	});
function callApiXml() {
	 $.ajax({
         url:'/mainsafe/list',
         type:'get',
         dataType:'json', // 리턴해주는 타입을 지정해줘야함
         success: function(data) {
            //alert(data);
            s="";
            $.each(data,function(index,item){
            	alert(index);
            	console.log(item.countryEnName);
			});
         }
     });
}
    
</script>

<body>
	<div id="safe"></div>
	<!-- <div class="safe-top-box safe-con">
		<div class="safe-img-box">
			<img style="height: 400px;" alt="" src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg">
		</div>
	</div>
	
	<div class="safe-list-bar safe-con">
		<div class="safe-list-box">
		  <ul class="safe-row">
			<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		 	<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		 	<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		 	<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		  	<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		  	<li class="safe-cell">
			  <a href="#">
				<div class="safe-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
				<div class="safe-title">방역수칙</div>
				<div class="safe-content">손씻기</div>
				<div class="safe-writer">이상헌</div>
			  </a>
			</li>
		  </ul>
		</div>
	</div> -->
	
</body>
</html>