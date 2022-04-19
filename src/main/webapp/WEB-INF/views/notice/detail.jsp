<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
table{
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse;
}
table tr{
	height: 46px;
}
table th, table td{
	border : 1px solid;
	padding: 5px 10px;
}
table th{
	background: #f6f6f6;
}
.btnSet{
	margin-top: 20px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>방명록 안내</h3>	
	<table>
		<tr>
			<th class="w-px120">제목</th>
			<td colspan="5" class="left">${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.user_id }</td>
			<th class="w-px120">작성일자</th>
			<td class="w-px120">${vo.noti_date }</td>
			<th class="w-px80">조회수</th>
			<td class="w-px80">${vo.cnt }</td>
		</tr>
	    <tr>
			<th>내용</th>
			<td colspan="5" class="left">${fn:replace( vo.content, crlf, '<br>') }</td>   <!-- 띄어 쓰기 모델로 넘겨받아서  EL로 받음 -->
		</tr>	
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="left">${vo.filename }
				<c:if test="${ ! empty vo.filename }">  <!--파일 있을 때  -->
				<!-- 파일 보이기  -->
				<a id='preview'></a>
				<a href="download.no?id=${vo.id }" >다운</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td class='left' colspan="6">
				<c:if test="${vo.prev ne 0 }">
					<a href='detail.no?id=${vo.prev }'>[이전 글] ${vo.prev_title }</a> <br />
				</c:if>
				<c:if test="${vo.next ne 0 }">
					<a href='detail.no?id=${vo.next }'>[다음 글] ${vo.next_title }</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	<div class="btnSet">
		<a class="btn-fill" onclick="$('form').submit()" >목록으로</a>
		<%-- 글쓴이만 수정 삭제 권한을 가질 수 있으므로 비교 먼저 해야 함 --%>
		<c:if test="${loginInfo.id eq vo.user_id}">
			<a class="btn-fill" onclick="$('form').attr('action', 'modify.no'); $('form').submit()">수정하기</a>
			<a class="btn-fill" onclick='if(confirm("정말 삭제?")) {href="delete.no?id=${vo.id}"}'>삭제하기</a>
		</c:if>
	</div>
	
	
	<form action="list.no" method="post">
		<input type="hidden" name="id" value="${vo.id}" /> <%-- 검색 조건 --%>
		<input type="hidden" name="search" value="${page.search}" /> <%-- 검색 조건 --%>
		<input type="hidden" name="keyword" value="${page.keyword}" /> <%-- 검색어 --%>
		<input type="hidden" name="pageList" value="${page.pageList}" /> <%-- 페이지당 보여질 목록 수 --%>
		<input type="hidden" name="curPage" value="${page.curPage}" /> <%-- 현재페이지 --%>
	</form>
	
	
	<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
	
</body>
</html>