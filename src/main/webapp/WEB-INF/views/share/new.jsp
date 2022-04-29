<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
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
	<h3>방명록 글쓰기</h3>
	<form action="insert.sh" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="w-px120">제목</th>
				<td class="left">
					<input type="text" name="title" title="제목" class="chk" />
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" class="chk" title="내용"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left middle" >
					<label>
						<input type="file" name="file" id="attach-file" />
						<a><img src="imgs/select.png" class="file-img"></a>
					</label>
					<span id="file-name"></span>
					<%-- 이미지 파일 미리보기 적용 --%>
					<span id="preview"></span>
					<a id="delete-file"><i class="fa-solid fa-circle-minus"></i></a>
				</td>
			</tr>
		</table>
	</form>
		<div class="btnSet">
		<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
		<a class="btn-fill" onclick="if( emptyCheck() ) $('form').submit()">저장하기</a>
		<a class="btn-empty" href="list.sh">취소하기</a>
	</div>
	<script src="js/file_check.js?v<%=new Date().getTime() %>" ></script>	<%-- java.util의 date --%>
</body>
</html>