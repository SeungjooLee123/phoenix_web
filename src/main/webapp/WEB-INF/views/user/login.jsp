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
		   <a href='<c:url value="/" />'><img src="imgs/testbss.png"></a>
	</nav>
</header>
<article>
<div>
	<input type="text" placeholder="아이디" id="userId" autofocus/>
</div>
<div>
	<input type="password" placeholder="비밀번호" id="userPw"/>
</div>
	<a href="">로그인</a><a href="">회원가입</a>
	

</article>
</body>
</html>