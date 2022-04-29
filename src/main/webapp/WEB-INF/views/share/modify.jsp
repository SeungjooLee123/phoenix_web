<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.chk{
	width: calc(100% - 24px);
}
.tbl{
	margin-top: 40px;
}
.file-img { width: 20px; height: 18px; }
#preview {height: 36px; display: inline-block;}
#preview-img{ max-height: 34px;}
input[type=file], #delete-file { display: none;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="update.sh" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id}">
		<table class="tbl">
			<tr>
				<th class="w-px120">제목</th>
				<td><input type="text" name="title" class="chk" value="${vo.title}" title="제목" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="chk" title="내용" >${vo.content}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left middle">
					<label>
						<input type="file" name="file" id="attach-file" />
						<a class="file-img">업로드</a>
					</label>
					<span id="file-name">${vo.web_file}</span>
					<c:if test="${! empty vo.web_file}">
						<!-- 파일 보이기  -->
						<span id='preview'></span>
						<a id="delete-file" style="display: inline;">삭제</a>
					</c:if>
				</td>
			</tr>
		</table>
		<input type="hidden" name="attach"/>  <%-- 첨부파일에 대한 정보를 숨겨서 가져갈 예정 --%>
	</form>
	<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
	<div class="btnSet">
		<a class="btn-fill" style="cursor: pointer;" onclick="if( emptyCheck() ){ $( '[name=attach]' ).val( $('#file-name').text() ); $('form').submit() }">저장</a>
		<a class="btn-empty" onclick="history.go(-1)">취소</a>
	</div>
	<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
</body>
</html>