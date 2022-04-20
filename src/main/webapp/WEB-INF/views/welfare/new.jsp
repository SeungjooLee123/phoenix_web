<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src='js/file_check.js'></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
<!-- 파일 첨부하여 submit() 하는 경우
	1. method 는 post 로 지정
	2. enctype='multipart/form-data'  지정 -->
<form action="insert.wel" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th class='w-px120'>제목</th>
		<td>
			<input type="text" name="title" class='chk' title='제목' />
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" class='chk' title="내용"></textarea>
		</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td class='left'>
			<label>
				<a><img src='imgs/select.png' class='file-img' /></a>
				<input type="file" id='attach-file' name='file' />
			</label>
			<span id='file-name'></span>
			<a id='delete-file'><i class="fa-solid fa-circle-xmark"></i></a>
		</td>
	</tr>
</table>
<input type="hidden" id="category" name = "category" value="${category }"/>
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick="if ( emptyCheck() ) $('form').submit() ">저장하기</a>
	<a class='btn-empty' href='list.wel'>취소</a>
</div>
	<script type="text/javascript">
		if($("#category").val() == 'childbirth'){
			$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
			$("#cate-ul li>a").eq(0).attr("class", "btn-fill");
		} else{
			$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
			$("#cate-ul li>a").eq(1).attr("class", "btn-fill");
		}
		
	</script>
</body>
</html>