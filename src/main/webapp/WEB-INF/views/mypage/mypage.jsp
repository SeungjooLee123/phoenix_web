<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
</head>
<body>
<section id="my" style="width: 1300px; margin: 0 auto;">

<div style="margin-top: 50px; text-align: center;">
	<img src="imgs/admin_my.png">
</div>

<h1 style="text-align: center; margin-bottom: 50px;">나의 문의내역</h1>

<table class="list" style="text-align: center; margin: 0 auto; width: 1100px; border-top: 1px solid #000; padding-top: 10px;">
<thead>
	<tr>
		<th>서비스분류</th>
		<th>제목</th>
		<th>작성자</th>
		<th>답변여부</th>
		<th>작성일</th>
	</tr>
	</thead>
	<c:forEach items="${list}" var="vo">
	<tbody>
	<tr>
		<td>${vo.category}</td>
		<td style="text-align: left;"><a href="my_detail?id=${vo.id }">${vo.title }</a></td>
		<td>${vo.user_id}</td>
		<td>${vo.reply_chk }</td>
		<td>${vo.share_date }</td>
	</tr>
	</tbody>
	</c:forEach>
</table>
</section>
</body>
</html>