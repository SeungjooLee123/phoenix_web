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
#container_wel{width:900px; margin:0 auto; display: flex; margin-top: 20px;}
.title_list{width:20%;}
.content_main{width:77%;}
.line_main{width: 3%; display: flex;}
.line_here{border-right: 1px solid #000; margin-left: auto; margin-right: auto;}
.search{width: 900px; margin: 0 auto;}
#list-top {margin-bottom: 10px; margin-top: 30px;}
#list-top div { height: 36px;}
#list-top ul { margin: 0; display: flex; float: right;}
#list-top ul li:not(:first-child) { margin-left: 3px; }
#list-top ul:first-child { float: left;}
#list-top ul:last-child { float: right;}
.btn-fill{border-radius: 5px; background: #8c88c9; color: #fff;}
.file-here{float: right;}
.btn_style{background: #f0efff; cursor: pointer; float: right; margin: 20px 10px; padding: 10px 13px; border: 1px solid #f0efff; border-radius: 3px;}
#content_here{width: 80%; margin-left: 15px;}

ul.grid {display: inline-block; }
ul.grid li { float: left; width: 400px; height: 67px; margin: 20px 1.25% 0 0; 
		box-sizing: border-box; }
ul.grid li:nth-child(even){margin-left: 30px;}
ul.grid li div {text-align: left; padding: 9px 10px; }
ul.grid li div:nth-child(2) {padding: 0px 10px;}
ul.grid li div:nth-child(1) {
	height: 65px;
	overflow: hidden; text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp : 3;	/* 3줄 */
	-webkit-box-orient : vertical;	/* 가로형태 */
}
.list a{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.center {position: absolute; left:50%; top:50%; transform:translate(-50%, -50%); }
#popup-background{position: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: #000; opacity: 0.3; display: none; margin: 0 auto;}
</style>
</head>
<body>
	<div style="display: flex; width: 1300px; margin: 0 auto;">
   <div><jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/></div>
   <div style="width: 900px; margin-left: 95px; margin-top: 50px;">
   <div id="container_wel">
   <ul class="grid">
	   <c:if test="${page.list.size() ne 0 }">
	   	<c:forEach var="vo" items="${page.list }">
	   		<li>
	   			<p style="position: relative; width: 100%; height: 67px; margin: 0 0 15px 18px; padding: 18px 125px 0 18px; border: 1px solid #d8d8d8; background: #f5f5f5; border-radius: 4px;">
		   			<a>${vo.title }</a>
		   			<a href="detail.wel?id=${vo.id }" style="display: inline-block; position: absolute; top: 50%; right: 18px; height: 26px; margin-top: -14px; padding: 0 7px; border: 1px solid #c8c8c8; border-radius: 2px; color: #595959; font-size: 12px; line-height: 24px; background: #fff">상세보기</a>
	   			</p>
	   		</li>
	   	</c:forEach>
	   </c:if>
   </ul>
   </div>
   <ul style="width: 900px; margin: 0 auto;">
      <!-- 관리자로 로그인된 경우만 글쓰기 가능 -->
      <c:if test="${loginInfo.admin eq 'Y' }">
         <li><a class="btn_style" href="new.wel" style="font-weight: 700; font-size: 15px; margin-right: 40px;"><i class="fa-solid fa-pencil"></i>&nbsp;&nbsp;글쓰기</a></li>
      </c:if>
   </ul>
   <div class="search">
   <form action="list.wel" method="post" style="margin-top: 100px;">
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
   </div>
   </div>
</body>
</html>