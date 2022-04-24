<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/admin" method="post">
<section id="container" style="width:1300px; margin: 0 auto; display: flex;">
	<div style="width: 230px; text-align: center; background: #eee;">
		<ul>
			<li style="margin-top: 30px; font-size: 17px; color: #000; font-weight: 700;">관리자</li>
			<li style="font-weight:500; margin-top:10px; color:#888888; font-size: 15px;"  >${loginInfo.id }</li>
		</ul>
		<div style="border-top: 1px solid #888888; margin-left: 25px; width: 80%; opacity: 0.3; margin-top: 20px;"></div>
		<div style="display: flex; align-items: center; padding-bottom: 26px;">
			<h4 style="font-size: 15px; padding: 10px 0 0 32px; font-weight: 600; opacity: 0.7; color: #888888">사이트관리</h4>
			<img src="imgs/admin-option.png" style="width: 25px; height: 25px; margin-top: 10px; margin-left: 67px;">
		</div>
		<div style="display: flex; align-items: center; padding-bottom: 6px;">
			<img src="imgs/admin-list.png" style="width: 20px; height: 20px; margin-left: 43px;">
			<p style="font-size: 15px; margin-left: 12.5px; font-weight: 700;">사용자 관리</p>	
		</div>
	
		<ul style="font-size: 15px; line-height: 2rem; font-weight: 500;">
			<li>사용자 목록</li>
			<li >사용자 조회</li>
			<li>사용자 탈퇴</li>
		</ul>
		<div style="display: flex; align-items: center; padding-top: 26px; padding-bottom: 5px;">
			<img src="imgs/admin-question.png" style="width: 20px; height: 20px; margin-left: 43px;">
			<p style="font-size: 15px; margin-left: 12.5px; font-weight: 700; padding-left: 9.5px;">문의사항</p>	
		</div>
			<ul  style="font-size: 15px; line-height: 2rem; font-weight: 500;">
			<li>문의내역</li>
			<li>문의답변</li>
		</ul>
	</div>
	<hr>
<div style="width:1070px;">
	<h2 style="margin-left: 50px; margin-top: 50px;">사용자 목록</h2>
	<ul style="display: flex; margin-top: 50px; margin-left: 50px; column-gap: 14rem;">
		<li>사용자 아이디</li>
		<li>네이버</li>
		<li>카카오</li>
		<li>가입날짜</li>
	</ul>
	<div style="border-top: 1px solid #000; margin-top: 10px; width: 95%; margin-left: 50px;"></div>
	
	<c:forEach var="vo" items="${list }">
	<ul style="display: flex; margin-left: 50px; margin-top: 20px; margin-bottom: 20px;">
	<a href='detail.ad?id=${vo.id} '><li style="width: 260px;">${vo.id}</li></a>
			<li style="width:100px; margin-left: 73px;">${vo.naver_id_chk}</li>
			<li style="width: 100px; margin-left: 170px;">${vo.kakao_id_chk} </li>
			<li style="width:150px; margin-left: 114px; padding-left: 60px;">${vo.join_date}</li>
	</ul>
	<div style="border-top: 1px solid #000; margin-top: 10px; width: 95%; margin-left: 50px; opacity: 0.2;"></div>
	</c:forEach>
	


</div>
</section>
</form>

</body>
</html>