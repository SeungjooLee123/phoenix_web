<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');

#bss{
margin-top:5%;}


#container{
text-align: center;}

.app_name{
margin-top: 70px;
margin-bottom: 30px;
color: #333;
font-size: 18px;}

.main_text{
font-size: 42px;
line-height: 1.29;
letter-spacing: -.8px;
}

.icons {
margin-top: 50px;
display: flex;
justify-content: center;
}

.icons > a {
display: block;
padding: 0 1px 0 9px;
margin-bottom: 70px;}

.show:hover {
transform: scale (0.8);
}

.seconde-img{
margin-top: 300px;
}

#seconde-container{
text-align: center;}

.seconde-main-text{
font-size: 32px;
font-weight: 700;
line-height: 1.38;
color: #000;
letter-spacing: .8px;
font-family: 'Noto Sans KR', sans-serif;
}

</style>
<meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>BSS</title>
</head>
<body>
<section id="bss">
	<div id="container">
		<h4 class="app_name">베시시</h4>
			<h2 class="main_text">아이와 부모를 위한
						<br/>
			모든 육아의 시작, 베시시</h2>
<div class="icons">
	<a href=""><img src="imgs/icon_naver.png" style="width:24px; height: 24px;"></a>
	<a href=""><img src="imgs/icon_naver.png" style="width:24px; height: 24px;"></a>
	<a href=""><img src="imgs/icon_naver.png" style="width:24px; height: 24px;"></a>
</div>
	</div>
<div class="show">
	<img src="imgs/bss_ad_pick.png" style="width:100%; height:770px;">
</div>	
</section>
<div id="seconde-container">
<div class="seconde-img">
	<img src="imgs/tmdwn_boy.png" style="width:300px; height:300px;">
</div>
<p class="seconde-main-text">
아이와 부모,
<br/>
모두의 행복을 이어주는 베시시
<br/>
양육자의 손이 되어주는
<br>
대표 육아어플
<br>
언제 어디서나 간편하게
<br>
아이와 함께 사용해보세요.
</p>
</div>
</body>
</html>