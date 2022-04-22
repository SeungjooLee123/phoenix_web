<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">

#tabs li.active { color: red;}
table{
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse;
}
table tr{
	height: 46px;
}
table th, table td{
	border : 1px solid;
	padding: 5px 10px;
}
table th{
	background: #f6f6f6;
}
.btnSet{
	margin-top: 20px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="container" style="width:1300px; display:flex; margin: 0 auto; ">
	<div>
		<h3>베시시</h3>
		<form action="list.cu" method="post">
			<input type="hidden" name="category">
			<ul id='tabs'>
				<li id='nomal'>일반문의</li>
				<li id='app'>어플리케이션</li>
				<li id='web'>BSS 웹</li>
				<li id='account'>계정/로그인/탈퇴</li>
			</ul>
		</form>
	</div>
	<hr class='list_hr'>
	<div>
		<h3>유용한 도움말</h3>
		<table class="w-pct60">
			<tr>
				<th class="w-pct10">번호</th>
				<th class="w-pct30">제목</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.no}</td>
					<td><a href='detail.cu?id=${vo.id}'>${vo.title}</a></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${! empty loginInfo}">
			<a class="btn-fill" href="new.cu">문의하기</a>
		</c:if>
	</div>
</section>
</body>
<script type="text/javascript">
$(function () {
	var cate = '#'+'${cu_category}';
	$(cate).addClass('active');
})

$(document).on('click', '#tabs li', function () {
	var idx = $(this).index();
	//alert(idx);
	
	if(idx==0) $('input[name=category]').val('nomal');
	else if(idx==1) $('input[name=category]').val('app');
	else if(idx==2) $('input[name=category]').val('web');
	else $('input[name=category]').val('account');
	
	 $('form').submit();
})

</script>
</html>