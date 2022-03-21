<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<header>
	<nav>
		   <a href='<c:url value="/"></c:url>'><img src="imgs/testbss.png"></a>
	</nav>
</header>
<article>
<div>
	<input type="text" placeholder="아이디" id="userId" autofocus/>
</div>
<div>
	<input type="password" placeholder="비밀번호" id="userPw"/>
</div>
	<a onclick="login()">로그인</a><a href='<c:url value="/join"/>'>회원가입</a>
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
					alert("아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.")
				}	
			}, error : function (req, text) {
				alert(text + ':' + req.status);
			}
		});
		}
	</script>

</article>
</body>
</html>