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
#container_wel{width:1200px; margin:0 auto;}
.title_list{width:15%; float:left; border-right: 1px solid #000;}
.content_main{width:75%; float:right;}
#list-top div { height: 36px;}
#list-top ul { margin: 0; display: flex; float: right;}
#list-top ul li:not(:first-child) { margin-left: 3px; }
#list-top ul:first-child { float: left;}
#list-top ul:last-child { float: right;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
	<div id="container_wel">
	<form action="list.wel" method="post">
	<input type="hidden" name="curPage" value="1" />
	<div id = 'list-top'>
		<div style="width:100%; background: #333;">
			<!-- 항목별 검색 처리 -->
			<ul id="search_main">
				<li>
					<select name="search" class='w-px90'>
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
					</select>
				</li>		
				<li><input type="text" name='keyword' value='${page.keyword }' class='w-px300' /></li>
				<li><a class='btn-fill' onclick="$('form').submit()">검색</a></li>			
			</ul>
			<ul>
				<!-- 관리자로 로그인된 경우만 글쓰기 가능 -->
				<c:if test="${loginInfo.admin eq 'Y' }">
					<li><a class='btn-fill' href='new.wel'>글쓰기</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	</form>
	<div class="title_list">
		<ul>
			<c:if test="${page.list.size() ne 0 }">
				<c:forEach var="vo" items="${page.list }">
					<li  style="margin: 10px;"><a><span>${vo.title }</span></a><hr/></li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div class="content_main">
		<div id="content_here"></div>
		
	</div>
	</div>
	<script type="text/javascript">
		var cnt_user_id = '';
		jQuery(document).ready(function(){
			document.getElementById("content_here").innerHTML = "<p>" +'${page.list[0].content}'+ "</p>";
			if('${page.list[0].user_id}' == "${loginInfo.id}"){
				$("#content_here").append("<a class='btn-fill' href='modify.wel?id=${page.list[0].id }'>수정</a><a class='btn-fill' onclick =' if( confirm(\"정말 삭제?\") ) { href=\"delete.wel?id=${page.list[0].id }\" }''>삭제</a>");
			}
		});
		
		$(".title_list ul>li").click(function(){
			var title_index = $(this).index();
			<c:forEach var = "vo" items = "${page.list}">
				if("${vo.no}" == title_index+1) {
					document.getElementById("content_here").innerHTML = '${vo.content}';
					if('${vo.user_id}' == "${loginInfo.id}"){
						$("#content_here").append("</br><a class='btn-fill' href='modify.wel?id=${vo.id }'>수정</a><a class='btn-fill' onclick =' if( confirm(\"정말 삭제?\") ) { href=\"delete.wel?id=${vo.id }\" }''>삭제</a>");
					}
				}
			</c:forEach>
		});
	</script>
</body>
</html>