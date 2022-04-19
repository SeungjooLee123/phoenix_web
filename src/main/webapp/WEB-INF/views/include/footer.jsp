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
	<li>공지사항</li>
	<li>육아정보</li>
	<li>커뮤니티</li>
	<li>나눔하기</li>
	<li>고객센터</li>
</ul>

<ul class="footer-two">
	<li>베시시 소식</li>
	<li>출산 정책 정보</li>
	<li></li>
	<li>육아용품 나눔</li>
	<li>베시시 고객센터</li>
</ul>


<div class="footer-copy">
<a href="<c:url value='/'/>"><span class="footer-logo"><img src="imgs/testbss.png" width="70" height="15"></span></a>
	<span class="text">Copyright</span>
	<span class="corp"> © BSS Corp.</span>
	<span class="text"> All Rights Reserved.</span>
</div>
</footer>