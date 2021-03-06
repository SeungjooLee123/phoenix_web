<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#main_content{list-style: none;}
	.list a{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
	table th td{text-align: center;}
	table th{font-size: 20px; padding-bottom: 20px;}
</style>
</head>
<body>
<div style="display: flex; width: 1300px; margin: 0 auto;">
	<div><jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/></div>
	
	<div id="main_content" style="width: 1050px; margin-left: 95px; margin-top: 25px;">
		<table style="margin: 30px auto;">
		<tr>
			<th>${vo.title }</th>
		</tr>
		<tr>
			<td>${vo.content }</td>
		</tr>
		<tr>
			<td style="padding-top: 60px;">
				<c:if test="${!empty vo.filename }">
					<a href="download.wel?id=${vo.id }"><i class="fas fa-download font-img" ></i> ${vo.filename }</a>
				</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${loginInfo.admin eq 'Y' }">
			<ul style="display: flex; float: right; margin-top: 50px;">
				<li style="margin-right: 20px; border-right: 1px solid rgba(0, 0, 0, 0.1);"><a style="font-weight: 700; margin-right: 30px;" href="modify.wel?id=${vo.id }">수정</a></li>
				<li style="margin-left: 10px;"><a style="font-weight: 700; "  href="delete.wel?id=${vo.id }">삭제</a></li>
			</ul>
      </c:if>
	</div>
</div>
</body>
</html>