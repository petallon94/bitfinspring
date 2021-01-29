<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, minimum-scale=1, 
user-scalable=yes,initial-scale=1.0, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="${root }/js/safelist.js"></script>
<title>Insert title here</title>
</head>
<style>
body, ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	color: inherit;
	text-decoration: none;
}

html, body {
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

.safe-title{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.safe-img-box img {
	display: block;
	width: 100%;
}

.safe-con {
	max-width: 100%
}

.safe-list-bar .safe-list-box ul li {
	width: calc(100%/ 3);
	box-sizing: border-box;
	padding: 0 10px;
	margin-top: 10px;
}

.safe-list-bar .safe-list-box ul {
	margin: 0 -10px;
}

@media ( max-width : 1024px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/ 2);
	}
}

@media ( max-width : 800px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/ 2);
	}
}

@media ( max-width : 640px) {
	.safe-list-bar .safe-list-box ul li {
		width: calc(100%/ 1);
	}
}

/* 배너 */
/* .img-cover{position: absolute;height: 100%;width: 100%;background-color: rgba(0, 0, 0, 0.5);z-index:1;} */
.sub_visual .txt {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	z-index: 2;
	text-align: center;
}

.sub_visual .txt h1:after {
	display: block;
	width: 40px;
	height: 3px;
	margin: 32px auto;
	background: white;
	content: '';
}

.sub_visual .txt p {
	font-size: 14pt;
	font-weight: 300;
}

.sub_visual {
	position: relative;
	background-image:
		url(https://previews.123rf.com/images/sapannpix/sapannpix1604/sapannpix160400008/54710924-%EC%9D%98%EC%82%AC%EC%99%80-%EA%B0%84%ED%98%B8%EC%82%AC-%EB%B0%8F-%EC%9D%98%EB%A3%8C-%EC%A7%81%EC%9B%90%EC%9D%80-%ED%8F%89%EB%A9%B4-%EB%94%94%EC%9E%90%EC%9D%B8-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%84%B8%ED%8A%B8.jpg);
	height: 600px;
	background-size: cover;
	background-position: center;
}
/* 배너 */
.safe-btn-bar {
	display: inline-block;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

/* Icons */
.safe-btn {
	color: #fff;
	background: #DB6E82;
	border-radius: 4px;
	text-align: center;
	text-decoration: none;
	font-family: fontawesome;
	position: relative;
	display: inline-block;
	width: 100px;
	height: 40px;
	padding-top: 12px;
	margin: 0 2px;
	-o-transition: all .5s;
	-webkit-transition: all .5s;
	-moz-transition: all .5s;
	transition: all .5s;
	-webkit-font-smoothing: antialiased;
}

.safe-btn:hover {
	background: #ef92a3;
}

/* pop-up text */
.safe-btn span {
	color: #666;
	position: absolute;
	font-family: sans-serif;
	bottom: 0;
	left: -25px;
	right: -25px;
	padding: 5px 7px;
	z-index: -1;
	font-size: 14px;
	border-radius: 2px;
	background: #fff;
	visibility: hidden;
	opacity: 0;
	-o-transition: all .5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
	-webkit-transition: all .5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
	-moz-transition: all .5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
	transition: all .5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
}

/* pop-up text arrow */
.safe-btn span:before {
	content: '';
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-top: 5px solid #fff;
	position: absolute;
	bottom: -5px;
	left: 40px;
}

/* text pops up when icon is in hover state */
.safe-btn:hover span {
	bottom: 50px;
	visibility: visible;
	opacity: 1;
}
.safe-hide, .safe-content{
	opacity: 0;
	display: none;
}
.safe-list-bar .safe-list-box > ul:hover {
	
}


/* font awesome icons */

/* .safe-btn:nth-of-type(1):before {
content:'\f09a';
}
.safe-btn:nth-of-type(2):before {
content:'\f099';
}
.safe-btn:nth-of-type(3):before {
content:'\f0d5';
}
.safe-btn:nth-of-type(4):before {
content:'\f113';
}
.safe-btn:nth-of-type(5):before {
content:'\f17d';
}
.safe-btn:nth-of-type(6):before {
content:'\f1cb';
} */
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
      			//alert(item.content);
            	$.each(item,function(a,b){
            		//alert(b.content);
            		var id = b.id;
            		//alert(id);
            		s+="<li class='safe-cell'>";
            		s+="<div class='safe-img-box'>";
            		s+="<div class='safe-countryName'>"+b.countryName+"</div>";
            		s+="<div class='safe-title'>"+b.title+"</div>";
            		s+="<div class='safe-content'>"+b.content+"</div>";
            		s+="<div class='safe-writer'>"+b.wrtDt+"</div>";
            		s+="</div>";
            		s+="</li>";
            	});
            	$("#safe").html(s);
			});
         }
     });
}

function callApiCorona() {
	 $.ajax({
        url:'/mainsafe/list2',
        type:'get',
        dataType:'json', // 리턴해주는 타입을 지정해줘야함
        success: function(data) {
           //alert(data);
           s="";
           $.each(data,function(index,item){
     			//alert(item.content);
           	$.each(item,function(a,b){
           		//alert(b.content);
           		var id = b.id;
           		//alert(id);
           		s+="<li class='safe-cell'>";
           		s+="<div class='safe-img-box'>";
           		s+="<div class='safe-countryName'>"+b.countryName+"</div>";
           		s+="<div class='safe-title'>"+b.title+"</div>";
           		s+="<div class='safe-content'>"+b.content+"</div>";
           		s+="<div class='safe-writer'>"+b.wrtDt+"</div>";
           		s+="</div>";
           		s+="</li>";
           	});
           	$("#safe").html(s);
		  });
        }
    });
}

function callApiAir() {
	 $.ajax({
       url:'/mainsafe/list3',
       type:'get',
       dataType:'json', // 리턴해주는 타입을 지정해줘야함
       success: function(data) {
          //alert(data);
          s="";
          $.each(data,function(index,item){
    			//alert(item.content);
          	$.each(item,function(a,b){
          		//alert(b.content);
          		var id = b.id;
          		//alert(id);
          		s+="<li class='safe-cell'>";
          		s+="<div class='safe-img-box'>";
          		s+="<div class='safe-countryName'>"+b.countryName+"</div>";
          		s+="<div class='safe-title'>"+b.title+"</div>";
          		s+="<div class='safe-content'>"+b.content+"</div>";
          		s+="<div class='safe-writer'>"+b.wrtDt+"</div>";
          		s+="</div>";
          		s+="</li>";
          	});
          	$("#safe").html(s);
		  });
       }
   });
}

function callApiIsolation() {
	 $.ajax({
      url:'/mainsafe/list4',
      type:'get',
      dataType:'json', // 리턴해주는 타입을 지정해줘야함
      success: function(data) {
         //alert(data);
         s="";
         $.each(data,function(index,item){
   			//alert(item.content);
         	$.each(item,function(a,b){
         		//alert(b.content);
         		var id = b.id;
         		//alert(id);
         		s+="<li class='safe-cell'>";
         		s+="<div class='safe-img-box'>";
         		s+="<div class='safe-countryName'>"+b.countryName+"</div>";
         		s+="<div class='safe-title'>"+b.title+"</div>";
         		s+="<div class='safe-content'>"+b.content+"</div>";
         		s+="<div class='safe-writer'>"+b.wrtDt+"</div>";
         		s+="</div>";
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
	<!--코로나 주소: %EC%BD%94%EB%A1%9C%EB%82%98 -->

	<div class="safe-btn-bar">
		<a class="safe-btn" href="#" onclick="callApiXml()">입국<span>입국</span></a>
		<a class="safe-btn" href="#" onclick="callApiAir()">운항<span>운항</span></a>
		<a class="safe-btn" href="#" onclick="callApiCorona()">코로나<span>코로나</span></a>
		<a class="safe-btn" href="#" onclick="callApiIsolation()">격리<span>격리</span></a>
	</div>

	<div class="safe-list-bar safe-con">
		<div class="safe-list-box">
			<ul class="safe-row">
				<div id="safe"></div>
				<div class="safe-hide" id="safe"></div>
			</ul>
		</div>
	</div>

</body>
</html>