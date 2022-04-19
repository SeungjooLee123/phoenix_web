<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
<script type="text/javascript">
	$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
	$("#cate-ul li>a").eq(2).attr("class", "btn-fill");
</script>
</body>
</html>