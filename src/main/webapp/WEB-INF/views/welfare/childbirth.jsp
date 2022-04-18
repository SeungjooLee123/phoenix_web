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
table { width: 80%; margin: 0 auto; border: 1px solid; border-collapse: collapse;}
table tr { height: 46px;}
table th, table td {border: 1px solid; padding : 5px 10px;}
table th { background: #f6f6f6;}
table tr td a:hover, ul.grid li a:hover {font-weight: bold; color: coral;}
</style>
</head>
<body>
	<form action="list.wel" method="post">
	<input type="hidden" name="curPage" value="1" />
	<div id = 'list-top'>
		<div>
			<!-- 항목별 검색 처리 -->
			<ul>
				<li>
					<select name="search" class='w-px90'>
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
					</select>
				</li>		
				<li><input type="text" name='keyword' value='${page.keyword }' class='w-px300' /></li>
				<li><a class='btn-fill' onclick="$('form').submit()">검색</a></li>			
			</ul>
			<ul>
				<!-- 관리자로 로그인된 경우만 글쓰기 가능 -->
				<c:if test="${loginInfo.admin eq 'Y' }">
					<li><a class='btn-fill' href='new.wel'>글쓰기</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</form>
	<table>
		<thead>
			<tr>
				<th class='w-px70'>번호</th>
				<th>제목</th>
				<th class='w-px100'>작성자</th>
				<th class='w-px100'>작성일자</th>
				<th class='w-px80'>첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.id }</td>
					<td class='left'>${vo.title }</td>
					<td>${vo.user_id }</td>
					<td>${vo.writedate }</td>
					<td>${empty vo.filename ? '' : '<img src="imgs/attach.png" class="file-img" />' }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class='btnSet'>
		<jsp:include page="/WEB-INF/views/include/page.jsp" />
	</div>
</body>
</html>