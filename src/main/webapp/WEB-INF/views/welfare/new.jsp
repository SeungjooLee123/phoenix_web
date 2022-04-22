<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   .file-img { width:24px } 
   #attach-file, #delete-file { display:none;}
   #delete-file { color:red; }
   
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
				<li><a class="btn-fill" href="list.wel">지원정책</a></li>
				<li><a class="btn-empty" href="video.wel">동영상</a></li>
				<li><a class="btn-empty" href="graph.wel">통계자료</a></li>
				<li><a class="btn-empty" id="map-search" href="map.wel">주변장소검색</a></li>
			</ul>
		</div>
	</div>
   <div class="container">
		<form method="post" action="insert.wel" enctype="multipart/form-data">
		   <input type="hidden" name="writer" value="${loginInfo.id }" />
		   <table>
		      <tr>
		         <th>제목</th>
		         <td>
		            <input type="text" id="title" title="제목" name="title" class="chk" placeholder="제목을 입력하세요." />
		         </td>
		      </tr>
		      <tr>
		         <th>내용</th>
		         <td>
		            <textarea class="chk" title="내용" name="content" id="summernote"></textarea>
		         </td>
		      </tr>
		      <tr>
		         <th>첨부파일</th>
		         <td class="left">
		            <label><input type="file" name="file" id="attach-file"/>
		            <img src="imgs/select.png" class="file-img" /></label>
		            <span id='file-name'></span>
		            <span id='delete-file' ><i class="fas fa-times"></i> </span>
		            <span id='preview'> </span>
		         </td>
		      </tr>
		   </table>
		</form>
		<div class="btnSet">
		   <a onclick="$('form').submit();">작성</a>
		      <a href='list.wel'>취소</a>
		   </div>
		</div>
   
      
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