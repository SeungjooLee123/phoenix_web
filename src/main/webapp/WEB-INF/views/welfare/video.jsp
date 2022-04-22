<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.test{max-width: 1300px; margin: 0 auto;}
	.wrap_video{width: 1300px; margin: 0 auto;}
	#popup-background{
	position: absolute; left: 0; top: 0; width: 100%; height: 100%;
	background-color: #000; opacity: 0.3; display: none;
	}
	iframe{margin: 10px;}
	.slick-track{height: 315px;}
	.slick-prev, .slick-next{background: #333;}
</style>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
</head>
<body>
		<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
		<div class="test">
			<div class="wrap_video">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/PAReMirO5Y8" title="YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<iframe width="560" height="315" src="https://www.youtube.com/embed/UVbrNhaXoZc" title="youTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<iframe width="560" height="315" src="https://www.youtube.com/embed/GQzqbnuLfbI" title="youTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<iframe width="560" height="315" src="https://www.youtube.com/embed/nBw4pDTf1Y8" title="youTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
		<div id='popup-background'></div>
		<div id="popup"></div>
		<script type="text/javascript">
			$.noConflict();
			$('.wrap_video').slick({
				lazyLoad: 'ondemand',
				slidesToShow: 2,
				slidesToScroll: 1,
				autoplay: true,
				autoplaySpeed: 2000
			});
			
			$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
			$("#cate-ul li>a").eq(1).attr("class", "btn-fill");
		</script>
	
</body>
</html>