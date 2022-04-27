<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.list > tbody > .tr1 {
padding-bottom: 10px;
border-top: 1px solid #000;
}

.list > tr > tbody > td {
padding-bottom: 10px;
padding-top: 10px;
border-bottom: 1px solid #000;
}

.list > tr >  tbead > td {
padding-bottom: 10px;
padding-top: 10px;
border-bottom: 1px solid #000;
}

</style>



</head>
<body>
<section id="my_container" style="width: 1300px; margin: 0 auto;">
<h3 style="margin-top:50px;">내 문의내역</h3>
<p style="color: #888888;">최근 접수하신 문의내역 및 답변 내용을 확인하실 수 있습니다.</p>
	<p style="color: #888888; margin-top: 50px; font-size: 13px;">※ 문의 내용 중 개인정보가 포함되었거나 중복된 문의인 경우 삭제될 수 있습니다.</p>
<table class="list">
	<tr class="tr1">
		<th>등록일</th>
			<td>${vo.share_date }</td>
		<th>답변여부</th>
			<td>${vo.reply_chk }</td>
	</tr>
	<tr>
		<th>제목</th>
			<td>${vo.title }</td>
	</tr>
	<tr>
		<th>내용</th>
			<td>${vo.content}</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>${vo.filename}</td>
	</tr>
	<tr>
		<th>답변</th>
		<td>${vo.reply}</td>
	</tr>

</table>


</section>
</body>
</html>