<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
<table>
	<tr>
		<th class='w-px120'>제목</th>
		<td class='left' colspan='5'>${vo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${vo.user_id }</td>
		<th class='w-px100'>작성일자</th>
		<td>${vo.wel_date }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td class='left' colspan='5'>${fn:replace(vo.content, crlf, '<br>') }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td class='left' colspan='5'>${vo.filename }
			<c:if test="${ ! empty vo.filename }">
				<a href='download.wel?id=${vo.id }'><i class="fa-solid fa-floppy-disk"></i></a>
			</c:if>		
		</td>
	</tr>
</table>
<div class='btnSet'>
	<a class='btn-fill' href='list.wel?curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'>목록으로</a>
	<!-- 목록 버튼 클릭시 현재 선택한 페이지값과 검색 항목 그리고 키워드를 가진 상태에서 목록 화면으로 이동 -->
	
	<c:if test="${vo.user_id eq loginInfo.id }">
		<a class='btn-fill' href='modify.wel?id=${vo.id }'>수정</a>
		<a class='btn-fill' onclick =" if( confirm('정말 삭제?') ) { href='delete.wel?id=${vo.id }' }">삭제</a>
	</c:if>
</div>
<script type="text/javascript">
	$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
	$("#cate-ul li>a").eq(0).attr("class", "btn-fill");
</script>
</body>
</html>