<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
div #list-top ul {
	margin: 0 auto;
	display: flex;
    justify-content: center;
    text-align: center;
    height: 54px;
    width: 1300px;
}

</style>
<head>
<meta charset="UTF-8">
<title>Community</title>
</head>
<body>
<img src="imgs/bss_event_img.jpg" style="width: 1440px; height: 400px; margin: 50px auto; ">

<form action="community" method="post" id="btns" >
		<input type="hidden" name="curPage" value="1" />
		<input type="hidden" name="id" /><%-- detail에 보내질 id --%>
		<div id="list-top">
			<%-- 항목별 검색처리 --%>
			<ul style="align-items: center;">
				<li>
					<select name="search" style="width: 100px; height: 50px; text-align: center; font-size: 18px; font-weight: 700;  margin-right: 25px;">
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
						<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</li>
				<c:if test="${page.keyword eq 'all'}">
					<li><input style="width: 600px; height: 50px; text-align: center; font-size: 18px; font-weight: 700; margin-right: 25px;" type="text" name="keyword" ></li>
				</c:if>
				<c:if test="${page.keyword ne 'all'}">
						<li><input type="text" name="keyword" value="${page.keyword}" style="width: 600px; height: 50px; margin-right: 25px; " /></li>
				</c:if>
				<li style=" width: 100px; background: #f0efff; text-align: center; padding: 15px 0 15px 0; font-weight: 700; font-size: 18px;" ><a onclick="$('form').submit()"  >검색</a></li>
			</ul>
			<ul>
				<c:if test="${loginInfo.admin eq 'Y'}">
					<li><a class="btn_style" href="new.co">글쓰기</a></li>
				</c:if>		
			</ul>
		</div>
	</form>
<div style="text-align: center;">
	<table style="margin: 0 auto; border: 1px solid; width: 80%; ">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th class="t-attach">첨부파일</th>
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
					<td>${vo.id}</td>
					<td class="left"><a onclick='go_detail(${vo.id})'>${vo.title}</a></td>
					<td>${vo.user_id}</td>
					<td>${vo.web_date}</td>
					<td>${vo.cnt}</td>
					<td>${empty vo.web_file ? '' : '<img src="imgs/attach2.png" class="file-img" />'}</td>
				</tr>
			</c:forEach>  
		</tbody>
	</table>
<!--  -->
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />	
	</div>
	
</div>

<br>
<script type="text/javascript">
		function go_detail(id) {
			$('[name=id]').val(id);
			$('form').attr('action', 'detail.co');
			$('form').submit();
		}
	</script>
</body>
</html>