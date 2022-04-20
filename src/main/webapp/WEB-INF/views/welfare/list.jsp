<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<style type="text/css">
body{width:1440px; margin:0 auto;}
.title_list{width:20%; float:left;}
.content_main{width:80%; float:right;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
	<div class="title_list">
		<h3>타이틀</h3>
	</div>
	<div class="content_main">
		<h3>내용</h3>
	</div>
</body>
</html>