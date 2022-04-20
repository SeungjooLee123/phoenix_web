<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
table {
	width: 80%;
	margin: 0 auto;
}
form {

}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="insert.co" method="post" enctype="multipart/form-data" >
			<!-- 이게잇어야지 controller에서 multipart사용가능 -->
			<table>
				<tr>
					<th class="w-px120">제목</th>
					<td class="left">
						<input type="text" name="title" title="제목" class="chk">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<th><textarea name="content" class="chk" title="내용"></textarea></th>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td class="left middle">
						<label>
							<input type="file" name="file" id="attach-file" /> 
							<a><img src="imgs/select.png" class="file-img" /></a>
						</label>
						<span id="file-name"></span>
						<!-- 이미지 파일 미리보기 적용 -->
						<span id="preview"></span>
						<a id="delete-file"><i class="font-img fas fa-minus-circle"></i></a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btnSet">
	<script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
	<a class="btn-fill"  onclick=" if ( emptyCheck() ) $('form').submit() " >저장</a>
	<a class="btn-empty"  >취소</a>
</div>

<script type="text/javascript" src="js/file_check.js?v<%=new Date().getTime()%> "></script><!-- 파일첨부 이름 보여주는 -->

</body>
</html>