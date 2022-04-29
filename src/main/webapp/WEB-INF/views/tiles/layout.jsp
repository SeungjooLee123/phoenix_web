<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- tiles 라이브러리를 사용할 수 있도록 선언 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${category eq '' }"><c:set var="title" value="베시시"/> </c:when>
	<c:when test="${category eq 'ca' }"><c:set var='title' value="이벤트"/></c:when> 
	<c:when test="${category eq 'we' }"><c:set var='title' value="육아정보"/></c:when>	
	<c:when test="${category eq 'co' }"><c:set var='title' value="커뮤니티"/></c:when>	
	<c:when test="${category eq 'sh' }"><c:set var='title' value="나눔하기"/></c:when>	
	<c:when test="${category eq 'cs' }"><c:set var='title' value="고객센터"/></c:when>	
	<c:when test="${category eq 'ad' }"><c:set var='title' value="관리자"/></c:when>	
</c:choose>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<style type="text/css">
	#wrap {display: flex; flex-direction: column; width:1440px; margin: 0 auto;}
	/* flex 방향 지정 flex-dircetion : column (가로) */
	/* header가 떠있기 때문에 content에서 윗부분 공간 만듬 */
	#content {width: 1440px; margin:0 auto; padding-top: 10.5%;}

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