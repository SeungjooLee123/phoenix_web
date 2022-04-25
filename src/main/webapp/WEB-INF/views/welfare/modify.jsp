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
	#wel_container {width: 1300px; margin :0 auto;}
   #cate-ul{display: flex;}
   #cate-ul>li{margin-top: 30px;}
   #cate-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
   #cate-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
   #cate-ul li > a.btn-empty{background: #f5f5f5;}
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
      width: 1300px;
      margin: 20px auto;
      text-align: center;
   }
   .modi_main{width: 1200px; margin: 0 auto; margin-top: 20px;}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='wel_container'>
	      <div id="wrap_cate">
	         <ul id="cate-ul">
	            <li><a class="btn-fill" href="list.wel">지원정책</a></li>
	            <li><a class="btn-empty" href="video.wel">동영상</a></li>
	            <li><a class="btn-empty" href="graph.wel">통계자료</a></li>
	            <li><a class="btn-empty" id="map-search" href="map.wel">주변장소검색</a></li>
	         </ul>
	      </div>
   </div>
   <div class="modi_main">
   <form action="update.wel" method="post" enctype="multipart/form-data">
   <input type="hidden" name="id" value="${vo.id}">
      <table>
         <tr>
            <td><input type="text" style="width: 100%; padding: 5px;" name="title" class="chk" value="${vo.title}" title="제목" /></td>
         </tr>
         <tr>
            <td><textarea class="chk" title="내용" name="content" id="summernote"><c:out value="${vo.content }" escapeXml="true"/></textarea></td>
         </tr>
         <tr>
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
   </div>
   <script type="text/javascript" src='js/common.js?v<%=new Date().getTime() %>'></script>
   <div class="btnSet">
      <a style="margin-right: 20px; border: 1px solid #8c88c9; background: #8c88c9; border-radius: 5px; color: #fff; padding: 5px; font-size: 18px;" style="cursor: pointer;" onclick="if( emptyCheck() ){ $( '[name=attach]' ).val( $('#file-name').text() ); $('form').submit() }">저장</a>
      <a style="font-size: 18px; padding: 5px; border: 1px solid #fffef0; border-radius: 5px; background: #ebebeb" onclick="history.go(-1)">취소</a>
   </div>
   <script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
   <script type="text/javascript">
      $('#summernote').summernote({
          width: 1300,
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