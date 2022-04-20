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
<style type="text/css">
body{margin-top: 50px;}
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
#wel_container {width: 1440px; margin :0 auto;}
#cate-ul{display: flex;}
#cate-ul>li{margin-top: 40px;}
#cate-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
#cate-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
#cate-ul li > a.btn-empty{background: #f5f5f5;}
</style>
</head>
<body>
	<div id='wel_container'>
		<p style="color: #000; font-weight: 700; font-size: 18.72px;">육아정보</p>
		<div id="wrap_cate">
			<ul id="cate-ul">
				<li><a class="btn-fill" href="list.wel">출산·육아정책</a></li>
				<li><a class="btn-empty" href="video.wel">동영상</a></li>
				<li><a class="btn-empty" href="graph.wel">통계자료</a></li>
				<li><a class="btn-empty" id="map-search" href="map.wel">주변장소검색</a></li>
			</ul>
		</div>
	</div>
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
			<!-- <textarea name="content" id="summernote" class='chk' title="내용"></textarea> -->
			<textarea id="summernote" name="editarea"></textarea>
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
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick="if ( emptyCheck() ) $('form').submit() ">저장하기</a>
	<a class='btn-empty' href='list.wel'>취소</a>
</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			});
		});
		
		$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
		$("#cate-ul li>a").eq(0).attr("class", "btn-fill");
	</script>
</body>
</html>