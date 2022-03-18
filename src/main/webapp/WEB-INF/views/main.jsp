<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>BSS</title>

</head>
<body>
<h3>테스트</h3>
<h3>테스트</h3>
    <header>
        <nav>
            <ul id="tnb">
                <li><a href="#">홈</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
        </nav>
        <a href="#"><img src="imgs/logo.png" alt="로고이미지"></a>
    </header>
    <div id="article">
        <nav>
            <ul id="gnb">
                <li><a href="#">직원소개</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">나눔게시판</a></li>
                <li><a href="#">정책소개</a></li>
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
    <div id="copy">
        <p>
            오시는 길: 광주서구 경열로3, 한울직업전문학교 <br>
            Copyright BSS Corp. All Rights Reserved. | 사업자등록번호 :111-11-111111
        </p>
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
</body>
</html>