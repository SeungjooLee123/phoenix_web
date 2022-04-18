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
height: 150px;
}

.header_wrap {
position: relative;
max-width: 1300px;
margin : 0 auto;
height: 72px;
}

.gnbContent{
text-align: center;
}

.list_gnb{
font-weight: 700;
right: 29%;
top: 5px;
position: absolute;
display: flex;
justify-content: center;
margin-left: -74px;
font-size: 16px;
letter-spacing: -.5px;
}

.list_gnb > li {
display: block;
padding: 20px 20px;
cursor: pointer;}

.list_gnb >li>a:hover, active {
color: #eee;}

hr {
opacity: 0.3; 
}

.utill {
position: absolute;
right: 0;
top: 0;
padding-top: 18px;}


#tnb_wrap {
list-style: none;
width: 1300px;
margin: 0 auto;
}

#tnb {
position: absolute;
display: flex;
}

.logo_text{
color: #000;
font-weight: 700;
font-size: 16px;
padding: 25px 0px 0px 50px;
}

.my_info{
display: flex;
padding: 25px 29px 0px 50px;
position: absolute;
right: 14.3%;
column-gap: 2rem;
font-weight: 700;
}

.line{
margin-top: 75px;}

.Info-line{
opacity: 0.2;
}




</style>
    <header>
        <nav class="header_wrap">
        	<h1 class="logo"><a href='/bss/'><img src="imgs/logo_ai.svg" style="width: 150px; padding-top:5px;"></a></h1>
         		<nav class="gnbContent">
         			<ul class="list_gnb">
         				<li><a href='<c:url value="/notice.no"/>'>공지사항</a></li>
         				<li><a href='<c:url value="/welfare"/>'>육아정보</a></li>
         				<li><a href='<c:url value="/community"/>'>커뮤니티</a></li>
         				<li><a href='<c:url value="/"/>'>나눔하기</a></li>
         				<li><a href='<c:url value="/"/>'>고객센터</a></li>
         			</ul>
         		</nav>
         		  <div class="utill">
        			<img src="imgs/gis_globe-earth-alt.png" style="width:36px; height:36px;">
        			<img src="imgs/clarity_moon-line.png" style="width:36px; height:36px;">
       			  </div>
        </nav>
        <hr>
 		<nav id="tnb_wrap">
 			<ul id="tnb">
 					<li class="logo_text">베시시</li>
 				</ul>
 				<div class="my_info">
                <!-- 로그인 하지 않은 경우 -->
                <c:if test="${empty loginInfo }">
                	<li><a href='<c:url value="/join"/>'>회원가입</a></li>
                	<li class="Info-line">|</li>
               		 <li><a href='<c:url value="/login"/>'>로그인</a></li>
                </c:if>
                      <!-- 로그인의 경우 -->
                    <c:if test="${!empty loginInfo }">
               			 <li><a href='<c:url value=""/>'>마이페이지</a></li>
               			 <li><i class="fa-solid fa-pipe"></i></li>
               			 <li  class="Info-line">|</li>
                   		<li><a href='<c:url value="/logout"/>'>로그아웃</a></li>
                </c:if>
                </div>
 		</nav>
 		<hr class="line">
    </header>
     		











