<%@page import="java.util.Date"%>
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
	#container div>a {color: #505050; margin: 22px 0px; cursor: pointer; font-size: 15px; }
#container div>a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
#container div>ul li{color: #505050; margin: 22px 10px; cursor: pointer; font-size: 15px; }
#container div>ul li a:hover{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.list {margin: 22px 10px; }
.video {margin: 22px 10px; }
.graph ul>li:not(:first-of-type) {display: none; margin-left: 20px;}
.map ul>li:not(:first-of-type) {display: none; margin-left: 50px;}
   
   .modal{position: absolute !important;}
   .modal-header{justify-content: unset;}
   .modal-header .close{margin: 0px 0px !important;}
   .modal-title{margin-top: 11px; margin-left: 136px;}
   
   #wel_container {width: 900px; margin :0 auto;}
   input[type=file], #delete-file { display: none;}
	.file-img { width: 20px; height: 18px; }
	#attach-file, #delete-file { color: #ff0000; }
	#preview {height: 36px; display: inline-block;}
	#preview-img{ max-height: 34px;}
   
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
      margin: 20px auto;
      text-align: center;
   }
   
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
   
   .new_container{width: 900px; margin: 0 auto; margin-top: 20px;}
</style>
</head>
<body>
   <div style="display: flex; width: 1300px; margin: 0 auto;">
	<section id="container" style="width: 210px; height: 100%; display:flex;">
		<div style="margin-top: 13px; width: 182px; margin-left: 20px; border-right: 1px solid rgba(0,0,0,0.1); height: 735px; position: absolute;">
			<h3 class="ori_h" style="margin: 50px 0px;">?????????</h3>
			<div class="list">
				<a class="checkli" href="list.wel">????????????</a>
			</div>
			<div class="video">
				<a class="ncheckli" href="video.wel">?????????</a>
			</div>
			<div class="graph">
				<ul>
					<li><a href="graph.wel">????????????</a></li>
					<li><a style="margin-left: 15px;">??????</a></li>
					<li><a style="margin-left: 15px;">????????????</a></li>
				</ul>
			</div>
			<div class="map">
				<ul>
					<li><a href="map.wel">??????????????????</a></li>
					<li><a style="margin-left: 15px;">?????????</a></li>
					<li><a style="margin-left: 15px;">????????????</a></li>
					<li><a style="margin-left: 15px;">????????????</a></li>
					<li><a style="margin-left: 15px;">????????????</a></li>
				</ul>
			</div>
		</div>
		<hr class='list_hr'>
		</section>
	<div style="width: 900px; margin-top: 50px; margin-left: 75px;">
   <div class="new_container">
      <form method="post" action="insert.wel" id="in_form" enctype="multipart/form-data">
         <input type="hidden" name="writer" value="${loginInfo.id }" />
         <table>
            <tr>
               <td>
                  <input type="text" style="width: 100%; padding: 5px;" id="title" title="??????" name="title" class="chk" placeholder="????????? ???????????????." required="required" />
               </td>
            </tr>
            <tr>
               <td>
                  <textarea class="chk" title="??????" name="content" id="summernote"></textarea>
               </td>
            </tr>
            <tr>
               <td class="left">
                  <label><input type="file" name="file" id="attach-file"/>
                  <img src="imgs/select.png" class="file-img" /></label>
                  <span id='file-name'></span>
                  <span id='delete-file' ><i class="fa-solid fa-circle-minus"></i> </span>
                  <span id='preview'> </span>
               </td>
            </tr>
         </table>
      </form>
      <div class="btnSet">
         <a onclick="$('form').submit()" style="margin-right: 20px; border: 1px solid #8c88c9; background: #8c88c9; border-radius: 5px; color: #fff; padding: 5px; font-size: 18px;">??????</a>
            <a href='list.wel' style="font-size: 18px; padding: 5px; border: 1px solid #fffef0; border-radius: 5px; background: #ebebeb">??????</a>
         </div>
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
        	$(this).find('tr:first-child td').css('borderTop', '1px solid #000').css('borderBottom', '1px solid #000').css('borderLeft', '1px solid #ddd').css('borderRight', '1px solid #ddd').css('padding', '15px').css('background', '#f0f1f5');
        	$(this).find('tr:not(:first-child) td').css('borderColor', '#ddd').css('padding', '15px');
         },
           callbacks: {   //?????? ????????? ???????????? ???????????? ??????
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
                  //?????? ???????????? ????????? url??? ????????? ??????.
               for(var i = 0 ; i<data.length ; i ++){
                  $(editor).summernote('insertImage', data[i]);
               }
            }
         });
      }
   </script>
   
   
</body>
</html>