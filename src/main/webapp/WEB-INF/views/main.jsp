<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#bss{
margin-top:10%;}


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

.show > li:hover {
transform: scale (0.8);
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
	<img src="imgs/bss_ad_pick.png" style=" height:770px;">
</div>	

    <script type="text/javascript">
	$(document).ready(function() {
	    var idx = 0;
	    setInterval(function(){
	        $('#slide > a').eq(idx).animate({left:'-100%'},400).animate({left:'100%'}, 0);
	        idx==2?idx=0:idx++;
	        $('#slide > a').eq(idx).animate({left:0}, 400);
	    }, 3000);
	});
	</script>

</section>
</body>
</html>