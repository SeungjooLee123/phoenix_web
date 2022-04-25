<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="list.qu" method="post">

<div id="list-top" style="padding: 20px 10px;">
		<div>
		<!-- 항목별 검색 처리 -->
		<ul>
			<li>
			<!-- search라는 이름으로 value가 감 -->
				<select name="search">
					<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
					<option value="nomal" ${page.search eq 'nomal' ? 'selected' : '' }>일발문의</option>
					<option value="app" ${page.search eq 'app' ? 'selected' : '' }>어플리케이션</option>
					<option value="web" ${page.search eq 'web' ? 'selected' : '' }>BSS 웹</option>
					<option value="account" ${page.search eq 'account' ? 'selected' : '' }>계정문의</option>
				</select>
			</li>
			<li><input type="text" name="keyword" value="${page.keyword }"/></li>
			<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>
				
			
		</ul>
		<ul>
			<!-- 관리자로 로그인된 경우만 글쓰기 가능 -->
			<c:if test="${loginInfo.admin eq 'Y' }">
				<li><a class="btn-fill" href="new.no">글쓰기</a></li>
			</c:if>
		</ul>
	</div>

</div>


</form>
</body>
</html>