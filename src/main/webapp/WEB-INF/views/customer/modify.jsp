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
	<form action="update.cu" method="post">
	<input type="hidden" name="id" value="${vo.id}">
		<table class="w-pct50">
			<tr>
				<th class="w-pct30">제목</th>
				<td>
					<input type="text" class='chk' title='제목' name="title" value="${vo.title}" />		
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" class='chk' title='제목' name="content" value="${vo.content}" /></td>
			</tr>
		</table>
	</form>
	<div class="btnSet">
	<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
		<a class="btn-fill" onclick="if( emptyCheck() ) $('form').submit()">저장</a>
		<a class="btn-empty" href="detail.cu?id=${vo.id}">취소</a>
	</div>
	<%-- </div>
	 <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>
</html>