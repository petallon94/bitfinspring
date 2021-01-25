function submitAuthForm(memail) {
	$.ajax({
		type:"post",
		url:${root}/member/findmid,
		dataType:"html",
		data:{
			"memail":memail
		},
		success:function(result){
			alert(result);
		}
	});
}