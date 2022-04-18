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
#container {
	width: 1440px;
	margin :0 auto;
}
#cate-ul{display: flex;}
#cate-ul>li{margin-top: 40px;}
#cate_ul > li > a{display: block;}
a{
	text-align: center;
	padding: 10px 13px;
	border-radius: 20px;
	margin: 0 10px;
	cursor: pointer;
}
a.btn-empty{background: #f5f5f5;}
a.btn-fill{background: #335495;color: #fff;}
</style>
</head>
<body>
	<div id='container'>
		<h3>육아정보</h3>
		<div id="wrap_cate">
			<ul id="cate-ul">
				<li><a class="btn-fill">출산정책</a></li>
				<li><a class="btn-empty">육아정책</a></li>
				<li><a class="btn-empty">통계자료</a></li>
				<li><a class="btn-empty" id="map-search">주변장소검색</a></li>
			</ul>
		</div>
		<div id="main-content">
			<div><jsp:include page="/WEB-INF/views/welfare/childbirth.jsp"/></div>
			<div><jsp:include page="/WEB-INF/views/welfare/parenting.jsp"/></div>
			<div><jsp:include page="/WEB-INF/views/welfare/graph.jsp"/></div>
			<div><jsp:include page="/WEB-INF/views/welfare/map.jsp"/></div>
		</div>
	</div>
	<script type="text/javascript">
		$("#main-content>div").eq(1).show().siblings('div').hide();
		$(function(){
			$("#cate-ul li").click(function(){
				var tabItem = $(this).index();
				$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
				$("#cate-ul li>a").eq(tabItem).attr("class", "btn-fill");
				$("#main-content>div").eq(tabItem).show().siblings('div').hide();
			});
		});
	</script>
</body>
</html>