<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style type="text/css">
a:link,
a:visited {
  text-decoration: none;
  color: inherit;
}
.footer { 
font-weight:700;
color: #000;
margin-bottom: 10px;
display: flex;  
 column-gap: 14rem;
 justify-content: center;
 padding-left: 23px;
  }
  
.footer-two{
margin-top: 30px;
display: flex;
column-gap: 14rem;
justify-content: center;
}

ul {list-style:  none;}


.footer-copy {
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
 
</style>

<html>
<footer>
<div style="border-top :1px solid #eee; margin-bottom:40px; margin-top: 150px;"></div>


<ul class="footer">
		<li><a href='<c:url value="/calendar"/>'>이벤트</a></li>
        <li><a href='<c:url value="/list.wel" />'>육아정보</a></li>
        <li><a href='<c:url value="/community"/>'>커뮤니티</a></li>
        <li><a href='<c:url value="/share"/>'>나눔하기</a></li>
        <li><a href='<c:url value="/list.cu" />'>고객센터</a></li>
</ul>
<div class="footer-wrap" style="width:1300px; margin-left: 133px; display: flex; margin-top: 40px; font-size: 13px; color:#888888; font-weight:500; line-height: 2; ">
	<div class="footer-notice">
		<p>이벤트 소식</p>
		<p><a href='<c:url value="/select"/>'>히스토리</a></p>
	</div>

	<div class="footer-welfare" style="margin-left:202px;">
		<p>출산 정책 정보</p>
		<p>어린이집 정보</p>
		<p>주변 소아과 정보</p>
	</div>
	
	<div class="footer-community" style="margin-left:188px;">
		<p>이번 달 인기 글</p>
		<p>육아 정보 나눔</p>
		<p>동네 키즈 카페</p>
	</div>
	
	<div class="footer-share" style="margin-left: 196px;">
		<p>육아용품 나눔</p>
		<p>
	</div>
	
	<div class="footer-cs" style="margin-left: 205px;">
		<p>베시시 고객센터</p>
		<p>베시시 계정</p>
		<br>
		<h2 style="color:#000; font-weight: 700;"><a href="https://github.com/eor8451/phoenix_web">인재영입</a></h2>
	</div>
</div><!-- footer-wrap -->
<div class="footer-info" style="margin-left: 132px; font-size: 12px; margin-top: 120px;">
<ul style="display: flex; column-gap: 1rem;">
	<li style="color: #888">이용약관</li>
	<li style="color: #333; font-weight: 700;">위치기반서비스이용약관</li>
	<li style="color: #333; font-weight: 700;">개인정보처리방침</li>
	<li style="color:#888;">운영정책</li>
	<li style="color:#888;">권리침해신고안내</li>
	<li style="color:#888;"><a href="https://github.com/eor8451/phoenix_web">Contact Us</a></li>
</ul>
<br>
<ul>
	<li style="color:#888; padding-bottom: 100px;">© Baby Smile Support Corp. All rights reserved.</li>
</ul>
</div>
</footer>