<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>
</head>
<body>
<section id="detail" style="width: 1300px; margin: 0 auto;">
<form action="replyre" method="post">
<input type="hidden" name="id" value="${vo.id }"/>
<h1 style="margin-top: 50px; margin-left: 50px;">${vo.user_id }님의 문의내역</h1>
<div style="border-top: 1px solid #000;"></div>

<h3>${vo.share_date }</h3>
<h3>${vo.category }</h3>
<h3>${vo.title }</h3>
<h3>${vo.content }</h3>
<c:if test="${ ! empty vo.filename }">
	<h3>${vo.filename }</h3>
	<a href="download.bo?id=${vo.id }"><i class="fa-solid fa-download"></i></a>
</c:if>
<h3>${vo.id} </h3>

<div>
<h3>답변하기</h3>
	<textarea title="내용" name="reply" id="summernote" <c:out value="" escapeXml="true"/>></textarea>
</div>
<a onclick="$('form').submit()">전송하기</a>
</form>
<a href='admin'>목록으로</a>


</section>
<script type="text/javascript">
$(function name() {
	if(${! empty vo.filename}) { 
		if( isImage('${vo.filename}') ) {   
			$('#preview').html("<img src='${vo.filepath}' id='preview-img'/>"); 
		}
	}
});

$('#summernote').summernote({
    width: 1300,
   height: 300,
   lang: "ko-KR"
 
 });

</script>
</body>
</html>