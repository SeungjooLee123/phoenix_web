<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
.
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>
<style type="text/css">
.logo_text {
color: #000;
font-weight: 700;
font-size: 16px;
padding: 9px 0px 0px 50px;}
.my_info{
display: flex;
padding: 9px 29px 0px 50px;
position: absolute;
right: 14.3%;
column-gap: 2rem;
font-weight: 700;
}

.footer-wrap {
width: 1300px;
margin-left: 133px;
display: flex;
margin-top: 40px;
font-size: 13px;
color: #888888;
font-weight: 500;
line-height: 1
}

.footer-community{
margin-left: 188px;
}

.footer-share {
margin-left:201px;
}

.footer-cs {
margin-left: 205px;}

footer > h2 {
font-size: 19.5px; color: #000; font-weight: 700;}

.modal{position: absolute !important;}
   .modal-header .close{margin: 0px 0px !important;}
   
table th {
width: 150px;
text-align: left;}   

.list > th, td {
padding: 15px 0;}

.new_btn{
padding: 10px 0;
width: 150px;
font-weight: 700;
display: block;
font-size: 15px;
background: #f0efff;
border-radius: 5px;
cursor: pointer;
text-align: center;}

.back_btn{
cursor: pointer;
margin-left: 20px;
padding: 10px 0;
font-weight: 700;
font-size: 15px;
text-align: center;
background: #f0efff;
width: 62px;
display: block;
border-radius: 5px;}

</style>
</head>
<body>
<section id="detail" style="width: 1100px; margin: 0 auto;">
<form action="replyre" method="post">
<input type="hidden" name="id" value="${vo.id }"/>
<h1 style="margin-top: 38px; padding-bottom: 20px; font-size: 28px;">${vo.user_id }님의 문의내역</h1>
<table class="list" style="border-collapse: collapse; width: 1100px;">
	<tr style="border-bottom: 1px solid #e3e3e3; border-top: 1px solid #000;">
		<th>등록일</th>
			<td>${vo.share_date }</td>
		<th>카테고리</th>
			<td>${vo.category }</td>	
	</tr>
	<tr style="border-bottom: 1px solid #e3e3e3;">
		<th>제목</th>
			<td>${vo.title }</td>
	</tr>
	<tr style="border-bottom: 1px solid #e3e3e3;">
		<th>내용</th>
			<td  style="height: 300px;">${vo.content }</td>
	</tr>
	<tr style="border-bottom: 1px solid #e3e3e3;">
		<th style="padding: 15px 0;">첨부파일</th>
		<c:if test="${! empty vo.filename  }">
		 	<td  style="padding: 15px 0;">${vo.filename }<a href="download.bo?id=${vo.id }"><i class="fa-solid fa-download"></i></a></td>
		 </c:if>
	</tr>
	<tr style="border-bottom: 1px solid #000;">
		<th>답변하기</th>
			<td><textarea title="내용" name="reply" id="summernote" <c:out value="" escapeXml="true"/>></textarea></td>
	</tr>

</table>
<div class="btns" style="display: flex; margin-top: 20px; justify-content: end;">
	<a onclick="$('form').submit()" class="new_btn" style="background: #f0efff;"><i class="fa-solid fa-pencil" style="margin-right: 10px;"></i>답변하기</a>
	<a href="admin" class="back_btn">목록</a>
</div>
</form>



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
    width: 850,
   height: 300,
   lang: "ko-KR",
   tableClassName: function(){
       $(this).addClass('table table-bordered').attr('border', 1).css('borderCollapse', 'collapse');
       $(this).find('td').css('borderColor', '#000');
     }
 
 });

</script>
</body>
</html>