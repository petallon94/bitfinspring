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
.safe-img-box {
	border: 1px solid #cccccc;

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

	/* 배너 */
/* .img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.5);z-index:1;} */
.sub_visual .txt{position: absolute;top:50%;left:50%;transform: translate(-50%, -50%);color: white;z-index: 2;text-align: center;}
.sub_visual .txt h1:after{display:block;width:40px;height:3px;margin:32px auto;background:white;content:'';}
.sub_visual .txt p{font-size: 14pt; font-weight: 300;}
.sub_visual{position: relative;background-image: url(https://previews.123rf.com/images/sapannpix/sapannpix1604/sapannpix160400008/54710924-%EC%9D%98%EC%82%AC%EC%99%80-%EA%B0%84%ED%98%B8%EC%82%AC-%EB%B0%8F-%EC%9D%98%EB%A3%8C-%EC%A7%81%EC%9B%90%EC%9D%80-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%84%B8%ED%8A%B8.jpg);height: 600px;background-size:cover;background-position:center;}
/* 배너 */

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
            	$.each(item,function(a,b){
            		//alert(b.content);
            		s+="<li class='safe-cell'>";
            		s+="<a href='detail'>";
            		s+="<div class='safe-img-box'>";
            		s+="<img src='https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg' alt=''>";
            		
            		s+="<div class='safe-title'>"+b.countryName+"</div>";
            		s+="<div class='safe-content'>"+b.title+"</div>";
            		s+="<div class='safe-writer'>"+b.wrtDt+"</div>";
            		s+="</div>";
            		s+="</a>";
            		s+="</li>";
            	});
            	$("#safe").html(s);
			});
         }
     });
}
    
</script>

<body>
<div class="sub_visual bg-menu">
    <div class="txt">
        <!-- <h1>커뮤니티</h1>
        <p>의견을 공유하세요</p> -->
    </div>
    <div class="img-cover"></div>
</div>
	
	<div class="safe-list-bar safe-con">
		<div class="safe-list-box">
		  <ul class="safe-row">
			  <div id="safe"></div>
		  </ul>
		</div>
	</div>
	
</body>
</html>