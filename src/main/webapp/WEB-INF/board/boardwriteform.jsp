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
<link rel="stylesheet" href="${root}/css/board/boardwrite.css" />

<!-- smarteditior -->
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<div class="board_writelayout">

		<div class="board_writemain">
			<h3>의료정보 커뮤니티</h3>
			<div style="display: flex; justify-content: center;"></div>
		</div>
		<form id="editor_upimage" name="editor_upimage" method="post" enctype="multipart/form-data" onSubmit="return false;">
		
		<div class="board_writeform">
			<h3>제_목</h3><input type="text" class="board_topic" id="board_topic" />
		</div>
			<div class ="board_writecontents">
			<div class="jsx-2303464893 editor">
				<div class="fr-box fr-basic fr-top" role="application">
					<div class="fr-wrapper show-placeholder" dir="auto"
						style="overflow: scroll;">
						<textarea name="smartEditor" id="smartEditor"
							style="width: 100%; height: 412px; background-color : white; opacity : 1;" ></textarea>
					</div>
					
				</div>
			</div>
			</div>
		</form>		
		
		<hr>
		
			<hr>
			<input type="text" class ="board_hashtag" />
			<button type="button" class ="board_hashbtn">해시태그 추가</button>
			<hr>
			<button type="button" class="board_listbtn">목록</button>
			<button type ="button" id ="board_savebutton">저장</button>
		
	</div>

</body>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "smartEditor", //저는 textarea의 id와 똑같이 적어줬습니다.
		sSkinURI : "../se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
		fCreator : "createSEditor2",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,

			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : false,

			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true
		}
	});

	$(function() {
		$("#board_savebutton").click(
				function() {
					oEditors.getById["smartEditor"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					//textarea의 id를 적어줍니다.

					var title = $("#board_topic").val();
					var content = document.getElementById("smartEditor").value;
					

					if (title == null || title == "") {
						alert("제목을 입력해주세요.");
						$("#board_topic").focus();
						return;
					}
					if (content == "" || content == null || content == '&nbsp;'
							|| content == '<br>' || content == '<br/>'
							|| content == '<p>&nbsp;</p>') {
						alert("본문을 작성해주세요.");
						oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱
						return;
					} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.

					var result = confirm("글을 작성하시겠습니까?");

					if (result) {
						alert("발행 완료!");
						$("#boardwriteForm").submit();
					} else {
						return;
					}
				});
	})
</script>
</html>


