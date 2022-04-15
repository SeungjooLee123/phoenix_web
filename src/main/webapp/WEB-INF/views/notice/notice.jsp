<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<style type="text/css">
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
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<title>Insert title here</title>
</head>
<body>
<h3>방명록 목록</h3>
	<form action="list.bo" method="post">
		<input type="hidden" name="curPage" value="1" />
		<input type="hidden" name="id" /><%-- detail에 보내질 id --%>
		<div id="list-top">
			<div>
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
					<li><input type="text" name="keyword" class="w-px200" value="${page.keyword}"></li>
					<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>
				</ul>
				<ul>
					<c:if test="${not empty loginInfo}">
						<li><a class="btn-fill" href="new.bo">글쓰기</a></li>
					</c:if>		
					<li>
						<%-- pageList 수 바꾸기 --%>
						<select name="pageList" class="w-px60" onchange="$('form').submit()">
							<option value="10" ${page.pageList eq '10' ? 'selected' : '' }>10개씩</option>
							<option value="15" ${page.pageList eq '15' ? 'selected' : '' }>15개씩</option>
							<option value="20" ${page.pageList eq '20' ? 'selected' : '' }>20개씩</option>
							<option value="25" ${page.pageList eq '25' ? 'selected' : '' }>25개씩</option>
							<option value="30" ${page.pageList eq '30' ? 'selected' : '' }>30개씩</option>
						</select>
					</li>
					<li>
						<%--보이는 형태 바꿔보기 --%>
						<select name="viewType" class="w-px200" onchange="$('form').submit()">
							<option value="list" ${page.viewType eq 'list' ? 'selected' : '' }>리스트 형태</option>
							<option value="grid" ${page.viewType eq 'grid' ? 'selected' : '' }>그리드 형태</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
	</form>
	
	<%-- 그리드 형태 --%>
	<c:if test="${page.viewType eq 'grid'}">
		<ul class="grid">
			<c:forEach items="${page.list}" var="vo">
				<li>
					<div><a onclick="go_detail(${vo.id})"> ${vo.title }</a></div>
					<div>${vo.name }</div>
					<div>
						${vo.writedate } [${vo.readcnt }] 
						<span style="float: right;">${empty vo.filename ? '' : '<img src="imgs/attach.png" class="file-img"/>'}</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<%-- 목록 형태 --%>	
	<c:if test="${page.viewType eq 'list'}">
		<table>
			<thead>
				<tr>
					<th class="w-pct10">번호</th>
					<th>제목</th>
					<th class="w-pct10">작성자</th>
					<th class="w-pct10">작성일자</th>
					<th class="w-pct10">조회수</th>
					<th class="w-pct20">첨부파일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${page.list.size() ne 0}">
					<c:forEach var="vo" items="${page.list}">
						<tr>
							<td>${vo.no}</td>
							<td class="left"><a onclick="go_detail(${vo.id})">${vo.title}</a></td>
							<td>${vo.name}</td>
							<td>${vo.writedate}</td>
							<td>${vo.readcnt}</td>
							<td>${empty vo.filename ? '' : '<img src="imgs/attach.png" class="file-img"/>' }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${page.list.size() eq 0}">
					<tr><td colspan="6">방명록 정보가 없습니다.</td></tr>
				</c:if>
			</tbody>                       
		</table>
	</c:if>
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp" />	
	</div>
	<script type="text/javascript">
		function go_detail(id) {
			$('[name=id]').val(id);
			$('form').attr('action', 'detail.bo');
			$('form').submit();
		}
	</script>
</body>
</html>