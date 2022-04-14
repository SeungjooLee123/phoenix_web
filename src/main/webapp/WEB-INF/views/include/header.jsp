<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
nav ul {
  list-style: none;
}

header {
position : fixed;
width: 100%;
z-index: 2000;
top: 0;
left: 0;
right:0;
border:0;
background: #fff;
transition: top .2s ease-in-out;
}

.header_wrap {
max-width: 1300px;
margin : 0 auto;
height: 72px;
}

.gnbContent{
text-align: center;
}

.list_gnb{
display: inline-block;
margin-left: -74px;
font-size: 16px;
letter-spacing: -.5px;}

.menu{
display: block;
padding: 0 28px;
line-height: 72px;
font-weight: 700;
}

</style>
    <header>
        <nav class="header_wrap">
        	<h1 class="logo"><a><img src="imgs/logo_ai.svg" style="width: 194px; padding-top:24px;"></a></h1>
         		<nav class="gnbContent">
         			<ul class="list_gnb">
         				<li><a href='<c:url value="/"/>'></a>공지사항</li>
         				<li><a href='<c:url value="/"/>'></a>육아정보</li>
         				<li><a href='<c:url value="/"/>'></a>커뮤니티</li>
         				<li><a href='<c:url value="/"/>'></a>나눔하기</li>
         				<li class="menu"><a href='<c:url value="/"/>'></a>고객센터</li>
         			</ul>
         		</nav>
         		  <div class="utill">
        			<img src="imgs/gis_globe-earth-alt.png" style="width:36px; height:36px;">
        			<img src="imgs/clarity_moon-line.png" style="width:36px; height:36px;">
       			  </div>
        </nav>
        <hr>
        
 		<nav>
 			<ul id="tnb">
 			<li>베시시</li>
                <!-- 로그인 하지 않은 경우 -->
                <c:if test="${empty loginInfo }">
                	<li><a href='<c:url value="/join"/>'>회원가입</a></li>
               		 <li><a href='<c:url value="/login"/>'>로그인</a></li>
                </c:if>
                <!-- 로그인의 경우 -->
                    <c:if test="${!empty loginInfo }">
               			 <li><a href='<c:url value=""/>'>마이페이지</a></li>
                   		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
                </c:if>
            
                
 				</ul>
 		</nav>
 		<hr style="width:100%;">
    </header>











