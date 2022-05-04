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
	#wel_container {width: 900px; margin :0 auto;}
   .modal{position: absolute !important;}
   .modal-header{justify-content: unset;}
   .modal-header .close{margin: 0px 0px !important;}
   .modal-title{margin-top: 11px; margin-left: 136px;}
   input[type=file], #delete-file { display: none;}
	.file-img { width: 20px; height: 18px; }
	#attach-file, #delete-file { color: #ff0000; }
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
   table{
      width: 80%;
      margin: 20px auto;
   }
   table tr{
      height: 46px;
   }
   table th, table td{
      padding: 5px 10px;
   }
   table th{text-align: center;}
   .btnSet{
      width: 900px;
      margin: 20px auto;
      text-align: center;
   }
   .modi_main{width: 900px; margin: 0 auto; margin-top: 20px;}
   #container div>a {color: #505050; margin: 22px 0px; cursor: pointer; font-size: 15px; }
#container div>a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
#container div>ul li{color: #505050; margin: 22px 10px; cursor: pointer; font-size: 15px; }
#container div>ul li a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.list {margin: 22px 10px; }
.video {margin: 22px 10px; }
.graph ul>li:not(:first-of-type) {display: none; margin-left: 20px;}
.map ul>li:not(:first-of-type) {display: none; margin-left: 50px;}
.list_hr{
    display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    border-style: inset;
    border-width: 1px;
}
.ori_h{
	display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.list a{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display: flex; width: 1300px; margin: 0 auto;">
	<section id="container" style="width: 210px; height: 100%; display:flex;">
		<div style="margin-top: 13px; width: 182px; margin-left: 75px; border-right: 1px solid rgba(0,0,0,0.1); height: 735px; position: absolute;">
			<h3 class="ori_h" style="margin: 50px 0px;">베시시</h3>
			<div class="list">
				<a class="checkli" href="list.wel">지원정책</a>
			</div>
			<div class="video">
				<a class="ncheckli" href="video.wel">동영상</a>
			</div>
			<div class="graph">
				<ul>
					<li><a href="graph.wel">통계자료</a></li>
					<li><a style="margin-left: 15px;">출생</a></li>
					<li><a style="margin-left: 15px;">표준발육</a></li>
				</ul>
			</div>
			<div class="map">
				<ul>
					<li><a href="map.wel">주변장소검색</a></li>
					<li><a style="margin-left: 15px;">소아과</a></li>
					<li><a style="margin-left: 15px;">키즈카페</a></li>
					<li><a style="margin-left: 15px;">어린이집</a></li>
					<li><a style="margin-left: 15px;">유아용품</a></li>
				</ul>
			</div>
		</div>
		<hr class="list_hr">
		</section>
	<div style="width: 900px; margin-top: 50px; margin-left: 105px;">
   <div class="modi_main">
   <form action="update.wel" method="post" enctype="multipart/form-data">
   <input type="hidden" name="id" value="${vo.id}">
      <table>
         <tr>
            <td><input type="text" style="width: 100%; padding: 5px;" name="title" class="chk" value="${vo.title}" title="제목" required="required"/></td>
         </tr>
         <tr>
            <td><textarea class="chk" title="내용" name="content" id="summernote"><c:out value="${vo.content }" escapeXml="true"/></textarea></td>
         </tr>
         <tr>
            <td class="left middle">
               <label>
                  <a><img src='imgs/select.png' class='file-img' /></a>
				<input type="file" id='attach-file' name='file' />
               </label>
               <c:if test="${! empty vo.filename }">
                  <!-- 파일 보이기  -->
                  <span id='file-name'>${vo.filename }</span>
                  <a id='delete-file' style='display : ${empty vo.filename ? "none" : "inline"}'><i class="fa-solid fa-circle-xmark"></i></a>
               </c:if>
            </td>
         </tr>
      </table>
      <input type="hidden" name="attach"/>  <%-- 첨부파일에 대한 정보를 숨겨서 가져갈 예정 --%>
   </form>
   </div>
   <script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
   <div class="btnSet">
      <a style="margin-right: 20px; border: 1px solid #8c88c9; background: #8c88c9; border-radius: 5px; color: #fff; padding: 5px; font-size: 18px;" style="cursor: pointer;" onclick="if( emptyCheck() ){ $( '[name=attach]' ).val( $('#file-name').text() ); $('form').submit() }">저장</a>
      <a style="font-size: 18px; padding: 5px; border: 1px solid #fffef0; border-radius: 5px; background: #ebebeb" onclick="history.go(-1)">취소</a>
   </div>
   </div>
   </div>
   <script type="text/javascript" src="js/file_check.js?v<%=new Date().getTime()%> "></script>
   <script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
   <script type="text/javascript">
      $('#summernote').summernote({
          width: 920,
         height: 300,
         lang: "ko-KR",
         fontSizes: ['8','9','10','11','12','14','18','24','36'],
         toolbar: [ 
         	['style', ['style']],
 			['fontsize', ['fontsize']],
 			['font', ['bold', 'italic', 'underline', 'clear']],
 			['fontname', ['fontname']],
 			['color', ['color']],
 			['para', ['ul', 'ol', 'paragraph']],
 			['height', ['height']],
 			['table', ['table']],
 			['insert', ['link', 'picture', 'hr']],
 			['view', ['fullscreen', 'codeview']],
 			['help', ['help']]
         	],
         	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Nanum Gothic', 'Malgun Gothic', 'Noto Sans KR', 'Apple SD Gothic Neo'],
 			fontNamesIgnoreCheck: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Helvetica Neue', 'Helvetica', 'Impact', 'Lucida Grande', 'Tahoma', 'Times New Roman', 'Verdana', 'Nanum Gothic', 'Malgun Gothic', 'Noto Sans KR', 'Apple SD Gothic Neo'],
 			fontSizes: ['8','9','10','11','12','13','14','15','16','17','18','19','20','24','30','36','48','64','82','150'],
         tableClassName: function(){
        	$(this).addClass('table table-bordered').attr('border', 1).css('borderCollapse', 'collapse').css('width', '100%');
        	$(this).find('tr:first-child td').css('borderTop', '1px solid #000').css('borderBottom', '1px solid #ddd').css('borderLeft', '1px solid #ddd').css('borderRight', '1px solid #ddd').css('padding', '15px').css('fontWeight', 'bold').css('background', '#e2f1ff');
        	$(this).find('tr:not(:first-child) td').css('borderColor', '#ddd').css('padding', '15px');
         },
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
       $(function name() {
    	   // 첨부된 파일이 이미지 파일인 경우 미리보기 되게끔.
    	   if(${! empty vo.filename}) { //첨부파일이 있다면
    	      if( isImage('${vo.filename}') ) {   // 이미지 파일인 경우
    	         $('#preview').html("<img src='${vo.filepath}' id='preview-img'/>"); //이미지를 올리려면 img 태그를 써야하기때문에 html사용
    	      }
    	   }
    	});
   </script>
</body>
</html>