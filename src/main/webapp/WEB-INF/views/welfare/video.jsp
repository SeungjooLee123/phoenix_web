<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .test{max-width: 1200px; margin: 0 auto;}
   .wrap_video, .wrap_video2{width: 1300px; margin: 0 auto; margin-top: 10px;}
   #popup-background{
   position: absolute; left: 0; top: 0; width: 100%; height: 100%;
   background-color: #000; opacity: 0.3; display: none; margin: 0 auto;
   }
   iframe{margin: 10px;}
   .slick-track{height: 315px;} 
   .slick-prev:before, .slick-next:before{color: #8c88c9 !important; opacity: 1 ; }
   .wrap-video img{width: 390px; height: 320px;}
   .wrap-video2 img{width: 390px; height: 320px;}
  
   .center {position: absolute; left:50%; top:50%; transform:translate(-50%, -50%); }
</style>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
</head>
<body>
      <jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
      
      <div class="test">
         <h3>출산 전 정보</h3>
         <div class="wrap_video">
            <img src="imgs/ch_img1.png" style="margin-right: 10px;" />
            <img src="imgs/ch_img2.png" style="margin-right: 10px;"/>
            <img src="imgs/ch_img3.png" style="margin-right: 10px;"/>
            <img src="imgs/ch_img4.png" style="margin-right: 10px;"/>
            <img src="imgs/ch_img5.png" style="margin-right: 10px;"/>
            <img src="imgs/ch_img6.png" style="margin-right: 10px;"/>
         </div>
         <h3 style="margin-top: 20px;">육아 정보</h3>
         <div class="wrap_video2">
            <img src="imgs/pa_img1.png" style="margin-right: 10px;">
            <img src="imgs/pa_img2.png" style="margin-right: 10px;">
            <img src="imgs/pa_img3.png" style="margin-right: 10px;">
            <img src="imgs/pa_img4.png" style="margin-right: 10px;">
         </div>
         
         
      </div>
      <div id="popup-background"></div>
		<div id="popup" class="center" style="vertical-align: middle;"></div>
  
      <script type="text/javascript">
         $.noConflict();
         $('.wrap_video').slick({
            lazyLoad: 'ondemand',
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000
         });
         $('.wrap_video2').slick({
            lazyLoad: 'ondemand',
            slidesToShow: 3,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000
         });
         
         $(document).on('click', '.wrap_video img', function() {
        	   $('#popup, #popup-background').css('display', 'block');
        	   $('#popup').html('<iframe id="test_click" width="1000" height="600" src="https://www.youtube.com/embed/lc1fVIK17Bg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	})
        	$(document).on('click', '#popup-background', function() {
        	   $('#popup, #popup-background').css('display', 'none');
        	   $('#popup').html('<iframe id="test_click" width="1000" height="600" src="https://www.youtube.com/embed/lc1fVIK17Bg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	}).on('click', '#popup-background', function (){
        		$('#popup , #popup-background' ).css('display', 'none');	
        	})
         
         $("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
         $("#cate-ul li>a").eq(1).attr("class", "btn-fill");
      </script>
   
</body>
</html>