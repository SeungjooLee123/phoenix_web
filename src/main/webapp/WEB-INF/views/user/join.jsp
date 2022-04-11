<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#container {
width:1440px;
margin:0 auto;}
.id-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 300px;
}
.input-id{
display: flex;
justify-content: center;
}
.pw-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 285px;
}
.input-pw{
display: flex;
justify-content: center;
}
.pw-check-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 250px;
}
.input-pw-check{
display: flex;
justify-content: center;
}
.valid{
text-align: center;
}
#userId:focus,  #userPw:focus, #userPwChk:focus {
outline: 1px solid  #A5A0F0;
z-index: 5;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container">
<form action="join" method="post">
<div class="id-text">아이디</div>
<div class="input-id">
<input type="text" name="id" id="userId" autofocus style="width:350px; height:40px; margin-bottom:13px; border:1px solid #dadada; border-radius:6px; padding-left:10px;"/>
</div>
<div class="valid">아이디는 영문소문자와 숫자만 입력 가능합니다.</div>
<div class="pw-text">비밀번호</div>
<div class="input-pw">
<input type="password" name="pw"  id="userPw" style="width:350px; height:40px; margin-bottom:13px; border:1px solid #dadada; border-radius:6px; padding-left:10px;"/>
</div>
<div class="valid">비밀번호는 영문대/소문자와 숫자를 모두 포함해야 합니다.</div>
<div class="pw-check-text">비밀번호 확인</div>
<div class="input-pw-check">
<input type="password" name="pwcheck"  id="userPwChk" style="width:350px; height:40px; margin-bottom:13px; border:1px solid #dadada; border-radius:6px; padding-left:10px;"/>
</div>
<div class="valid">비밀번호를 다시 입력하세요</div>
<a>회원가입</a>


</form>
</div>
</body>
</html>