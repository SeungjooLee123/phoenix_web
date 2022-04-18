<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>육아정보</title>
<style type="text/css">
#wel_container {width: 1440px; margin :0 auto;}
#cate-ul{display: flex;}
#cate-ul>li{margin-top: 40px;}
#cate-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
#cate-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
#cate-ul li > a.btn-empty{background: #f5f5f5;}
</style>
</head>
<body>
	<div id='wel_container'>
		<h3>육아정보</h3>
		<div id="wrap_cate">
			<ul id="cate-ul">
				<li><a class="btn-fill">출산정책</a></li>
				<li><a class="btn-empty" id="baby-welfare">육아정책</a></li>
				<li><a class="btn-empty">통계자료</a></li>
				<li><a class="btn-empty" id="map-search">주변장소검색</a></li>
			</ul>
		</div>
		<div id="main-content">
			<div id="div1"></div>
			<div id="div2"></div>
			<div><jsp:include page="/WEB-INF/views/welfare/graph.jsp"/></div>
			<div><jsp:include page="/WEB-INF/views/welfare/map.jsp"/></div>
		</div>
	</div>
	<script type="text/javascript">
		$("#main-content>div").eq(0).show().siblings('div').hide();
		$(function(){
			$("#cate-ul li").click(function(){
				var tabItem = $(this).index();
				$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
				$("#cate-ul li>a").eq(tabItem).attr("class", "btn-fill");
				$("#main-content>div").eq(tabItem).show().siblings('div').hide();
				if(tabItem == 0) $("#div1").load("list.wel?category='childbirth'");
				else if(tabItem == 1) $("#div2").load("list.wel?category='parenting'");
			});
		});
	</script>
</body>
</html>