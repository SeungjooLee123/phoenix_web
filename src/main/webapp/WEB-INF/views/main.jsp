<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>BSS</title>

</head>
<body>
    <div id="article">
        <nav>
            <ul id="gnb">
                <li><a href="#">공지사항</a></li>
                <li><a href="#">육아정보</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">나눔하기</a></li>
                <li><a href="#">고객센터</a></li>
       
            </ul>
        </nav>
    </div>
    <section>
        <div id="slide">
            <a href="#"><img src="imgs/hero.png"></a>
            <a href="#"><img src="imgs/hero.png"></a>
            <a href="#"><img src="imgs/hero.png"></a>
            <a href="#"><img src="imgs/hero.png"></a>
        </div>
    </section>
    <footer>
        <nav>
            <ul id="notice">
                <li><a href="#">공지사항</a></li>
            </ul>
        </nav>
    </footer>
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
</body>
</html>