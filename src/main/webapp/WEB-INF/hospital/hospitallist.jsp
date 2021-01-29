<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script>
 /* $(document).ready(function() {
	 $.ajax({
            method: "GET",
            url: "/hospital/list",
            dataType: "xml",
			success: function(data2) {
				var hname = data.getElementsByTagName("yadmNm")[0].firstChild.data;
			    document.getElementById("hname").innerHTML = hname;
			    var sido = data.getElementsByTagName("sidoNm")[0].firstChild.data;
			    document.getElementById("sido").innerHTML = sido;
			    var sggu = data.getElementsByTagName("sgguNm")[0].firstChild.data;
			    document.getElementById("sggu").innerHTML = sggu;
			    var hopty = data.getElementsByTagName("hospTyTpCd")[0].firstChild.data;
			    document.getElementById("hopty").innerHTML = hopty;
			    var tel = data.getElementsByTagName("telno")[0].firstChild.data;
			    document.getElementById("tel").innerHTML = tel;
			    var adday = data.getElementsByTagName("adtFrDd")[0].firstChild.data;
			    document.getElementById("adday").innerHTML = adday;
			    var spty = data.getElementsByTagName("spclAdmTyCd")[0].firstChild.data;
			    document.getElementById("spty").innerHTML = spty;
			    
			     var items = "";
			    var item = data.getElementsByTagName("item");
			    document.getElementById("items").innerHTML = item;
			    /*for (i = 0; i < item.length; i++) { 
			        if (i != 0) { items += ", "; }
			        items += item[i].firstChild.data;*/
			    /*}
			    document.getElementById("items2").innerHTML = items; 
			}
		});
	 
	  
	 $("#hlist_searchbtn").click(function(){
		 var fname2=$("#hlist_searchtext").val();
		 console.log(fname2); */
	      
	      
	        /* $.ajax({
	           url:'/hospital/list',
	           type:'get',
	           dataType:'xml', // 리턴해주는 타입을 지정해줘야함
	           data : {"fname" : fname},
	           beforeSend:function(jqXHR) {
	               console.log("ajax호출전");
	           },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
	           success: function(data) {
	              alert(fname);
	              //console.log(data);
	             
	              
	           }// 요청 실패. 
	       });  
	      
	/*   });
	 
	 
 });
    */    
</script> 

</head>
<body>
	<div class="hospital__list">
		<div class="hospital__list_title">국민안심병원</div>
		<!--탭 박스-->
		<div class="hospital__list_tabbox">
			<div id="hospital__list_tablist">
				<a class="hospital__list_listitem active1" name="A0">국민안심병원</a> <a
					class="hospital__list_listitem" name="97" >호흡기전담클리닉</a> <a
					class="hospital__list_listitem" name="99">선별진료소</a> <a
					class="hospital__list_listitem" name="98">승차검진 선별진료소</a>
			</div>
		</div>
		<!--검색창-->
		<div id="hospital__list_inputform" class="hospital__list_inputform">
			<div class="hospital__list_searchcont">
				<form class="hospital__list_search_area">
					<input type="hidden" name="page" value="1"> 
					<input class="hospital__list_search_text" id="hlist_searchtext"type="text" name="fname" placeholder="검색어를 입력하세요"> 
					<input type="submit" id="hlist_searchbtn" class="hospital__list_search_btn" value="검색" />
					<button type="button" id="hlist_viewlistbtn" class="hospital__list_search_btn">전체
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
			
			<div id="hospital__list_cards">
				<div class="hospital__list_card"></div>
				<div class="hospital__list_card"></div>
				
				<div class="hospital__list_card"></div>
				
				<div class="hospital__list_card"></div>
				
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
		<div id="med_searchlist"></div>
		<p id="hlistdata"></p>
		
		
		<h1>문자열 파싱</h1> <button onclick="parseText()">파싱하기!</button> <p id="text"></p>



		<h3>병원리스트 test</h3>
<h2 id="hname"></h2>
<div id="sido"></div>
<div id="sggu"></div>
<div id="hopty"></div>
<div id="tel"></div>
<div id="adday"></div>
<div id="spty"></div>
        <p>item 구성: <span id="items"></span></p>
        <p>item2 구성: <span id="items"></span></p>
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
                        var hcate =$(this).attr('name');
                        $.ajax({
             	           url:'/hospital/list',
             	           type:'get',
             	           dataType:'xml', // 리턴해주는 타입을 지정해줘야함
             	           data : {"hcate" : hcate},
             	           beforeSend:function(jqXHR) {
             	               console.log("ajax호출전");
             	           },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
             	           success: function(data) {
             	        	   alert(hcate);
             	             
             	             		
             	              
             	              
             	            var item = data.getElementsByTagName("item");
             	             for (var i=0; i< item.length; i++) {
             	           	     var s= "<div>"+ item[i] + "</div>";
             	           	     document.getElementById("med_searchlist").innerHTML = s; 
             	            }
             	            	var hname = data.getElementsByTagName("yadmNm");
             	            	var sido = data.getElementsByTagName("sidoNm");
             	            	var sggu = data.getElementsByTagName("sgguNm");
             	            /* 	var addr = sido+sggu;
             	            	//var addr = sido.concat(sggu);
             	            	
             	            	*/
             	            	
             	            	var cards = document.getElementById("hospital__list_cards");
             	            	 
             	            	//for문대신 forEach문을 이용해서 더 간단히 만들수 있다. 그러나 지금이클립스에서 안됨
             	            	//hname.forEach(name => {
             	            	//	console.log(name);             	            	
             	            	//});
             	            	var a="";
             	            	var card = cards.getElementsByClassName("hospital__list_card");
             	            	for (var i=0; i< hname.length; i++) {
             	            		console.log(hname[i].value);
             	            		/* var cardval = card[i].value;
             	            		console.log(cardval);
             	            		for (var i=0; i< hname.length; i++) {
             	            			cardval.innerHTML = hname[0];
             	            		}
             	            		
             	            		document.getElementById("hospital__list_cards").innerHTML=hname[1];
             	            		 */
             	            		var h = document.createElement("h1");
             	            		var p = document.createElement("p");

             	            		  //card.appendChild(h);
             	            		  h.appendChild(p);
             	            		

	
             	               
             	            	} 
             	             
             	             var hname = data.getElementsByTagName("yadmNm")[0].firstChild.data;
             			    document.getElementById("hname").innerHTML = hname;
             			    var sido = data.getElementsByTagName("sidoNm")[0].firstChild.data;
             			    document.getElementById("sido").innerHTML = sido;
             			    var sggu = data.getElementsByTagName("sgguNm")[0].firstChild.data;
             			    document.getElementById("sggu").innerHTML = sggu;
             			    var hopty = data.getElementsByTagName("hospTyTpCd")[0].firstChild.data;
             			    document.getElementById("hopty").innerHTML = hopty;
             			    var tel = data.getElementsByTagName("telno")[0].firstChild.data;
             			    document.getElementById("tel").innerHTML = tel;
             			    var adday = data.getElementsByTagName("adtFrDd")[0].firstChild.data;
             			    document.getElementById("adday").innerHTML = adday;
             			    var spty = data.getElementsByTagName("spclAdmTyCd")[0].firstChild.data;
             			    document.getElementById("spty").innerHTML = spty;
             	              
             	           }
                        })
                    });
                    
                }
                
                
                /* function parseText() { 
                	var xmlText, xmlParser, xmlDoc; 
                	xmlText = "<country><yadmNm>korea</yadmNm>" + 
                	"<sidoNm>seoul</sidoNm></country>" 
                	xmlParser = new DOMParser(); 
                	xmlDoc = xmlParser.parseFromString(xmlText, "text/xml"); 
                	document.getElementById("text").innerHTML = 
                		xmlDoc.getElementsByTagName("yadmNm")[0].childNodes[0].nodeValue + "의 수도는 " + xmlDoc.getElementsByTagName("sidoNm")[0].childNodes[0].nodeValue + " 입니다."; }

 */
                

           </script>
</body>