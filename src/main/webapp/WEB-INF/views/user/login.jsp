<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
a:link,
a:visited {
  text-decoration: none;
  color: inherit;
}

#container {
width: 1440px;
margin :0 auto;}

.login-logo{
margin-bottom: 60px;
margin-top: 100px;
text-align: center;
}

.input {
display: flex;
justify-content: center;
}

#userId:focus,  #userPw:focus {
outline: 1px solid  #A5A0F0;
z-index: 5;
}

.btns{
text-align: center;
margin-top: 15px;
}

.social-text{
text-align: center;
padding-top: 40px;
padding-bottom: 20px;
font-weight: 550;
font-size: 20px;
}

.tnb {
display:flex;
justify-content: center;
font-size: 13px;
margin-top: 50px;
padding-bottom: 30px;
color: #707070;
}

.ad{
text-align: center;
}

ul {
list-style: none;
}

.footer-copy {
	padding-top: 50px;
  display: flex;
  justify-content: center;
  margin-bottom: 15px;
}
.footer-logo{
margin-right: 10px;
width: 70px;
height: 15px;
}
.footer-corp {
color: #505050;
font-weight: 700;
}
.text {
color:#707070;
}

.corp{
padding: 0 4px;
font-weight: 500;
color: #000;
}

.sid{
padding:0 4px;}
</style>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div id ="container">
<header>
	<nav class="login-logo">
		   <a href='<c:url value="/"></c:url>'><img src="imgs/logo_ai.svg" style="width:194px; height:82px;"></a>
	</nav>
</header>
<article>
<div class="input">
	<input type="text" placeholder="아이디" id="userId" autofocus style="width:350px; height:40px; margin-bottom:13px; padding-left: 10px; border: 1px solid #dadada; border-radius:6px;"/>
</div>
<div class="input">
	<input type="password" placeholder="비밀번호" id="userPw" style="width:350px; height:40px; padding-left: 10px; border: 1px solid #dadada; border-radius:6px;"
	onkeypress = "if(event.keyCode ==13 ) login()"/>
</div>
<div class="btns">
	<a onclick="login()"><img src="imgs/login_btn.svg" style="width:155px; height:40px; margin-right:40px; cursor: pointer;"></a><a href='<c:url value="/join"/>'><img src="imgs/join_btn.svg" style="width:155px; height:40px;"></a>
</div>
<hr style="width:20%; height:1px; border:none; background:#B5B5B5; margin: 0 auto; margin-top: 50px; opacity: 0.6;">  
<p class="social-text">소셜로그인</p>
<div class="btns">
<a href="kakaoLogin"><img src="imgs/kakao_login_final.svg" style="width:155px; height:40px; margin-right:40px;"></a>
<a href="naverLogin"><img src="imgs/naver_login_final.svg" style="width:155px; height:40px;"></a>
</div>	
<nav>
	<ul class="tnb">
		<li>비밀번호 찾기 |</li>
		<li class="sid">아이디 찾기 |</li>
		<li><a href='<c:url value="/join"/>'>회원가입</a></li>
	</ul>
</nav>
<div class="ad">
	<img src="imgs/bss_ad1.png" style="width:400px; height:150px;">
</div>
<footer>
<div class="footer-copy">
<a href="<c:url value='/'/>"><span class="footer-logo"><img src="imgs/testbss.png" width="70" height="15"></span></a>
	<span class="text">Copyright</span>
	<span class="corp"> © BSS Corp.</span>
	<span class="text"> All Rights Reserved.</span>
</div>
</footer>
	<script type="text/javascript">
		function login() {
			if($('#userId').val() == '') {
				alert('아이디를 입력하세요');
				$('#userId').focus();
				return;
			}else if($('#userPw').val() =='') {
				alert('비밀번호를 입력하세요');
				$('#userPw').focus();
				return;
			}
			
		//login ajax 통신 
		$.ajax({
			url : 'bssLogin',
			data : {id:$('#userId').val(), pw:$('#userPw').val()},
			success : function (response) {
				if(response) {
					location =  '<c:url value="/"/>';
				}else {
					alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.\n입력하신 내용을 다시 확인해 주세요.")
				}	
			}, error : function (req, text) {
				alert(text + ':' + req.status);
			}
		});
		}
	</script>

</article>
</div>
</body>
</html>