<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<title>Community</title>
</head>
<body>
<img src="imgs/bss_ad_pick.png" style="width:70%; height:300px; display: block; margin: auto; padding: 50px;">
<div style="text-align: center;">
	<table style="margin: 0 auto; border: 1px solid; width: 80%; ">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>첨부파일</th>
			</tr>
		</thead>
		<tbody>
		<!-- 조회된 목록이 없을 경우 정보 표시 -->
		<c:if test="${ empty page.list }">
			<tr>
				<td colspan="6">방명록 정보가 없습니다.</td>
			</tr>
		</c:if>
			<c:forEach items="${page.list}" var="vo">
				<tr>
					<td>${vo.no}</td>
					<td class="left"><a onclick='go_detail(${vo.id})'>${vo.title}</a></td>
					<%-- <td class='left'><a onclick='go_detail(${vo.id})'>${vo.title }</a></td> --%>
					<td>${vo.name}</td>
					<td>${vo.writedate}</td>
					<td>${vo.readcnt}</td>
					<td>${empty vo.filename ? '' : '<img src="imgs/attach.png" class="file-img" />'}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<br>
</body>
</html>