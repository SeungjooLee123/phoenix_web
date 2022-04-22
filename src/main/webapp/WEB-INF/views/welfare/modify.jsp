<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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
	<form action="update.wel" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${vo.id}">
		<table>
			<tr>
				<th class="w-px120">제목</th>
				<td><input type="text" name="title" class="chk" value="${vo.title}" title="제목" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="chk" title="내용" name="content" id="summernote">${vo.content}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td class="left middle">
					<label>
						<input type="file" name="file" id="attach-file" />
						<a class="file-img">업로드</a>
					</label>
					<span id="file-name">${vo.filename}</span>
					<c:if test="${! empty vo.filename }">
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
	<script type="text/javascript">
		$('#summernote').summernote({
		    width: 800,
		   height: 300,
		   lang: "ko-KR",
		      callbacks: {   //여기 부분이 이미지를 첨부하는 부분
		          onImageUpload : function(files) {
		             uploadSummernoteImageFile(files,this);
		          },
		          onPaste: function (e) {
		             var clipboardData = e.originalEvent.clipboardData;
		             if (clipboardData && clipboardData.items && clipboardData.items.length) {
		                var item = clipboardData.items[0];
		                if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
		                   e.preventDefault();
		                }
		             }
		          }
		       }
		 });
		 function uploadSummernoteImageFile(files, editor) {
		    data = new FormData();
		    for(var i = 0 ; i<files.length ; i ++){
		       data.append("file"+i, files[i]);
		    }
		    data.append("length",files.length);
		    $.ajax({
		       enctype: 'multipart/form-data', 
		       data : data,
		       type : "POST",
		       url : "insert.te",
		       contentType : false,
		       processData : false,
		       success : function(data) {
		             //항상 업로드된 파일의 url이 있어야 한다.
		          for(var i = 0 ; i<data.length ; i ++){
		             $(editor).summernote('insertImage', data[i]);
		          }
		       }
		    });
		 }
		$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
		$("#cate-ul li>a").eq(0).attr("class", "btn-fill");
	</script>
</body>
</html>