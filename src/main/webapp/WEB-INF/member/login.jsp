<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('87ba928e25c8fcc2c9de8e5b9ed0814f');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
        
    </script>
</head>
<body>
<div class="login_container">
	<div class="login_wrapper">
		<form action="loginmethod" method="post">
			<div class="login_symbol_background">
				<img src="${root}/image/covid_symbol.png" >
			</div>
			<div class="login_input1">
				<input type="text" name="mid" class="login_id" required />
				<div class="underline"></div>
				<label><span class="glyphicon glyphicon-user"></span>  ID</label>
			</div>
			<div class="login_input1">
				<input type="text" name="mpw" class="login_id" required />
				<div class="underline"></div>
				<label><span class="glyphicon glyphicon-lock"></span>  Password</label>
			</div>
			<div class="login_btns">
				<button type="submit" class="login_btn">L o g  I n</button><br>
				<button type="button" class="login_btn signup_btn" onclick="location.href='signup'">S I G N  U P</button>
			</div>
			
			
			
			
			
			<!-- 카카오 자바 사용 스크립트 -->
			<a href="javascript:loginWithKakao()"><img src="${root}/image/kakao_login.png" class="kakaologin_btn" alt="카카오 로그인 이미지"></a>
			
			
			
			
			
			
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
function loginWithKakao() {
    Kakao.Auth.login({
      scope:'profile,  account_email',
      success: function(authObj) {
        //console.log(authObj)
        window.Kakao.API.request({
        	url:'/v2/user/me',
        	success:res=>{
        		const kakao_account=res.kakao_account;
        		console.log(kakao_account);
        		var mnick=kakao_account.profile.nickname;
        		var memail=kakao_account.email;
        		sendPost('/member/kakaologin', {'mnick':mnick,'memail':memail})
        	}
        })
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      }
   })
}

function sendPost(action, params) {
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', action);
	document.charset = "utf-8";
	for(var key in params) {
		var hiddenField = document.createElement('input');
		hiddenField.setAttribute('type', 'hidden');
		hiddenField.setAttribute('name', key);
		hiddenField.setAttribute('value', params[key]);
		form.appendChild(hiddenField);
	}
	document.body.appendChild(form);
	form.submit();
}

</script>
</html>