<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, maximum-scale=1.0, minimum-scale=1, 
user-scalable=yes,initial-scale=1.0, target-densitydpi=medium-dpi" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<style>


/*노말라이즈*/
body,ul,li {
  margin: 0;
  padding: 0;
  list-style: none;
}
a {
  color: inherit;
  text-decoration: none;
}
/*라이브러리*/
html,body {
  overflow-x : hidden;
}
.con {
  margin: 0 auto;
}
.dcom-row::after {
  content:"";
  display: block;
  clear: both;
}
.dcom-cell {
  float: left;
}
.dcom-img-box img {
  display: block;
  width: 100%;
}

/*커스텀*/
.dcom-con {
  max-width: 100%;
}

/*사이드 메뉴 바*/
.dcom-side-menu-button {
 
}
@media (max-width: 800px) {
  .dcom-side-menu-button {
    display: block;
  }
}
/*사이드 메뉴 버튼*/
.dcom-side-menu-button {
  position: absolute;
  top: 20px;
  left: 20px;
  cursor: pointer;
}
.dcom-side-menu-button .dcom-img-box {
  width: 50px;
}
/*사이드 메뉴 박스*/
.dcom-side-menu-button:hover .dcom-side-menu-bar {
  left: 0;
}
.dcom-side-menu-bar {
  position: fixed;
  top: 0;
  left: -300px;
  height: 100%;
  width: 300px;
  background-color: #dfdfdf;
  box-sizing: border-box;
  z-index:3;
  transition: left 1s;
}
.dcom-side-menu-bar .dcom-side-menu-box ul > li {
  position: relative;
  background-color: #dfdfdf;
}
.dcom-side-menu-bar .dcom-side-menu-box > ul {
  margin-top: 40px;
}
.dcom-side-menu-bar .dcom-side-menu-box ul > li > a {
  display: block;
  padding: 20px;
  font-weight: bold;
  white-space: nowrap;
}
.dcom-side-menu-bar .dcom-side-menu-box > ul > li > a {
  padding-left: 40px;
}
.dcom-side-menu-bar .dcom-side-menu-box ul > li:hover > a {
  color: white;
  background-color: black;
}
.dcom-side-menu-bar .dcom-side-menu-box ul ul {
  display: none;
  position: absolute;
  top: 0;
  left: 100%;
}
.dcom-side-menu-bar .dcom-side-menu-box ul > li:hover > ul {
  display: block;
}


/*상단 배너 박스*/
.dcom-top-bn-box {
  margin-top: 20px;
}
@media (max-width:800px) {
  .dcom-top-bn-box .img-box {
    margin-left: -50%;
  }
}

/*상품 리스트 바*/

/*상품 리스트 사이즈*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li {
  width:calc(100%/ 5);
  box-sizing: border-box;
  padding: 0 10px;
  margin-top: 10px;
}
.dcom-prod-list-bar .dcom-prod-list-box > ul {
  margin: 0 -10px;
}
/*상품 리스트 반응형 사이즈*/
@media (max-width:1000px) {
  .dcom-prod-list-bar .dcom-prod-list-box > ul > li {
    width: calc(100%/4);
  }
}
@media (max-width:800px) {
  .dcom-prod-list-bar .dcom-prod-list-box > ul > li {
    width: calc(100%/3);
  }
}
@media (max-width:600px) {
  .dcom-prod-list-bar .dcom-prod-list-box > ul > li {
    width: calc(100%/2);
  }
}
@media (max-width:400px) {
  .dcom-prod-list-bar .dcom-prod-list-box > ul > li {
    width: calc(100%/1);
  }
}
/*상품 이름,가격*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-prod-name,.dcom-prod-price {
  font-weight: bold;
  text-align: center;
}
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-prod-price {
  font-size: 1.5rem;
}

/*상품 리스트 강조*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-img-box {
  overflow: hidden;
  position: relative;
}
/*상품 리스트 강조-배경*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-img-box::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: black;
  opacity: 0;
  transition: opacity 0.5s;
  z-index: 1;
}
.dcom-prod-list-bar .dcom-prod-list-box > ul > li:hover > a > .dcom-img-box::before {
  opacity: 0.5;
}
/*상품 리스트 강조-view*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-img-box::after {
  content:"VIEW";
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
  border: 3px solid white;
  padding: 5px;
  border-radius: 5px;
  opacity: 0;
  transition: opacity 0.5s;
  z-index: 2;
}
.dcom-prod-list-bar .dcom-prod-list-box > ul > li:hover > a > .dcom-img-box::after {
  opacity: 1;
}
/*상품 리스트 강조-확대*/
.dcom-prod-list-bar .dcom-prod-list-box > ul > li > a > .dcom-img-box img {
  transition: transform 0.5s;
}
.dcom-prod-list-bar .dcom-prod-list-box > ul > li:hover > a > .dcom-img-box img {
  transform: scale(1.3);
}
</style>
<script type="text/javascript">
	
</script>
<body>
<div style="height: 70px;">
	
</div>

<div class="dcom-side-menu-button">
  <div class="dcom-img-box">
    <i class="fa fa-bars"></i>
  </div>
  <div class="dcom-side-menu-bar">
    <nav class="dcom-side-menu-box">
      <ul>
        <li>
          <a href="#">코로나</a>
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
        <li>
          <a href="#">코로나</a>
          
        </li>
      </ul>
    </nav>
  </div>
</div>

<div class="dcom-top-bn-box con">
  <div class="dcom-img-box">
    <img style="height: 400px;" src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt="">
  </div>
</div>
<button type="button" style="width: 100px;" onclick="location.href='dcomwriteform'">글작성</button>
<div class="dcom-prod-list-bar con">
  <div class="dcom-prod-list-box">
    <ul class="dcom-row">
      <li class="dcom-cell">
        <a href="#">
          <div class="dcom-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
          <div class="dcom-prod-name">코로나</div>
          <div class="dcom-prod-price">코로나</div>
        </a>
      </li>
      <li class="dcom-cell">
        <a href="#">
          <div class="dcom-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
          <div class="dcom-prod-name">코로나</div>
          <div class="dcom-prod-price">코로나</div>
        </a>
      </li>
      <li class="dcom-cell">
        <a href="#">
          <div class="dcom-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
          <div class="dcom-prod-name">코로나</div>
          <div class="dcom-prod-price">코로나</div>
        </a>
      </li>
      <li class="dcom-cell">
        <a href="#">
          <div class="dcom-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
          <div class="dcom-prod-name">코로나</div>
          <div class="dcom-prod-price">코로나</div>
        </a>
      </li>
      <li class="dcom-cell">
        <a href="#">
          <div class="dcom-img-box"><img src="https://pds.joins.com//news/component/htmlphoto_mmdata/201803/15/358b703f-2d05-4ebc-8911-9e91e56048e0.jpg" alt=""></div>
          <div class="dcom-prod-name">코로나</div>
          <div class="dcom-prod-price">코로나</div>
        </a>
      </li>
    </ul>
  </div>
</div>
</body>
</html>