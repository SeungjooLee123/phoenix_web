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
color: #707070;
margin-bottom: 10px;
display: flex;  
 column-gap: 1rem;
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
<ul class="footer">
	<li>전체서비스</li>
	<li>이용약관</li>
	<li class="footer-corp">개인정보처리방침</li>
	<li>고객센터</li>
	<li class="footer-corp">© BSS Corp.</li>
</ul>

<div class="footer-copy">
<a href="<c:url value='/'/>"><span class="footer-logo"><img src="imgs/testbss.png" width="70" height="15"></span></a>
	<span class="text">Copyright</span>
	<span class="corp"> © BSS Corp.</span>
	<span class="text"> All Rights Reserved.</span>
</div>
</footer>