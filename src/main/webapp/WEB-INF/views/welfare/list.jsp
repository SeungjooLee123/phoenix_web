<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<style type="text/css">
#container_wel{width:1200px; margin:0 auto; display: flex;}
.title_list{width:20%;}
.content_main{width:77%;}
.line_main{width: 3%; display: flex;}
.line_here{border-right: 1px solid #000; margin-left: auto; margin-right: auto;}
.search{width: 1200px; margin: 0 auto;}
#list-top {margin-bottom: 10px; margin-top: 30px;}
#list-top div { height: 36px;}
#list-top ul { margin: 0; display: flex; float: right;}
#list-top ul li:not(:first-child) { margin-left: 3px; }
#list-top ul:first-child { float: left;}
#list-top ul:last-child { float: right;}
.btn-fill{border-radius: 5px; background: #8c88c9; color: #fff;}
.file-here{float: right;}

</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
   <div id="container_wel">
   <div class="title_list">
      <ul>
         <c:if test="${page.list.size() ne 0 }">
            <c:forEach var="vo" items="${page.list }">
               <li  style="margin: 10px;"><a><span>${vo.title }</span></a><hr/></li>
            </c:forEach>
         </c:if>
      </ul>
   </div>
   <div class="line_main">
      <div class="line_here"></div>
   </div>
   <div class="content_main">
      <div id="content_here"></div>
      
   </div>
   
   </div>
   <ul style="width: 1200px; margin: 0 auto;">
      <!-- 관리자로 로그인된 경우만 글쓰기 가능 -->
      <c:if test="${loginInfo.admin eq 'Y' }">
         <li><a href='new.wel' style="float: right; padding: 5px; border: 1px solid #e6e6e6; border-radius: 3px;">글쓰기</a></li>
      </c:if>
   </ul>
   <div class="search">
   <form action="list.wel" method="post" style="margin-top: 50px;">
   <input type="hidden" name="curPage" value="1" />
   <div id = 'list-top' style='text-align : center;'>
      <div style="display: inline-block;">
         <!-- 항목별 검색 처리 -->
         <ul id="search_main">
            <li>
               <select name="search" style="padding: 10px; font: 16px; margin-right: 10px;" class='w-px90'>
                  <option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
                  <option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
                  <option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
               </select>
            </li>      
            <li><input type="text" style="padding: 10px; font: 16px; margin-right: 10px;" name='keyword' value='${page.keyword }' class='w-px300' /></li>
            <li class="btn-fill" style="padding: 10px;"><a style='vertical-align: center; font: 16px;' onclick="$('form').submit()">검색</a></li>         
         </ul>
      </div>
   </div>
   </form>
   </div>
   <script type="text/javascript">
   jQuery(document).ready(function(){
	   if('${page.list[0].filename}' != ""){
		   document.getElementById("content_here").innerHTML = "<div class='file-here'><a href='download.wel?id=${page.list[0].id }' style='margin-right: 5px;'><i class='fa-solid fa-floppy-disk'></i></a>${page.list[0].filename }</div>";
		   $("#content_here").append('</br></br></br>${page.list[0].content}');
		   } else{
			   document.getElementById("content_here").innerHTML = '${page.list[0].content}';
			   }
	   if('${page.list[0].user_id}' == "${loginInfo.id}"){
		   $("#content_here").append("<br/></br><div style='float: right; margin-top: 10px;'><a style='padding: 5px; border-right: 1px solid #000;' href='modify.wel?id=${page.list[0].id }'>수정   </a><a style='padding: 5px; margin-left: 5px;' onclick =' if( confirm(\"정말 삭제?\") ) { href=\"delete.wel?id=${page.list[0].id }\" }''>   삭제</a></div></br></br>");
		   }
	   });
   
   $(".title_list ul>li").click(function(){
	   var title_index = $(this).index();
	   <c:forEach var = "vo" items = "${page.list}">
	   if("${vo.no}" == title_index+1) {
		   if('${vo.filename}' != ""){
			   document.getElementById("content_here").innerHTML = "<div class='file-here'><a href='download.no?id=${vo.id }' style='margin-right: 5px;'><i class='fa-solid fa-floppy-disk'></i></a>${vo.filename }</div>";
			   $("#content_here").append('</br></br></br>${vo.content}');
			   } else{
				   document.getElementById("content_here").innerHTML = '${vo.content}';
				   }
            	
		   if('${vo.user_id}' == "${loginInfo.id}"){
			   $("#content_here").append("</br></br><div style='float: right; margin-top: 10px;'><a href='modify.wel?id=${vo.id }' style='padding: 5px; border-right: 1px solid #000;'>수정   </a><a style='padding: 5px; margin-left: 5px;' onclick =' if( confirm(\"정말 삭제?\") ) { href=\"delete.wel?id=${vo.id }\" }''>삭제</a></div></br></br>");
			   }
		   }
	   </c:forEach>
	   });
   </script>
</body>
</html>