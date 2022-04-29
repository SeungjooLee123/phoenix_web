<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
body img{
	text-align: center;
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
.t-attach{
	width: 86px;
}
thead {

}
.btnSet{
	margin-top: 20px;
}

.file-img { width: 40px; height: 36px; }

</style>
<head>
<meta charset="UTF-8">
<title>Community</title>
</head>
<body>
<img src="imgs/bss_ad_pick.png" style="width: 1440px; height: 400px; margin: 50px auto; ">

<form action="share" method="post" id="btns" >
		<input type="hidden" name="curPage" value="1" />
		<input type="hidden" name="id" /><%-- detail에 보내질 id --%>
		<div id="list-top">
			<%-- 항목별 검색처리 --%>
			<ul>
				<li>
					<select name="search" class="w-px200">
						<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
						<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
						<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
						<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
					</select>
				</li>
				<c:if test="${page.keyword eq 'all'}">
					<li><input type="text" name="keyword" class="w-px200"></li>
				</c:if>
				<c:if test="${page.keyword ne 'all'}">
					<li><input type="text" name="keyword" class="w-px200" value="${page.keyword}"></li>
				</c:if>
				<li><a class="btn_style" onclick="$('form').submit()">검색</a></li>
				<li>
				<select name="pageList" class="w-px90" onchange="$('form').submit() ">
					<option value="10" ${page.pageList eq 10 ? 'selected' : '' } >10개씩</option>
					<option value="15" ${page.pageList eq 15 ? 'selected' : '' } >15개씩</option>
					<option value="20" ${page.pageList eq 20 ? 'selected' : '' } >20개씩</option>
					<option value="25" ${page.pageList eq 25 ? 'selected' : '' } >25개씩</option>
					<option value="30" ${page.pageList eq 30 ? 'selected' : '' } >30개씩</option>
				</select>
			</li>
			<li>
				<select name="viewType" class="w-px110" onchange="$('form').submit() ">
					<option value="list" ${page.viewType eq 'list' ? 'selected' : '' }>리스트형태</option>
					<option value="grid" ${page.viewType eq 'grid' ? 'selected' : '' }>그리드형태</option>
				</select>
			</li>
			</ul>
			<ul><!-- 로그인 된 사람만 글쓰기 가능 -->
				<c:if test="${loginInfo.admin eq 'Y'}">
					<li><a class="btn_style" href="new.sh">글쓰기</a></li>
				</c:if>		
			</ul>
		</div>
</form>
<!-- 그리드 목록 형태 -->
<c:if test="${page.viewType eq 'grid' }">
	<ul class="grid" >
		<c:forEach items="${page.list}" var="vo">
			<li>
				<div><a onclick="go_detail(${vo.id})"> ${vo.title}</a></div>
				<div>${vo.user_id }</div>
				<div>${vo.web_date} [${vo.cnt }]
				<span style="float:right">${ empty vo.filename ? '' : '<img src="imgs/attach.png" class="file-img" />' }</span></div>
			</li>
		</c:forEach>
	</ul>
</c:if>


<div style="text-align: center;">
	<table style="margin: 0 auto; border: 1px solid; width: 80%; ">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th class="t-attach">첨부파일</th>
			</tr>
		</thead>
		<tbody>
		<!-- 조회된 목록이 없을 경우 정보 표시 -->
		<c:if test="${empty page.list }">
			<tr>
				<td colspan="6">방명록 정보가 없습니다.</td>
			</tr>
		</c:if>
			<c:forEach items="${page.list}" var="vo">
				<tr>
					<td>${vo.id}</td>
					<td class="left"><a onclick='go_detail(${vo.id})'>${vo.title}</a></td>
					<td>${vo.user_id}</td>
					<td>${vo.web_date}</td>
					<td>${vo.cnt}</td>
					<td>${empty vo.web_file ? '' : '<img src="imgs/attach2.png" class="file-img" />'}</td>
				</tr>
			</c:forEach>  
		</tbody>
	</table>
<!--  -->
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />	
	</div>
	
</div>

<br>
<script type="text/javascript">
		function go_detail(id) {
			$('[name=id]').val(id);
			$('form').attr('action', 'detail.sh');
			$('form').submit();
		}
	</script>
</body>
</html>