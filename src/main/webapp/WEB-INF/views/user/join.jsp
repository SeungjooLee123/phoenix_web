<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#container {
width:360px;
margin:0 auto;

}
.login-logo{
margin-bottom: 60px;
margin-top: 40px;
text-align: center;
}
.input-info {
	text-align: center;
}
.id-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 300px;
}

.pw-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 285px;
}

.pw-check-text{
text-align: center;
margin-top: 30px;
margin-bottom: 20px;
margin-right: 250px;
}

#userId:focus,  #userPw:focus, #userPwChk:focus {
outline: 1px solid  #A5A0F0;
z-index: 5;
}

.btns{
justify-content: space-between;
display: flex;
}

.join_btns {
text-align: center;
margin-top: 20px;}

.footer-copy {
	padding-top: 50px;
  display: flex;
  justify-content: center;
  margin-bottom: 15px;
}

.invalid, .valid{
	font-size: 14px;
	text-align: left;
	margin: 0 0 20px 5px;
}
.invalid{
	color: red;
}
.valid{
	color: green;
}
.input-text{
	text-align: left;
	margin: 0 0 5px 5px;
}

.ad{
margin-bottom: 30px;
margin-top: 33px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<nav class="login-logo">
		   <a href='<c:url value="/"></c:url>'><img src="imgs/logo_ai.svg" style="width:194px; height:82px;"></a>
	</nav>
</header>
<div id="container">
<form action="member_insert.bss" method="post">
	<div class="input-info">
		<div class="input-text">아이디</div>
		<div>
		    <input type="text" class="chk" name="id" id="userId" autofocus style="width:340px; height:40px; border:1px solid #dadada; border-radius:6px; padding: 0 10px;"/>
			<div class="invalid" >아이디를 입력하세요(영문소문자, 숫자만 입력 가능)</div>
		</div>
	</div>
	<div class="input-info">
		<div class="input-text">비밀번호</div>
		<div>
		    <input type="password" class="chk" name="pw"  id="userPw" style="width:350px; height:40px; border:1px solid #dadada; border-radius:6px; padding-left:10px;"/>
			<div class="invalid">비밀번호를 입력하세요(영문소문자, 숫자만 입력 가능)</div>
		</div>
	</div>
	<div class="input-info">
		<div class="input-text">비밀번호 확인</div>
		<div>
	 	    <input type="password" class="chk" name="pwcheck"  id="userPwChk" style="width:350px; height:40px; border:1px solid #dadada; border-radius:6px; padding-left:10px;"/>
			<div class="invalid">비밀번호를 다시 입력하세요</div>
		</div>
	</div>
	
<div class="ad">
	<img src="imgs/bss_ad1.png" style="width:360px; height:150px;">
</div>
	
	<div class="btns">
	   <a href="naverLogin"><img src="imgs/naver_join.svg" style="width:155px; height:40px; margin-right:10px;"></a>
	   <a href="kakaoLogin"><img src="imgs/kakao_join.svg"  style="width:155px; height:40px; cursor: pointer;"></a>
	</div>
	
	<div class="join_btns">
	   <a onclick="go_join()"><img src="imgs/join_btn_check.svg" style="height:43px; cursor: pointer;"/></a>
	</div>
</form>
</div>
<footer>
<div class="footer-copy">
<a href="<c:url value='/'/>"><span class="footer-logo"><img src="imgs/testbss.png" width="70" height="15"></span></a>
	<span class="text">Copyright</span>
	<span class="corp"> © BSS Corp.</span>
	<span class="text"> All Rights Reserved.</span>
</div>
</footer>
<script type="text/javascript" src="js/join_check.js"></script>
<script type="text/javascript">
//join_check.js에 만들어놓은 검사 돌리기 위한 펑션
function item_check( item ) {
	var data = join.tag_status(item);
	if(data.code == 'invalid'){
		alert('회원가입 불가\n' + data.desc);
		item.focus();
		return false;
	}else return true;
}

function go_join() {
	//중복확인 검사 
	if($('[name=id]').hasClass('checked')){		//중복확인 검사를 했을 경우
		if($('[name=id]').siblings('div').hasClass('invalid')){//결과가 invalid면
			alert('회원가입 불가\n' + join.id.unUsable.desc);
			$('[name=id]').focus();
			return;
		}
	}else{	//중복확인 안 했을 경우
		if(!item_check($('[name=id]'))) return;
		else{
			alert('회원가입 불가\n' + join.id.valid.desc);	//사용할 수 있는 id여도 중복확인을 안 했으니 리턴시킴
			$('[name=id]').focus();
			return;
		}
	}
	
	//비밀번호 + 비밀번호 확인 + 이메일 검사 돌리기
	if(!item_check($('[name=pw]'))) return;
	if(!item_check($('[name=pwcheck]'))) return;
	
	//모든 검사를 통과했을 때
	$('form').submit();
}

// 아이디 영역밖을 클릭했을때
$('#userId').focusout(function() {
	id_check()
})

function id_check() {
	var $id = $('#userId');
	var data = join.tag_status($id); //아이디 유효성 검사
	if(data.code == 'invalid'){ //아이디가 유효하지 않으면
		$id.focus(); //포커스 다시 주고
		return; //리턴
	}
	
	//아이디가 유효하면 중복검사
	$.ajax({
		url : 'id_check.bss',
		data : { id : $id.val() },
		success : function (res) {
			var data = join.id_usable(res); //=> join_check의 id_usable을 동작시킨다
			$id.siblings('div').text(data.desc).removeClass().addClass(data.code);	//=> 결과값이 v/in 로 오게된다.
			$id.addClass('checked');
		},
		error : function (req, text) {
			alert(text + ' : ' + req.status);
		}
	});
}

$('.chk').on('keyup', function (e) {
	if($(this).attr('name') == 'id'){
		$(this).removeClass('checked');
		$(this).siblings('div').removeClass();
	}
	var data = join.tag_status( $(this) );	//join_check 안에 있는 join 안의 tag_status로 자기 자신을 보내 상태(code)+설명(desc)를 받아옴
	$(this).siblings('div').text(data.desc).removeClass().addClass(data.code);	//siblings == 형제
	//↑ 형제 관계인 div에 설명(desc) 메시지 보여주고, 클래스 제거 + 상태(code)로 클래스 세팅 => code마다 스타일이 다르므로
});
</script>
</body>
</html>