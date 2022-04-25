<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">

#tabs li.active { color: red;}
#tabs li{
	margin: 10px 10px;
}
.question{
	display: flex;
	margin: 20px 10px;
}
.answer {
	display: none;
	margin-left: 60px;
}
.qna-wrap{
	width: 750px;
	margin: 0 auto;
}
.qna_list{
	margin: 50px 0;
}
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
.btn_style{
display: block;
 font-size: 15px;
  background: #f5f5f5;
   cursor: pointer;
    text-align: center; 
    margin: 0 10px; padding: 10px 13px;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="container" style="width:1300px; display:flex; margin: 0 auto; ">
	<div style="width: 230px;">
		<h3 style="margin: 50px 0px;">베시시</h3>
		<form action="list.cu" method="post">
			<input type="hidden" name="category">
			<ul id='tabs'>
				<li id='nomal' >일반문의</li>
				<li id='app'>어플리케이션</li>
				<li id='web'>BSS 웹</li>
				<li id='account'>계정/로그인/탈퇴</li>
			</ul>
		</form>
	</div>
	<hr class='list_hr'>
	<div style="width: 1070px;">
	<div class="qna-wrap" >
		<h1  style="margin: 50px 0;">유용한 도움말</h1>
		
		<hr  style="opacity: 0.7; height: 2px; background: #000; border: 0px;"/>
		<div class='li_title' style="margin: 20px 20px;">일반문의</div>
		<div style="border-top: solid 3px #000; opacity: 0.7;"></div>
		
		<div class="qna_list">
			<ul>
			<c:forEach var="vo" items="${list}">
				<li>
					<div class="question">
						<div style="margin-right: 50px;">${vo.no}</div>
						<!-- <div><a href='detail.cu?id=${vo.id}'>${vo.title}</a></div> -->
						<div class="q_title"><a>${vo.title}</a></div>
					</div>
					<div class="answer">
						<div style="margin-right: 50px;">${vo.content}</div>
					</div>
					<hr>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div style="display: flex; justify-content: space-between; align-items: center;">
			<p style="font-size: 14px; vertical-align: middle;">원하시는 답변을 찾지못하셨다면, 고객센터로 문의해 주세요.</p>
			<a class="btn_style" onclick="contact()" style="cursor: pointer;">문의하기</a>
		</div>
	</div>
	</div>
</section>
</body>
<script type="text/javascript">
$(function () {
	var cate = '#'+'${cu_category}';
	$(cate).addClass('active');
	//alert(cate.text());
	$('.li_title').text($(cate).text());
});
function contact() {
	var info = '${loginInfo}'
	if(info == ''){
		alert("로그인을 해주세요!");
		location.href = 'login';
	}else{
		location.href = 'new.cu';
	}
	//alert(info);
}
$('.qna_list ul li').on('click', function() {
	//var idx = $(this).index();
	//alert(idx);
	//$('.answer').css('display','block');
	var content = $(this).children('.answer');
	var title = $(this).children('.question').children('.q_title');
	if(content.css('display') == 'block') {content.css('display','none'); title.css('font-weight','400');}
	else {content.css('display','block'); title.css('font-weight','600');}
})
$(document).on('click', '#tabs li', function () {
	var idx = $(this).index();
	//alert(idx);
	
	if(idx==0) $('input[name=category]').val('nomal');
	else if(idx==1) $('input[name=category]').val('app');
	else if(idx==2) $('input[name=category]').val('web');
	else $('input[name=category]').val('account');
	
	 $('form').submit();
});

</script>
</html>