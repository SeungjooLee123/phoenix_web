<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<style type="text/css">
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
		<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> 
	<div id="content"> --%>
		<h3>신규 고객 입력</h3>
		<form action="insert.cu" method="post" enctype="multipart/form-data">
			<table class="w-pct50">
				<tr>
					<th>제목</th>
					<td>
						<input class='chk' title='제목' type="text" name="title" />
					</td>
				</tr>
				<tr>
					<th>문의사항</th>
					<td><input class='chk' title='문의사항' type="text" name="content" /></td>
				</tr>
				<tr>
				<th>첨부파일</th>
				<td class="left middle" >
					<label>
						<input type="file" name="file" id="attach-file" />
						<a><img src="imgs/select.png" class="file-img"></a>
					</label>
					<span id="file-name"></span>
					<%-- 이미지 파일 미리보기 적용 --%>
					<span id="preview"></span>
					<a id="delete-file">삭제</a>
				</td>
			</tr>
			</table>
		</form>
		<div class="btnSet">
		<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
			<a class="btn-fill" onclick="if( emptyCheck() ) $('form').submit()">저장</a>
			<a class="btn-empty" href="list.cu">취소</a>
		</div>
	<%-- </div>
	 <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
	 <script src="js/file_check.js?v<%=new Date().getTime() %>" ></script>	<%-- java.util의 date --%>
</body>
</html>