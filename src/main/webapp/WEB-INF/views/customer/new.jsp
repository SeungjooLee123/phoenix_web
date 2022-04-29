<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
.modal-overlay {
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    z-index: 2100;
    background-color: rgba(0,0,0,0.1);
}
.modal-window {
    position: relative;
    z-index: 2200;
    width: 650px;
    height: 250px;
    background-color: #fff;
    text-align: center;
    margin: 0 auto;
    margin-top: 250px;
    border-radius: 5px;
}
.modal_content{
	padding: 60px;
}
.input_div{
	display: flex;
	align-items: center;
}
.input_t{
	width: 150px;
	margin-left: 20px;
}
.btnSet{
	margin-top: 20px;
	display: flex;
	float: right;
}
.btn_style{
	display: block;
	font-size: 15px;
	background: #f5f5f5;
	cursor: pointer;
	text-align: center; 
	padding: 10px 13px;}
.btn_fill{
	font-weight: 700;
	display: block;
	font-size: 15px;
	background: #f0efff;
	border-radius: 5px;
	cursor: pointer;
	text-align: center; 
	padding: 10px 30px;
	margin-right: 10px;}
.line{
	border-bottom: 1px solid rgba(0,0,0,0.1);
}
.btn_style_b{
display: block;
font-size: 14px;
background: #f3f3f3;
border-radius: 5px;
font-weight: 400;
cursor: pointer;
text-align: center; 
margin: 0 10px; padding: 10px 26px;}
.btn_style_g{
display: block;
font-size: 14px;
color: #fff;
background: #4c4c4c;
border-radius: 5px;
font-weight: 400;
cursor: pointer;
text-align: center; 
margin: 0 10px; padding: 10px 26px;}
.cu_hr{
	margin: 20px 0;
}
input{
padding: 10px;
}
#preview{
	height: 25px;
	width: 25px;
}
#preview-img{
	height: 25px;
	width: 25px;
}
.file-img{
	display: none;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container" style="width:820px; margin: 0 auto;">
		<h1 style="margin-top: 65px; margin-bottom: 30px;">문의하기</h1>
		<form action="insert.cu" method="post" enctype="multipart/form-data">
		<div style="width: 820px;"><p style="width: 120px; margin-left: auto;">*필수 입력 사항</p></div>
		<c:if test="${empty loginInfo}">
			<hr class="cu_hr" style="opacity: 0.7; height: 2px; background: #000; border: 0px;">
			
			<div class="input_div">
				<div class="input_t">이메일 주소 *</div>
				<div>
					<input class='chk' title='이메일 주소' placeholder="bss12345@babysmile.com" type="text" name="email" style="width: 630px; height: 38px; font-size: 15px; margin-left: 20px;"/>
				</div>
			</div>
			<hr class="cu_hr">
			<div class="input_div">
				<div class="input_t">휴대폰 번호 *</div>
				<div>
					<input class='chk' pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" title='휴대폰 번호' placeholder="010-1234-1234" type="text" name="phone" style="width: 630px; height: 38px; font-size: 15px; margin-left: 20px;"/>
				</div>
			</div>
		</c:if>
		<hr style="opacity: 0.7; height: 2px; background: #000; border: 0px; margin: 20px 0;">
		
			<div class="input_div">
				<div class="input_t">문의 분류 *</div>
				<div>
					<select id="body" name="category" style="width: 290px; height: 38px; font-size: 15px; margin-left: 20px; padding: 5px;">
						<option value="normal" selected="selected">일반문의</option>
						<option value="app">어플리케이션</option>
						<option value="web">BSS 웹</option>
						<option value="account">계정/로그인/탈퇴</option>
					</select>
				</div>
			</div >
			<hr class="cu_hr">
			<div class="input_div">
				<div class="input_t">제목 *</div>
				<div>
					<input class='chk' title='제목' type="text" name="title" style="width: 630px; height: 38px; font-size: 15px; margin-left: 20px;"/>
				</div>
			</div>
			<hr class="cu_hr">
			<div class="input_div">
				<div class="input_t">문의 내용 *</div>
				<div><textarea class='chk' title='문의사항' name="content" style="padding:10px; width: 630px; height: 260px; font-size: 15px; margin-left: 20px;"></textarea></div>
			</div>
			<hr class="cu_hr">
			<div class="input_div">
				<div class="input_t">파일 첨부</div>
				<div style="display: flex; align-items: center;">
					<label>
						<input type="file" name="file" id="attach-file" style="width: 200px" />
						<a><img src="imgs/select.png" class="file-img"></a>
					</label>
					
					<%-- 이미지 파일 미리보기 적용 --%>
					<div style="width: 25px; height: 25px;"><span id="preview"></span></div>
					<a id="delete-file" style="display: none; margin-left: 10px;"><i class="fa-solid fa-circle-minus"></i></a>
				</div>
			</div>
		</form>
		<div style="border-top: solid 3px #000; opacity: 0.7; margin: 20px 0;"></div>
		<div class="btnSet">
		<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
			<a class="btn_fill" onclick="fn_submit()"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;문의접수</a>
			<a class="btn_style" href="list.cu">취소</a>
		</div>
	</div>
	<c:if test="${empty loginInfo}">
		<div id="modal" class="modal-overlay">
	    <div class="modal-window">
	    	<img src="imgs/xxx.png" onclick="modalclose()" style="width:20px; float: right; margin: 20px; cursor: pointer; font-size: 25px;">
	    	<div class="modal_content">
	        	<h3 style="margin-bottom: 15px; font-size: 25px;">로그인 하시겠습니까?</h3>
	            <p style="margin-bottom: 8px; font-size: 18px;">로그인하시면 조금 더 편리하게 문의를 남기실 수 있습니다.</p>
	            <p style="margin-bottom: 20px; font-size: 18px;">(로그인하지 않으셔도 접수는 가능합니다.)</p>
	            <div style="display: flex; justify-content: center;">
		            <a class="btn_style_b" href="login">확인</a>
					<a class="btn_style_g" onclick="modalclose()">취소</a>
				</div>
	        </div>
	    </div>
    </div>
    </c:if>
	 <script src="js/file_check.js?v<%=new Date().getTime() %>" ></script>	<%-- java.util의 date --%>
	 <script type="text/javascript">
	 function fn_submit() {
		 var islogin = '${loginInfo}';
		 if(islogin == ''){
		 	if( emptyCheck() && checkIt() && checkIt_phone()) $('form').submit();
		 }else{
			 if( emptyCheck() ) $('form').submit();
		 }
	}
	 	function modalclose() {
			$('#modal').css("display","none");
		}
	 	function autoHypenTel(str) {
	 		  str = str.replace(/[^0-9]/g, '');
	 		  var tmp = '';

	 		    if (str.length < 4) {
	 		      return str;
	 		    } else if (str.length < 7) {
	 		      tmp += str.substr(0, 3);
	 		      tmp += '-';
	 		      tmp += str.substr(3);
	 		      return tmp;
	 		    } else if (str.length < 11) {
	 		      tmp += str.substr(0, 3);
	 		      tmp += '-';
	 		      tmp += str.substr(3, 3);
	 		      tmp += '-';
	 		      tmp += str.substr(6);
	 		      return tmp;
	 		    } else {
	 		      tmp += str.substr(0, 3);
	 		      tmp += '-';
	 		      tmp += str.substr(3, 4);
	 		      tmp += '-';
	 		      tmp += str.substr(7);
	 		      return tmp;
	 		    }
	 		  return str;
	 		}
	 	$('[name=phone]').keyup(function (event) {
	 		  event = event || window.event;
	 		  var _val = this.value.trim();
	 		  this.value = autoHypenTel(_val);
	 		});
	 	function checkIt(){
			var email = $('[name=email]').val();
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(exptext.test(email)==false){
				alert("이메일형식이 올바르지 않습니다.");

				$('[name=email]').focus();

				return false;
			}
			return true;
		}
	 	function checkIt_phone() {
 	      var text = $('[name=phone]').val();

 	      var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
 	      if (regPhone.test(text) == false) {
 	          alert('휴대폰 번호의 형식이 올바르지 않습니다.');
 	          return false;
 	      }
 	      return true;
 	  }
	 </script>
</body>
</html>