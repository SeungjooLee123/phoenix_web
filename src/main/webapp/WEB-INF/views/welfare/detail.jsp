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
</style>
</head>
<body>
<div style="display: flex; width: 1300px; margin: 0 auto;">
	<div><jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/></div>
	<div id="main_content" style="width: 1050px; margin-left: 95px; margin-top: 50px;">
		${vo.content }
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