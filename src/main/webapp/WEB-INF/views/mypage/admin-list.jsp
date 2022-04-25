<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list > li {
font-weight:700;
display: block;
padding: 6px 107px;
border: 1px solid #000;}

</style>
</head>
<body>



<section id="container" style="width:1300px; margin: 0 auto;">
<div style="margin-top: 50px; width: 1300px;">
<ul class="list" style="display: flex; justify-content: center;">
	<li>전체문의</li>
	<li>일반문의</li>
	<li>어플리케이션</li>
	<li>BSS 웹</li>
	<li>계정문의</li>
</ul>
</div>

<form action="admin" method="post">
  <input type="hidden" name="curPage" value="1" />
	<div class="list-top" style="padding: 20px 45px; float: right;">
		<ul style="display: flex;">
			<li>
				<select name="search">
					<option value="id" ${page.search eq 'id' ? 'selected' : '' }>아이디</option>	
				</select>
			</li>
			<c:if test="${page.keyword eq 'all' }">
				<li><input type="text" name="keyword"></li>
			</c:if>
			<c:if test="${page.keyword ne 'all' }">
				<li><input type="text" name="keyword" value="${page.keyword }"></li>
			</c:if>
			<li><a onclick="$('form').submit()">검색</a></li>
		</ul>
	
	</div>


</form>
<div style="width:1300px;">
	<h2 style="margin-left: 50px; margin-top: 50px;">사용자 목록</h2>
	<ul style="display: flex; margin-top: 50px; margin-left: 50px; column-gap: 18rem;">
		<li>사용자 아이디</li>
		<li>네이버</li>
		<li>카카오</li>
		<li>가입날짜</li>
	</ul>
	<div style="border-top: 1px solid #000; margin-top: 10px; width: 95%; margin-left: 50px;"></div>
	
	<c:forEach var="vo" items="${page.list }">
	<ul style="display: flex; margin-left: 50px; margin-top: 20px; margin-bottom: 20px;">
		<li style="width: 260px;"><a href='detail.ad?id=${vo.id} '>${vo.id}</a></li>
		<li style="width:100px; margin-left: 132px;">${vo.naver_id_chk}</li>
		<li style="width: 100px; margin-left: 236px;">${vo.kakao_id_chk} </li>
		<li style="width:150px; margin-left: 237px;">${vo.join_date}</li>
	</ul>
	<div style="border-top: 1px solid #000; margin-top: 10px; width: 95%; margin-left: 50px; opacity: 0.2;"></div>
	</c:forEach>
	


</div>
</section>
<div class="btnSet">
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>

</body>
</html>