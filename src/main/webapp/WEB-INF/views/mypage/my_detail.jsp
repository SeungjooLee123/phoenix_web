<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table th {
width: 150px;
text-align: left;}



.list > th, td {
padding: 15px 0;}

.list >.sub {
border-bottom: 1px solid #000;
height: 500px;
}

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
<section id="my_container" style="width: 1100px; margin: 0 auto;">
<h3 style="margin-top:50px;">내 문의내역</h3>
<p style="color: #888888;">최근 접수하신 문의내역 및 답변 내용을 확인하실 수 있습니다.</p>
	<p style="color: #888888; margin-top: 50px; font-size: 13px; padding-bottom: 10px;">※ 문의 내용 중 개인정보가 포함되었거나 중복된 문의인 경우 삭제될 수 있습니다.</p>
<table class="list" style="border-collapse: collapse; width: 1100px;" >
	<tr class="tr1" style="border-bottom: 1px solid #e3e3e3; border-top: 1px solid #000;">
		<th>등록일</th>
			<td>${vo.share_date }</td>
		<th>답변여부</th>
			<td>${vo.reply_chk }</td>
	</tr>
	<tr style="border-bottom: 1px solid #e3e3e3;">
		<th>제목</th>
			<td>${vo.title }</td>
	</tr>
	<tr style="border-bottom: 1px solid #e3e3e3;">
		<th>내용</th>
			<td style="height: 300px;">${vo.content}</td>
	</tr>
	<tr  style="border-bottom: 1px solid #e3e3e3;">
		<th style="padding: 15px 0;">첨부파일</th>
		<td style="padding: 15px 0;">${vo.filename}</td>
	</tr>
	<tr style="border-bottom: 1px solid #000;">
		<th>답변</th>
		<td class="sub" style="height: 300px;">${vo.reply}</td>
	</tr>
</table>
<div class="btns" style="display: flex; margin-top: 20px; justify-content: end;">
	<a href="new.cu" class="new_btn"><i class="fa-solid fa-pencil" style="margin-right: 10px;"></i>새로운 문의</a>
	<a href="mypage" class="back_btn">목록</a>
</div>


</section>
</body>
</html>