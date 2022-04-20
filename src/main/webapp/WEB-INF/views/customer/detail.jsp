<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> 
	<div id="content"> --%>
	
		<table class="w-pct60">
			<tr>
				<th class="w-pct30">제목</th>
				<td class="w-pct70">${vo.title}</td>
			</tr>
			<tr>
				<th>답변</th>
				<td>${fn:replace( vo.content, crlf, '<br>') }</td>
			</tr>
			<tr>
			<th>첨부파일</th>
			<td colspan="2" class="left">${vo.filename }
				<c:if test="${ ! empty vo.filename }">  <!--파일 있을 때  -->
					<!-- 파일 보이기  -->
					<a id='preview'></a>
					<a href="download.cu?id=${vo.id }" >다운</a>
				</c:if>
			</td>
			</tr>
		</table>
		<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
		<div class="btnSet">
			<a class="btn-fill" href="list.cu">목록</a>
			<!-- <a class="btn-fill" href="new.cu">신규 고객</a>  -->
			<c:if test="${loginInfo.admin eq 'Y'}">
			<a class="btn-fill" href="modify.cu?id=${vo.id}">수정</a>
			<a class="btn-fill" onclick="fnDelete()">삭제</a>
			</c:if>
			
		</div>
	<%-- </div>
	 <jsp:include page="/WEB-INF/views/include/footer.jsp" /> --%>
</body>

<script type="text/javascript">
	function fnDelete() {
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "delete.cu?id=" + ${vo.id}
		}
	}
</script>
</html>