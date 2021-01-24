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
<link rel="stylesheet" href="${root}/css/board/boardupdate.css" />

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<div class="board_updatelayout">

		<div class="board_updatemain">
			<h3 "location.href='../board/list'" >의료정보 커뮤니티</h3>
			<div style="display: flex; justify-content: center;"></div>
		</div>
	</div>

	<div class="board_updatec">
		<form action="update" method="post" enctype="multipart/form-data">

			<div class="board_updateform">
				<h3>글제목</h3>
				<input type="text" class="board_topic" id="board_topic" name="bsubject" value ="${dto.bsubject}"/>
				<input type="text" class="board_bid" id="board_bid" name="bnum" value="${dto.bnum}" />
				<input type="text" class="board_id" id="board_id" name="bmidnum" value="${mdto.mnum}" />
				<input type="text" class="board_nick" id="board_nick" name="bwriter" value="${mdto.mnick}"/>
				<input type ="hidden" name="pageNum" value ="${pageNum}">
				<input type ="hidden" name="regroup" value ="${dto.regroup}">
				<input type ="hidden" name="restep" value ="${dto.restep}">
				<input type ="hidden" name="relevel" value ="${dto.relevel}">
			</div>

			<hr>
			<div class="board_updatecontents">
				<div class="jsx-2303464893 editor">
					<div class="fr-box fr-basic fr-top" role="application">
						<div class="fr-wrapper show-placeholder" dir="auto"
							style="overflow: scroll;">
							<textarea  id="smartEditor" name="bcontent" 
								style="width: 100%; height: 412px; background-color: white; opacity: 1;">${dto.bcontent}</textarea>
						</div>

					</div>
				</div>
			</div>
			<div class="board_hashform">
				<hr>
				<input type="text" class="board_hashtag" />
				<button type="button" class="board_hashbtn">태그 추가</button>
			</div>
			<hr>
			<div class ="board_btngroup" >
			<button type="button" class="board_listbtn" onclick="location.href='../list'">목록</button>
			<button type="submit" class="board_savebutton" onclick="submitContents(this)" >저장</button>
			
			</div>
		</form>
	</div>

<script type="text/javascript">
var oEditors = []; 

nhn.husky.EZCreator.createInIFrame({ 
oAppRef : oEditors, 
elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다. 
sSkinURI : "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요! 
fCreator : "createSEditor2", 
htParams : { 
   // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseToolbar : true, 
   // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseVerticalResizer : true, 
   // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
   bUseModeChanger : true 
} 
}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

 // 에디터의 내용이 textarea에 적용된다.

 oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", [ ]);



 // 에디터의 내용에 대한 값 검증은 이곳에서

 // document.getElementById("textAreaContent").value를 이용해서 처리한다.
 try {
     elClickedObj.form.submit();
 } catch(e) { 

 }

}

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>resources/photo_upload/'+filepath+'">';
    oEditors.getById["smartEditor"].exec("PASTE_HTML", [sHTML]); 

}

</script>
</body>
</html>


