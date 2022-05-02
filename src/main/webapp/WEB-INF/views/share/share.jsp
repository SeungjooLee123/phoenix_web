<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">

.btnSet{
	display: flex;
	justify-content: center;
}

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
.btn_search{

}
.file-img { width: 40px; height: 36px; }

</style>
<head>
<meta charset="UTF-8">
<title>Community</title>
</head>
<body>
<img src="imgs/bss_ad_pick.png" style="width: 1440px; height: 400px; margin: 50px auto; ">
<section class="container"  style="width: 1300px; margin: 0 auto; ">

<form action="share" method="post" id="btns"   >
		<input type="hidden" name="curPage" value="1" />
		<input type="hidden" name="id" /><%-- detail에 보내질 id --%>
		<div style="width: 1300px; height: 90px; ">
			<div id="list-top"  style="text-align: center;">
				<%-- 항목별 검색처리 --%>
				<ul style="display: flex; justify-content: center; text-align: center; align-items: center;">
					<li style="margin-right: 25px; text-align: center;  ">
						<select name="search" style="width: 100px; height: 50px; text-align: center; font-size: 18px; font-weight: 700;">
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
						</select>
					</li>
					<li style="margin-right: 25px;">
						<select name="pageList" class="w-px90" onchange="$('form').submit()" style="width: 100px; height: 50px; text-align: center; font-size: 18px; font-weight: 700;">
							<option value="10" ${page.pageList eq 10 ? 'selected' : '' } >10개씩</option>
							<option value="15" ${page.pageList eq 15 ? 'selected' : '' } >15개씩</option>
							<option value="20" ${page.pageList eq 20 ? 'selected' : '' } >20개씩</option>
							<option value="25" ${page.pageList eq 25 ? 'selected' : '' } >25개씩</option>
							<option value="30" ${page.pageList eq 30 ? 'selected' : '' } >30개씩</option>
						</select>
					</li>
					<li style="margin-right: 25px;">
						<select name="viewType" class="w-px110" onchange="$('form').submit()" style="width: 130px; height: 50px; text-align: center; font-size: 18px; font-weight: 700;">
							<option value="grid" ${page.viewType eq 'grid' ? 'selected' : '' }>그리드형태</option>
							<option value="list" ${page.viewType eq 'list' ? 'selected' : '' }>리스트형태</option>
						</select>
					</li>
					<c:if test="${page.keyword eq 'all'}">
						<li><input type="text"  style="width: 690px;; height: 50px; margin-right: 25px;"></li>
					</c:if>
					<c:if test="${page.keyword ne 'all'}">
						<li><input type="text" name="keyword" value="${page.keyword}" style="width: 690px; height: 50px; margin-right: 25px;" /></li>
					</c:if>
					<li style="width: 100px; background: #f0efff; text-align: center; padding: 15px 0 15px 0; font-weight: 700; font-size: 18px; " > <a class="btn_search" onclick="$('form').submit()  ">검색</a></li>
				</ul>
				<ul><!-- 로그인 된 사람만 글쓰기 가능 -->
					<c:if test="${loginInfo.admin eq 'Y'}">
						<li><a class="btn_style" href="new.sh">글쓰기</a></li>
					</c:if>		
				</ul>
			</div>
		</div>
</form>
<!-- 그리드 목록 형태 -->
<c:if test="${page.viewType eq 'grid' }">
	<div style="width: 1250px; margin: 0 auto; display: flex; margin-left: 40px; ">
	
		<ul class="grid" style="  display: block;   ">
			<c:forEach items="${page.list}" var="vo">
				<li style="border: 1px solid #b0b0b0; width: 400px; height: 600px; box-sizing: border-box; float: left; margin-bottom: 45px; position: relative; margin-right: 10px;  " >
					<div style="position: absolute;   border-radius: 5px; width: 100px; top: 3%; left: 5%; background: #8c88c9; height: 30px; display: flex; justify-content: center; align-items: center; "> 
						<p style="color: #fff; font-weight: 700; ">조회수 [${vo.cnt }]</p>
					</div>
					<img src="imgs/lock2.png" style="  width: 370px; height: 400px; margin: 15px ;">
					<div style="color: #888888; font-size: 15px; margin-left: 20px;">${vo.user_id }</div>
					<div style="color: #000; font-size: 18px; margin-left: 20px; font-weight: 700; "><a onclick="go_detail(${vo.id})"> ${vo.title}</a></div>
					<div style="position: absolute; bottom: 3%; left: 3%; color: #ff8585; bottom: 3%; left: 3%; font-size: 18px; font-weight: 700;" >#베시시 #나눔왕EVENT!</div>
					<div style="color: #888; font-size: 15px; text-align: right; bottom: 3%; right: 3%; position: absolute;" >${vo.web_date}</div>
					    
				</li>
			</c:forEach>
		</ul>
	</div>
	
</c:if>


<!-- 목록 형태 -->
<c:if test="${page.viewType eq 'list' }">
<div style="text-align: center;">
	<table style="margin: 0 auto; border: 1px solid; width: 80%; ">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
<!-- 				<th>조회수</th> -->
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
</div>
</c:if>
<!--  -->
	<br>
	
	<div class="btnSet"  >
		<jsp:include page="/WEB-INF/views/include/page.jsp" />	
	</div>

</section>


<script type="text/javascript">
		function go_detail(id) {
			$('[name=id]').val(id);
			$('form').attr('action', 'detail.sh');
			$('form').submit();
		}
</script>
</body>
</html>