<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#tabs > li {
font-weight:700;
display: block;
padding: 6px 107px;
border: 1px solid #000;}

</style>


<body>
<section id="container" style="width:1300px; margin: 0 auto;">


<form action="admin" method="post">
<input type="hidden" name="category">
	<ul id="tabs" style="display: flex; justify-content: center;">
	<li id='nomal'>일반문의</li>
	<li id='app'>어플리케이션</li>
	<li id='web'>BSS 웹</li>
	<li id='account'>계정문의</li>
</ul>

</form>

<table>
<thead>
	<tr>
		<th>번호</th>
		<th>분류</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>상태</th>
		<th>등록일</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="vo">
	<tbody>
	<tr>
		<td>${vo.id }</td>
		<td>${vo.category}</td>
		<td>${vo.title }</td>
		<td>${vo.user_id}</td>
		<td>${vo.reply_chk }</td>
		<td>${vo.share_date }</td>
	</tr>
	</tbody>
	</c:forEach>
</table>
	
</section>

<script type="text/javascript">
$(document).on('click', '#tabs li', function () {
	var idx = $(this).index();
	if(idx==0) $('input[name=category]').val('nomal');
	else if(idx==1) $('input[name=category]').val('app');
	else if(idx==2) $('input[name=category]').val('web');
	else $('input[name=category]').val('account');
	
	 $('form').submit();
});
</script>

</body>
</html>