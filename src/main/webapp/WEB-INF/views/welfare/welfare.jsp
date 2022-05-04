<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>육아정보</title>
<style type="text/css">
/* #tabs li.active { font-weight: 700; color: #000000; text-decoration: underline;}
#tabs li {margin: 22px 10px; cursor: pointer; font-size: 15px; color: #505050;}
#tab li>a.ncheckli {color: #000;}
#tab li>a.checkli {color: #8c88c9;} */
#container div>a {color: #505050; margin: 22px 0px; cursor: pointer; font-size: 15px; }
#container div>a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
#container div>ul li{color: #505050; margin: 22px 10px; cursor: pointer; font-size: 15px; }
#container div>ul li a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.list {margin: 22px 10px; }
.video {margin: 22px 10px; }
.graph ul>li:not(:first-of-type) {display: none; margin-left: 20px;}
.map ul>li:not(:first-of-type) {display: none; margin-left: 50px;}
.check{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.not_check{color: #505050; margin: 22px 0px; font-size: 15px;}
</style>
</head>
<body>
	<section id="container" style="width: 210px; height: 100%; display:flex;">
		<div style="width: 210px; margin-left: 20px;">
			<h3 style="margin: 50px 0px;">베시시</h3>
			<div class="list">
				<a class="checkli" href="list.wel">지원정책</a>
			</div>
			<div class="video">
				<a class="ncheckli" href="video.wel">동영상</a>
			</div>
			<div class="graph">
				<ul>
					<li><a href="graph.wel">통계자료</a></li>
					<li><a style="margin-left: 15px;" class="check">출생</a></li>
					<li><a style="margin-left: 15px;" class="not_check">표준발육</a></li>
				</ul>
			</div>
			<div class="map">
				<ul>
					<li><a href="map.wel">주변장소검색</a></li>
					<li><a style="margin-left: 15px;" class="check">소아과</a></li>
					<li><a style="margin-left: 15px;" class="not_check">키즈카페</a></li>
					<li><a style="margin-left: 15px;" class="not_check">어린이집</a></li>
					<li><a style="margin-left: 15px;" class="not_check">유아용품</a></li>
				</ul>
			</div>
		</div>
		<hr class='list_hr'>
	</section>
	<script type="text/javascript">
		$("#tabs li").click(function(){
			var tabItem = $(this).index();
			alert(tabItem);
			$("#tabs li>a").not("a.ncheckli").attr("class", "ncheckli");
			$("#tabs li>a").eq(tabItem).attr("class", "checkli");
		});
	</script>
</body>
</html>