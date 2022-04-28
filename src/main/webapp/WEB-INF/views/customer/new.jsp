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
	background: #f0efff;
	border-radius: 5px;
	cursor: pointer;
	text-align: center; 
	padding: 10px 30px;
	margin-right: 10px;}
.line{
	border-bottom: 1px solid;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container" style="width:820px; margin: 0 auto;">
		<h1 style="margin-top: 65px; margin-bottom: 30px;">문의하기</h1>
		<hr style="opacity: 0.7; height: 2px; background: #000; border: 0px; margin: 20px 0;">
		<form action="insert.cu" method="post" enctype="multipart/form-data">
			<table>
				<tr class="line">
					<th>문의 분류 *</th>
					<td>
						<select id="body" name="category" style="width: 280px; height: 38px; font-size: 15px; margin-left: 20px; padding: 5px;">
							<option value="nomal" selected="selected">일반문의</option>
							<option value="app">어플리케이션</option>
							<option value="web">BSS 웹</option>
							<option value="account">계정/로그인/탈퇴</option>
						</select>
					</td>
				</tr >
				<tr class="line">
					<th>제목 *</th>
					<td>
						<input class='chk' title='제목' type="text" name="title" style="width: 620px; height: 38px; font-size: 15px; margin-left: 20px;"/>
					</td>
				</tr>
				<tr class="line">
					<th>문의 내용 *</th>
					<td><textarea class='chk' title='문의사항' name="content" style="width: 620px; height: 260px; font-size: 15px; margin-left: 20px;"></textarea></td>
				</tr>
				<tr>
				<th>파일 첨부</th>
				<td class="left middle" >
					<label style=" margin-left: 20px;">
						<input type="file" name="file" id="attach-file" />
						<a><img src="imgs/select.png" class="file-img"></a>
					</label>
					<span id="file-name"></span>
					<%-- 이미지 파일 미리보기 적용 --%>
					<span id="preview"></span>
					<a id="delete-file" style="display:none;">삭제</a>
				</td>
			</tr>
			</table>
		</form>
		<div style="border-top: solid 3px #000; opacity: 0.7; margin: 20px 0;"></div>
		<div class="btnSet">
		<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
			<a class="btn_fill" onclick="if( emptyCheck() ) $('form').submit()"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;문의접수</a>
			<a class="btn_style" href="list.cu">취소</a>
		</div>
	</div>
	 <script src="js/file_check.js?v<%=new Date().getTime() %>" ></script>	<%-- java.util의 date --%>
</body>
</html>