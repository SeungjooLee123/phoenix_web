<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#tabs > li {
font-weight:600;
display: block;
padding: 10px;
margin-top: 20px;
cursor: pointer;
color: #888888;}

#tabs > li:hover {
color: #000;
border-bottom: 2px solid #c3bfff;
}

.list {
	border-spacing:0;
}

.list > thead > tr > th {
padding-bottom: 10px;
border-bottom: 1px solid #000;
}

.list > tbody > tr > td {
padding-bottom: 10px;
padding-top: 10px;
border-bottom: 1px solid #000;
}

tbody:hover {
background: rgba(195, 191, 255, .45);
}

</style>


<body>
<section id="container" style="width:1300px; margin: 0 auto;">
<div style="margin-top: 50px; text-align: center;">
	<img src="imgs/admin_q&a.png">
</div>

<div style="width: 1300px; margin-bottom: 70px;">
<form action="admin" method="post">
<input type="hidden" name="category">
	<ul id='tabs' style="display: flex; justify-content: center;">
	<li id='normal'>일반문의</li>
	<li id='app'>어플리케이션</li>
	<li id='web'>BSS 웹</li>
	<li id='account'>계정문의</li>
</ul>

</form>
</div>
<table class="list" style="text-align: center; margin: 0 auto; width: 1100px; border-top: 1px solid #000; padding-top: 10px;">
<thead>
	<tr>
		<th>번호</th>
		<th>서비스분류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>답변여부</th>
		<th>등록일</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="vo">
	<tbody>
	<tr>
		<td>${vo.id }</td>
		<td>${vo.category}</td>
		<td style="text-align: left;"><a href="detail.ad?title=${vo.title} ">${vo.title }</a></td>
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

	
	if(idx==0) $('input[name=category]').val('normal');
	else if(idx==1) $('input[name=category]').val('app');
	else if(idx==2) $('input[name=category]').val('web');
	else $('input[name=category]').val('account');
	
	 $('form').submit();
});
</script>

</body>
</html>