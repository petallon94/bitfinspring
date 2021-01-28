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
	        dataType:'xml', // �������ִ� Ÿ���� �����������
	        data : {"keyword" : keyword},
	        beforeSend:function(jqXHR) {
	            console.log("ajaxȣ����");
	        },// ���� ��û �� ȣ�� �Ǵ� �Լ� return false; �� ��� ��û �ߴ�
	        success: function(data) {
	        	//alert(keyword);
	        	console.log(data);
	        	var a =  data.getElementsByTagName("itemName");
	        	var s =  data.getElementsByTagName("efcyQesitm");
				var b = data.getElementsByTagName("itemImage");
	        	
	        	$("#med_searchlist").html(b);
	        	
	        }// ��û ����.
	    }); 
		
	});
	

	
});
</script>

</head>
<body>
<div class="med_layout">
		<div class ="med_layout_title">
		<h3>�޵�� ���̾ƿ��Դϴ�. </h3>
		<div class="med_search">
			<h3>�˻� ���� ȭ�� ���̾ƿ��Դϴ�. </h3>
			<input class="med_text1" id="med_text1" type="text" />
			<button type="button" class="med_searchbtn" id = "med_searchbtn">
				�˻��ϱ�</button>
			<div class="med_test" id="med_div"></div>
			<div class="med_test2" id="med_div2"></div>
		</div>
		</div>
		<div class="med_searchlist" id ="med_searchlist">
			����Ʈ
		<div class ="med_searchleft" name = "med_searchleft">
		<img class ="med_searchpic" src ="${root}/image/no_image.png">
		</div>
		<div class ="med_searchright" name = "med_searchright">
		<h3>���̸�</h3>
		<a></a>
		<p>�� ���� ����</p>
		<P>���� ����</P>
		<p>intrcQesitm(��ȣ�ۿ�)</p>
		<p>seQesitm(���ۿ�)</p>
		</div>
		

		</div>

	</div>


</body>
</html>