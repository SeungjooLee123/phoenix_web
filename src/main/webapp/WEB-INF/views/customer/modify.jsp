<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<style type="text/css">
table{
	border-collapse: collapse;
	margin: 10px;
}
table, tr, td{
	border : none;
}
table th{
	width: 150px;
	padding: 10px 0;
	text-align: left;
}
table td{
	width: 650px;
	padding: 10px 0;
}
.btnSet{
	margin-top: 20px;
	display: flex;
	float: right;
}
.btn_style{
	display: block;
	font-size: 15px;
	background: #f5f5f5;
	cursor: pointer;
	text-align: center; 
	padding: 10px 13px;}
.btn_fill{
	font-weight: 700;
	display: block;
	font-size: 15px;
	background: #c3bfff;
	cursor: pointer;
	text-align: center; 
	padding: 10px 30px;
	margin-right: 10px;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="container" style="width:820px; margin: 0 auto;">
	<form action="update.cu" method="post">
	<h1 style="margin: 50px 0;">문의 수정</h1>
	<hr style="opacity: 0.7; height: 2px; background: #000; border: 0px; margin: 20px 0;">
	<input type="hidden" name="id" value="${vo.id}">
		<table>
			<tr>
				<th>문의분류</th>
				<td>
					<select id="body" name="category" style="width: 280px; height: 38px; font-size: 15px; margin-left: 20px;">
						<option value="nomal" selected="selected">일반문의</option>
						<option value="app">어플리케이션</option>
						<option value="web">BSS 웹</option>
						<option value="account">계정/로그인/탈퇴</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" class='chk' title='제목' name="title" value="${vo.title}" style="width: 620px; height: 38px; font-size: 15px; margin-left: 20px;"/>		
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class='chk' title='제목' name="content" style="width: 620px; height: 260px; font-size: 15px; margin-left: 20px;">${vo.content}</textarea></td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
	<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
		<a class="btn_fill" class="btn-fill" onclick="if( emptyCheck() ) $('form').submit()">저장</a>
		<a class="btn_style" href="list.cu">취소</a>
	</div>
</div>
</body>
</html>