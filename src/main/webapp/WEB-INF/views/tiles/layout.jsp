<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tiles 라이브러리를 사용할 수 있도록 선언 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${category eq 'no' }"><c:set var='title' value="공지사항"/></c:when> 
	<c:when test="${category eq 'hr' }"><c:set var='title' value="사원목록"/></c:when>	
	<c:when test="${category eq 'co' }"><c:set var='title' value="커뮤니티"/></c:when>	
	<c:when test="${category eq 'bo' }"><c:set var='title' value="방명록"/></c:when>	
	<c:when test="${category eq 'da' }"><c:set var='title' value="공공 데이터"/></c:when>	
	<c:when test="${category eq 'join' }"><c:set var='title' value="회원가입"/></c:when>
</c:choose>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<style type="text/css">
	#wrap {display: flex; flex-direction: column;}
	/* flex 방향 지정 flex-dircetion : column (가로) */
	#content {width: 1440px; margin:0 auto; padding-top: 10%;}

</style>
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<!-- jQuery 연결 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="wrap">
		<tiles:insertAttribute name="header" />
		
		
		<!-- 타일 조각을 붙일 파일(view)  -->
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
			<tiles:insertAttribute name="footer" />
	
	</div>
</body>
</html>