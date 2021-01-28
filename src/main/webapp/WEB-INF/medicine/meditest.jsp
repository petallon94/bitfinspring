<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- css -->
<link rel="stylesheet" href="${root}/css/medicine/mainlayout.css" />

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
$(function(){


	
	
	$("#med_searchbtn").click(function(){
		var keyword =$("#med_text1").val();
		//alert(keyword);
		
		
		 $.ajax({
	        url:'medicinetest',
	        type:'get',
	        dataType:'xml', // 리턴해주는 타입을 지정해줘야함
	        data : {"keyword" : keyword},
	        beforeSend:function(jqXHR) {
	            console.log("ajax호출전");
	        },// 서버 요청 전 호출 되는 함수 return false; 일 경우 요청 중단
	        success: function(data) {
	        	//alert(keyword);
	        	console.log(data);
	        	var a =  data.getElementsByTagName("itemName");
	        	var s =  data.getElementsByTagName("efcyQesitm");
				var b = data.getElementsByTagName("itemImage");
	        	
	        	$("#med_searchlist").html(b);
	        	
	        }// 요청 실패.
	    }); 
		
	});
	

	
});
</script>

</head>
<body>
<div class="med_layout">
		<div class ="med_layout_title">
		<h3>메디신 레이아웃입니다. </h3>
		<div class="med_search">
			<h3>검색 시작 화면 레이아웃입니다. </h3>
			<input class="med_text1" id="med_text1" type="text" />
			<button type="button" class="med_searchbtn" id = "med_searchbtn">
				검색하기</button>
			<div class="med_test" id="med_div"></div>
			<div class="med_test2" id="med_div2"></div>
		</div>
		</div>
		<div class="med_searchlist" id ="med_searchlist">
			리스트
		<div class ="med_searchleft" name = "med_searchleft">
		<img class ="med_searchpic" src ="${root}/image/no_image.png">
		</div>
		<div class ="med_searchright" name = "med_searchright">
		<h3>약이름</h3>
		<a></a>
		<p>약 내용 설명</p>
		<P>주의 사항</P>
		<p>intrcQesitm(상호작용)</p>
		<p>seQesitm(부작용)</p>
		</div>
		

		</div>

	</div>


</body>
</html>