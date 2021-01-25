<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
<!-- css -->
<link rel="stylesheet" href="${root}/css/board/boardcontent.css" />

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jquery  -->
<script type="text/javascript">
$(function(){
	
	answer_list();
	
	$("#ans_savebtn").click(function(){
		
		
		
		var acnum=$("#acnum").val();
		var amidnum=$("#amidnum").val();
		var awriter=$("#awriter").val();
		var amemo = $("#amemo").val();
		
		//alert(acnum+"/"+amidnum+"//"+awriter+"///"+amemo);
		
		$.ajax({
			type:"post",
			url:"answersave",
			data:{"acnum":acnum,"amidnum":amidnum,"awriter":awriter,"amemo":amemo},
			dataType:"html",
			success:function(data)
			{
				$("#amemo").val("");
				answer_list();
				alert("success!!!!!");
				
			}

		});  

	});
	
});

/* function 끝*/

function answer_list()

	{
		//db로부터 댓글 목록을 가져와서 id "answer" 출력하기
		var acnum=$("#acnum").val();

		$.ajax({
			type:"get",
			url:"answerlist",
			dataType:"json",
			data:{"acnum":acnum},
			success:function(data){				
				var s="<div class = 'each_comments'>";
				$.each(data,function(i,n){

					s+= "<div style ='padding-top : 10px;'><a>"+n.awriter+"</a><span >"+n.awritedate+"</span><a class='update' idx="+n.aidx+">수정</a><a class='del' idx="+n.aidx+">삭제</a></div>";
					s+= "<div class ='board_memo' style ='padding-bottom : 10px;border-bottom : 1px solid gray'>"+n.amemo+"</div>";
				});

				s+="</div>";
				$("#board_comments").html(s);
			}

		});

	}


</script>
</head>
<body>
	<div class="board_contentlayout">

		<div class="board_contentsmain">
			<h3 onclick = "location.href='../board/'" >의료정보 커뮤니티</h3>
		</div>
	</div>
	
	<div class="board_contentsc">			
		<div class="board_contentsform">						
			<h3> ${dto.bsubject}</h3>
			<h4> ${dto.bwriter}</h4>
			<h4> 조회수 : ${dto.breadcount}</h4>
			 
			 <c:forEach var="a" items="${hdto}">
						<div class="hashtag">
							<span class="glyphicon glyphicon-ok"></span> ${a.hashtag}
						</div>
			</c:forEach>
			 
		</div>
		<hr>
			<div class ="board_concon">
			<p>${dto.bcontent}</p>
			</div>				
	</div>	
			<div class ="board_conbtngrp">
			<hr>
			<button type="button" class="board_clistbtn" onclick = "location.href='../board/list'">목록</button>
			<button type ="button" class ="board_cupdbutton" onclick="location.href='updatepassform?num=${dto.bnum}&pageNum=${pageNum}'" >수정</button>			
			<button type ="button" class ="board_cdelbutton" onclick="location.href='deletepassform?num=${dto.bnum}'">삭제</button>
			<button type ="button" class ="board_cdelbutton" >스크랩</button>
			
			</div>
			<div class ="comments_section">
			<span class="glyphicon glyphicon-expand">  댓글 총 ${totalcount}개</span>
			<hr>
			<div id = "board_comments" class ="board_comments">
			
			</div>
			
			<hr>
			<div class="ans_writeform form-inline form-group" >
			<div>
			<div class ="ans_id">
			<input type="text" class="form-control input-sm" id="acnum" value ="${dto.bnum}">
			<input type="text" class="form-control input-sm" id="amidnum" value ="${mdto.mnum}">
			<input type="text" class="form-control input-sm" id="awriter" value ="${mdto.mnick}">
			
			
			</div>
			<textarea class = "ans_writearea" id="amemo" name="amemo"> </textarea><br>
			</div>
			<button class ="ans_savebtn" id = "ans_savebtn" type ="button" >댓글쓰기</button>
			</div>
			</div>
</body>

</html>


