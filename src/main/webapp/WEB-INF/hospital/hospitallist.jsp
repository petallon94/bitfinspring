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
 <script type="text/javascript">
 // 탭으로 만들어서 구동하기
/*  function list(tab){ 
	 var formData = new FormData(); //formData 객체 생성
	 formData.append("tab", tab); 
	 $.ajax({ 
		 url : "/hospital/list", 
		 type : "post", 
		 dataType : "text", 
		 data : formData, 
		 contentType: false, 
		 processData: false, 
		 cache : false
		 }).done(function(result) {
			 console.log("결과확인"); 
			 var html = jQuery('<div>').html(result); 
			 var contents = html.find("div#indexListAjax").html(); 
			 if(tab == "ing"){ $("#tabl1").html(contents); 
			 }else if(tab == "end"){ 
				 $("#tabl2").html(contents); 
				 } 
			 }).fail(function (jqXHR, textStatus, errorThrown) { 
				 console.log("에러"); 
				 console.log(jqXHR); 
				 console.log(textStatus); 
				 console.log(errorThrown); 
				 }); 
	 }
 */
 
 /* 
 
 var nPageListCnt = "";

//페이지의 너비가 변경될 경우 페이징 번호를 변경한다.
$(document).ready(function(){
	$(window).resize(function(){
		
		var x = $(window).width();		// 현재 화면의 너비 값

		// 너비 값이 특정 값 이상 줄어들면 페이징을 변경한다.
		if(x < 1000){
			 // 페이지 리스트 카운트 개수는 5개로 변경한다.
			nPageListCnt = 5
		}else{
			 // 페이지 리스트 카운트 개수는 10개로 변경한다.
			nPageListCnt = 10
		}
		
		searchPagingList();		// 호출
		
	}).resize();
});

function goTabLink(tabNo){
	if(tabNo == "1") tabNo = "";
	else tabNo = "_"+tabNo;
	
	parent.location.href = "https://www.mohw.go.kr/react/popup_200128"+tabNo+".html";
}

//창 너비가 변경될 경우 호출하여 페이징 번호를 새로 뿌려준다.
function searchPagingList(){

	// 페이지 정보
	var nTotalCnt = "261";
	var nRowCount = "9";
	var totalCntDivide = "";
	var nPage = "2";
	var strListLink = "selclinic01ls.jsp?tabno=1";
	var strAnker = "";
	
	if(nTotalCnt > 0){
		var pageHtml = "";
	
		if((nTotalCnt % nRowCount) == 0 ){
			totalCntDivide = 0;
		}else{
			totalCntDivide = 1;
		}
	
		var nTotalPageCnt = Math.floor((nTotalCnt / nRowCount) + totalCntDivide);		// 총 페이지 건수, 소수점 아래 버린다.
		var nPagePerCnt = Math.floor(( nPage - 1) / nPageListCnt);							// 소수점 아래 버린다.
		var nStartPageNum = (nPageListCnt * nPagePerCnt) + 1;
		var nEndPageNum = nPageListCnt * ( nPagePerCnt + 1);
	
		if(nTotalPageCnt > 0){
			if(nPage == 1){
				pageHtml = "<span class=\"first\"><strong>첫페이지(최신)</strong></span>";
			}else{
				pageHtml = "<span class=\"first\"><a href=\""+strListLink+"&amp;page=1"+ strAnker +"\" title=\"첫페이지(최신)\">첫페이지(최신)</a></span>";
			}
		}
		
		if( nPage > nPageListCnt) {
			var nStartNum = nStartPageNum - 1;
			pageHtml += "<span class=\"prev\"><a href=\""+ strListLink +"&amp;page="+ nStartNum +""+ strAnker +"\" title=\"이전(최신) "+nPageListCnt+"개 페이지 이동\">이전(최신) "+nPageListCnt+"개 페이지</a>";
		}else{
			pageHtml += "<span class=\"prev\"><strong>이전(최신) "+nPageListCnt+"개 페이지</strong>";
		}
		pageHtml += "</span>";
	
		var nPageCount = 0;
		var nPageNum = 0;
		
		pageHtml += "<ul>";
		
		while( nPageCount < nPageListCnt && ( nStartPageNum + nPageCount) <= nTotalPageCnt){
			nPageNum = nPageCount + nStartPageNum;
			nPageCount++;
			if( nPage == nPageNum) {
				pageHtml += "<li><span class=\"hdn\">현재페이지</span><strong>" + nPageNum + "</strong></li>";
			}else {
				pageHtml += "<li><a href=\""+ strListLink +"&amp;page="+ nPageNum + "" + strAnker + "\" title="+nPageNum+" 페이지로 이동>"+ nPageNum +"</a></li>";
			}
		}
		pageHtml += "</ul>";
		
		if( nTotalPageCnt > nEndPageNum) {
			var nEndNum = nEndPageNum + 1;
			pageHtml += "<span class=\"next\"><a href=\""+strListLink+"&amp;page="+ nEndNum + "" + strAnker +"\" title=\"다음(예전) "+nPageListCnt+"개 페이지 이동\">다음(예전) "+nPageListCnt+"개 페이지</a></span>";
		} else {
			pageHtml += "<span class=\"next\"><strong>다음(예전) "+nPageListCnt+"개 페이지</strong></span>";
		}

		if(nTotalPageCnt > 0){
			if(nTotalPageCnt == nPage){
				pageHtml += "<span class=\"last\"><strong>마지막페이지(예전)</strong>";
			} else {
				pageHtml += "<span class=\"last\"><a href=\""+ strListLink + "&amp;page="+ nTotalPageCnt +""+ strAnker +"\" title=\"마지막페이지(예전) 이동\">마지막페이지(예전)</a>";
			}
		}
		pageHtml += "</span>";
		
		document.getElementById("pageNumHtml").innerHTML = pageHtml;
	}
}
 */
	 /* 
	  
	 $("#hlist_searchbtn").click(function(){
		 var fname2=$("#hlist_searchtext").val();
		 console.log(fname2); 
	      
	      
	        $.ajax({
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
		<div id="hospital__list_title">국민안심병원</div>
		<!--탭 박스-->
		<div class="hospital__list_tabbox">
			<div id="hospital__list_tablist">
				<a class="hospital__list_listitem active1" name="A0" id="hlist1">국민안심병원</a> 
				<a class="hospital__list_listitem" name="97" id="hlist2">호흡기전담클리닉</a> 
					<a class="hospital__list_listitem" name="99" id="hlist3">선별진료소</a> 
					<a class="hospital__list_listitem" name="98" id="hlist4">승차검진 선별진료소</a>
			</div>
		</div>
		<!--검색창-->
		<div id="hospital__list_inputform" class="hospital__list_inputform">
			<div class="hospital__list_searchcont">
				<form class="hospital__list_search_area">
					<input type="hidden" name="page" value="1" id="hlist_page"> 
					<input class="hospital__list_search_text" id="hlist_searchtext" type="text" name="fname" placeholder="검색어를 입력하세요"> 
					<input type="button" id="hlist_searchbtn" class="hospital__list_search_btn
					" value="검색" />
					<button type="button" id="hlist_viewlistbtn" class="hospital__list_viewlist_btn">전체목록</button>
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
		<div id="hospital__list_container">

			<!-- Grid div -->
			
			
				<%-- <div class="hospital__list_card">
					<h3 class="hospital__list_hname" id="hname">${h.hname}></h3>
					<p class="hospital__list_addr" id="addr">${h.addr}></p>
				</div> --%>
			
			
		
	
		<!-- 페이징처리할것 -->
		<div style="width: 800px; text-align: center;" class="paging"  id="pageNumHtml"></div>
		</div>
		<button id="btn">button</button>
		<input id="search_enter" type="text" placeholder="검색어를 입력하세요"/>
		<div id ="ho">호</div>
	</div>
	<script>
	var hcates =['', 'A0','97','99'];
	
	var fname =new URL(location.href).searchParams.get('fname');
	var page =new URL(location.href).searchParams.get('page');
	console.log(fname);
	console.log(page);
	
	/* ajax로 xml에서 item객체목록가져오기 */
	function getData(hcate) { 
		
	 	$.ajax({
          url:'/hospital/list',
          type:'get',
          dataType:'xml',
          data : {"hcate" : hcate},
          beforeSend:function(jqXHR) {
              console.log("ajax호출전");
          },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
          success: function(data) {
        	   //alert(hcate);        	             
              	var container = document.getElementById("hospital__list_container");
					 container.style.display="grid";
            	//요소이름 뽑아내기
            	var item = data.getElementsByTagName("item");
            	var yadmNm = data.getElementsByTagName("yadmNm");
            	var sidoNm = data.getElementsByTagName("sidoNm");
            	var sgguNm = data.getElementsByTagName("sgguNm");
            	var telno = data.getElementsByTagName("telno");

            	//doc내의 class다 가져오기
           		//var cards = document.getElementById('hospital__list_cards');
       			//var card = document.querySelectorAll('.hospital__list_card'); 
       			//var h3 = document.getElementsByTagName('h3');
  		     			       			
       			var h = "<div id='hospital__list_cards'>";
    			for (var i=0; i< item.length; i++) {
       			       			
       			var hname= yadmNm[i].textContent;
       			var sido = sidoNm[i].textContent;
				var sggu = sgguNm[i].textContent;
				var tel =telno[i].textContent;
				var addr = sido + sggu;
				//console.log(addr);
					h += "<div class='hospital__list_card' onclick='location.href='hospitaldetail'>";
    				h += "<h3 class='hospital__list_hname' id='hname'>"+hname+"</h3><br><br>";
					h += "<p class='hospital__list_addr' id='haddr'>"+addr+"</p>";
					h += "<input type='hidden' class='hospital__list_tel' id='htel'>"+tel+"</p>";
					h += "</div>";
       		  	}
    				h += "</div>";
       			$("#hospital__list_container").html(h);
        			
           }
       });
	}

	/* 전체목록보기 누르면 전체 데이터 불러오기 */
	//js방식
	const listbtn = document.getElementById("hlist_viewlistbtn");
	listbtn.addEventListener("click", function() {
		getData(hcates[0]);
	});
	//jquery방식 (동일하게작동)
	//$("#hlist_viewlistbtn").click(function(){
	//	getData(hcates[0]);
	//});       
       
	/* 탭버튼 누르면 해당되는 목록 불러오기 */
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
    	getData(hcate);
    	})
    }
    
    /////////////////////////////////////////////////완료/////////////////////
    const card = document.getElementsByClassName("hospital__list_card");
    //console.log(card);
    
    /*  $(".hospital__list_card").on("click", function() {
    	 var a = $(this).val();
    	 console.log(this);
    	var hname = $(this).children("h3").val();
    	var hname2 = document.getElementById("hname");
    	var hname3 = $(this).childNodes[0].textContent;
 	    var haddr = document.getElementById("haddr");
 	    var htel = document.getElementById("htel");
 	   	console.log($(this));
 	    console.log(hname);
 	    console.log(hname2);
 	    console.log(hname3);
		//location.href = "./hospitaldetail?hname="+hname+"&haddr="+haddr+"&htel="+htel+"&pageNum=${currentPage}";

    	
    });
     
     for (var i = 0; i < card.length; i++) {
     var hh= card[i].childNodes[0].textContent;
     console.log(hh); */
    /* for (var i = 0; i < card.length; i++) {
	card[i].addEventListener("click", function() {
		 console.log(card[i]);
	    var hname4 = document.getElementById("hname");
	    var haddr4 = document.getElementById("haddr");
	    var htel4 = document.getElementById("htel");
	   
	    console.log(hname);
	    console.log(haddr);
	    console.log(htel);
	});*/
		//location.href = "./hospitaldetail?hname="+hname+"&haddr="+haddr+"&htel="+htel+"&pageNum=${currentPage}";
	//}; 
    
    const hospitalId = new URL(location.href).searchParams.get('hname');
    //console.log(hospitalId);
    
  /*   function getHospitalname(hospitalId) {
    	try{
    		const res = 
    	}catch(error){
    		console.log('getHospitalNane errer', error);
    		return null;
    	}    	
    } 
    
   
    const hname = getHospitalname(hospitalId);
    if (hname === null) {
    	alert ('서버에서 병원아이디 가져오기 실패');
    	return;
    }
    */
    
    
    
   
    	const detailElement = document.querySelectorAll("#ho"); 
    	
    	//detailElement.innerHTML += ""<div class="hospital__list_card">
		//	<h3 class="hospital__list_hname">하하하하ㅏㅎ</h3>
		//	<p class="hospital__list_addr">호호호호</p>
		//	<input type="text" name="${hospital.tel}"/>인풋</div>`;
    	//console.log(detailElement);	
    
    const btn = document.getElementById("btn");
    //console.log(btn);

    /* 검색하기  */
/*     const searchbtn = document.getElementById("hlist_searchbtn");
    const searchtext = document.getElementById("hlist_searchtext");
    
    
    btn.addEventListener("click", function() {
    	findData();

    });

    	function findData() {
    		var hcate='';
        	$.ajax({
                url:'/hospital/list',
                type:'get',
                dataType:'xml',
                data : {"hcate" : hcate},
                success: function(data) {
        		
                //console.log(data);
                var item = data.getElementsByTagName("item");
                var yadmNm = data.getElementsByTagName("yadmNm");
                
                $(data).find("item").each(function(){

                	var info = "병원명 : " + $(this).find("yadmNm").text() +"<br/>";
                	info += "병원주소: " + $(this).find("telno").text() +"<br/>";
                	

                	$('#ho').append(info);

                	});

                	}             	
                
                
        		});

    	}
    	
    	 $("#search_enter").on("keyup", function() {
    		    var value = $(this).val();
    		    var hcate='';
            	$.ajax({
                    url:'/hospital/list',
                    type:'get',
                    dataType:'xml',
                    data : {"hcate" : hcate},
                    success: function(data) {
                    	var yadmNm = data.getElementsByTagName("yadmNm");
                    	var item = data.getElementsByTagName("item");
                        
                    	for(i=0;i<item.length;i++){
                            //name = yadmNm[i].textContent;
                            //console.log(name);
                            item[i].filter(function() {
                                $('#ho').toggle($(this).text().toLowerCase().indexOf(value) > -1)
                              });
                    	}
                    }
    		    });
    		  });
    	  */
    	

    	
/*     	var yadmNmlist = data.getElementsByTagName("yadmNm");
    	 for (int i = 0; i < yadmNmlist.Count; i++)
         {
             if (yadmNmlist[i].InnerXml.Equals(fname))
             {
                 //get your value
                 var value= valueList[i].InnerXml;
             }
         }
    	var nameList = doc.GetElementsByTagName("param-name");
    }
		console.log(pageval);
    console.log(keywordtext);
    console.log(keywordval);
    //getData(hcates[0]);
	});
     */
    
           </script>
</body>