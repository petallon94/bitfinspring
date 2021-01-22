<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="hospital__list">
		<div class="hospital__list_title">국민안심병원</div>


		<!--탭 박스-->
		<div class="hospital__list_tabbox">
			<div id="hospital__list_tablist">
				<a class="hospital__list_listitem active1">국민안심병원</a> <a
					class="hospital__list_listitem">호흡기전담클리닉</a> <a
					class="hospital__list_listitem">선별진료소</a> <a
					class="hospital__list_listitem">승차검진 선별진료소</a>
			</div>
		</div>
		<!--검색창-->
		<div id="hospital__list_inputform" class="hospital__list_inputform">
			<div class="hospital__list_searchcont">
				<form class="hospital__list_search_area">
					<input type="hidden" name="page" value="1"> <input
						class="hospital__list_search_text" type="text" name="fname"
						placeholder="검색어를 입력하세요"> <input type="submit"
						class="hospital__list_search_btn" value="검색" />
					<button type="button" class="hospital__list_viewlist_btn">전체
						목록</button>
				</form>
				<div class="hospital__search_info">
					<p>시도 및 시군구, 기관명, 전화번호를 통합하여 검색합니다.</p>
					<span>검색어 예시 : <span class="line">'서울'</span> 또는 <span
						class="line">'중구'</span>또는 <span class="line">'보건소'</span>또는 <span
						class="line">'051'</span>(전화번호 일부)
					</span>
				</div>
			</div>
		</div>

		<!-- Cards section -->
		<div class="hospital__list_container">

			<!-- Grid div -->
			<div class="hospital__list_cards">
				<div class="hospital__list_card">
					<h3>강남성모병원</h3>
					<p>서울 강남구</p>
				</div>
				<div class="hospital__list_card">
					<h3>신촌 세브란스병원</h3>
					<p>서울 신촌</p>
				</div>
				<div class="hospital__list_card">
					<h3>서울삼성병원</h3>
					<p>서울 어디어디</p>
				</div>
				<div class="hospital__list_card">
					<h3>강남성모병원</h3>
					<p>서울 강남구</p>
				</div>
				<div class="hospital__list_card">
					<h3>신촌 세브란스병원</h3>
					<p>서울 신촌</p>
				</div>
				<div class="hospital__list_card">
					<h3>서울삼성병원</h3>
					<p>서울 어디어디</p>
				</div>
				<div class="hospital__list_card">
					<h3>강남성모병원</h3>
					<p>서울 강남구</p>
				</div>
				<div class="hospital__list_card">
					<h3>신촌 세브란스병원</h3>
					<p>서울 신촌</p>
				</div>
				<div class="hospital__list_card">
					<h3>서울삼성병원</h3>
					<p>서울 어디어디</p>
				</div>
			</div>
		</div>
	
		<!-- 페이징처리할것 -->
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">
				<c:if test="${startPage>1}">
					<li><a href="list?pageNum=${startPage-1}">이전</a></li>
				</c:if>
				<!-- 페이지 번호 -->
				<c:forEach var="pp" begin="${startPage}" end="${endPage}">
					<c:if test="${pp==currentPage}">
						<li class="active"><a href="list?pageNum=${pp}">${pp}</a></li>
					</c:if>
					<c:if test="${pp!=currentPage}">
						<li><a href="list?pageNum=${pp}">${pp}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalPage}">
					<li><a href="list?pageNum=${endPage+1}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<div id="button">button</div>
	</div>
	<script>
                var tablist = document.getElementById("hospital__list_tablist");
                var title = document.getElementById("hospital__list_title");
                var btns = tablist.getElementsByClassName("hospital__list_listitem");
                for (var i = 0; i < btns.length; i++) {
                    btns[i].addEventListener("click", function () {
                        var current = document.getElementsByClassName("active1");                     
                        if (current.length > 0) {
                            current[0].className = current[0].className.replace(" active1", "");                            
                        }
                        this.className += " active1";                    
                    });
                }
                

               /*  var cards= document.querySelector("hospital__list_cards");

                cards.forEach(function(element){
                    console.log(element);
                });
                 */
               
                /* API 목록 Javascript 샘플 코드 */
				var button = document.getElementById('button');
                button.addEventListener('click', getHospitaData);
                
				function getHospitaData() {
                var xhr = new XMLHttpRequest();
                var url = 'http://apis.data.go.kr/B551182/pubReliefHospService'; /*URL*/
                var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'ELPlnUlo0CxXA8FbXT0V%2B0wkutn45xHxgWifiU35dIFwr3r1ngGdPJCbxlz59QRhYMoSmt2nzUIZYiCxjFQXgg%3D%3D'; /*Service Key*/
                queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
                queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
                queryParams += '&' + encodeURIComponent('spclAdmTyCd') + '=' + encodeURIComponent('A0'); /**/
                xhr.open('GET', url + queryParams);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                    	//console.log(this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
                        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
                    }
                };

                xhr.send();
                }
                
                
                
                
                
				/* <!--탭클릭시 타이틀 변경 작동안됨 ㅋㅋ-->
                document.getElementById("hospital__list_title").addEventListener("change", changeTitle);
                function changeTitle() {
                    var x = document.getElementById("hospital__list_title");
                    var tablist = document.getElementById("hospital__list_tablist");
                    var btns = tablist.getElementsByClassName("hospital__list_listitem active1");
                    x.value = btns;
                } */
           </script>
</body>