<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<%-- </div>
	 <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
	 
	 <c:if test="${! empty loginInfo}">
			<a class="btn-fill" href="new.cu">문의하기</a>
	</c:if>
	
</body>
</html>