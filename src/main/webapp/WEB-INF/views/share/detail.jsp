<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
img{
	width: 25px;
	height: 25px;
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
.btnSet{
	margin-top: 20px;
}
.comment {
	margin-top 50;
	text-align: center;
}
.btnSet{
	text-align: right;
}
#comment_regist{
	margin-top: 50px;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<img src="imgs/bss_ad_pick.png" style="width: 1400px; height: 400px; margin: 50px; ">



<div class="btnSet">
		<a class="btn-fill" onclick="$('#comu_form').submit()" >목록으로</a>
		<%-- 글쓴이만 수정 삭제 권한을 가질 수 있으므로 비교 먼저 해야 함 --%>
		<c:if test="${loginInfo.admin eq 'Y'}">
			<a class="btn-fill" onclick="$('form').attr('action', 'modify.co'); $('form').submit()">수정하기</a>
			<a class="btn-fill" onclick='if(confirm("정말 삭제?")) {href="delete.sh?id=${vo.id}"}'>삭제하기</a>
		</c:if>
</div>

	<%-- <c:if test="${vo.prev_title ne 0 }">
		<a href='detail.no?id=${vo.prev_title }'>[이전 글] ${vo.prev_title }</a> <br />
	</c:if>
	<c:if test="${vo.next_title ne 0 }">
		<a href='detail.no?id=${vo.next_title }'>[다음 글] ${vo.next_title }</a>
	</c:if> --%>
	
<hr style="color: black; margin-bottom: 30px; ">

<table>
		<tr>
			<th class="w-px120">제목</th>
			<td colspan="5" class="left">${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.user_id }</td>
			<th class="w-px120">작성일자</th>
			<td class="w-px120">${vo.web_date }</td>
			<th class="w-px80">조회수</th>
			<td class="w-px80">${vo.cnt }</td>
		</tr>
	    <tr>
			<th>내용</th>
			<td colspan="5" class="left">${fn:replace( vo.content, crlf, '<br>') }</td>   <!-- 띄어 쓰기 모델로 넘겨받아서  EL로 받음 -->
		</tr>	
		<tr>
			<th>첨부파일</th>
			<td colspan="5" class="left">${vo.web_file }
				<c:if test="${ ! empty vo.web_file }">  <!--파일 있을 때  -->
				<!-- 파일 보이기  -->
				<a id='preview'></a>
				<a href="download.sh?id=${vo.id }" >다운</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td class='left' colspan="6">
				<c:if test="${vo.prev ne 0 }">
					<a href='detail.sh?id=${vo.prev }'>[이전 글] ${vo.prev_title }</a> <br />
				</c:if>
				<c:if test="${vo.next ne 0 }">
					<a href='detail.sh?id=${vo.next }'>[다음 글] ${vo.next_title }</a>
				</c:if>
			</td>
		</tr>
</table>

	<!-- 댓글 입력 처리 부분 -->
	<div class="comment">
		<div id="comment_regist">						<!-- 댓글 등록 부 -->
			<span class="left">댓글작성</span>
			<span class="right"><a class='btn-fill-s' onclick="comment_regist()">댓글등록</a></span>
			<textarea id="comment" placeholder="내용을 입력하세요"></textarea>			<!-- 댓글 작성 부분 -->
		</div>
		<div id="comment_list"></div>
	</div>
	
	
	
	
	
<form id="comu_form" action="share" method="post">
	<input type="hidden" name="id" value="${vo.id}" /> <%-- 검색 조건 --%>
	<input type="hidden" name="search" value="${page.search}" /> <%-- 검색 조건 --%>
	<input type="hidden" name="keyword" value="${page.keyword}" /> <%-- 검색어 --%>
	<input type="hidden" name="pageList" value="${page.pageList}" /> <%-- 페이지당 보여질 목록 수 --%>
	<input type="hidden" name="curPage" value="${page.curPage}" /> <%-- 현재페이지 --%>
</form>
	
	
	<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
<script type="text/javascript">
//댓글 뿌리기
$(function () {
	comment_list();
});


//댓글등록
function comment_regist(){
	//로그인 정보가 없으면
	if( ${ empty loginInfo }){
		alert('댓글을 등록하려면 로그인하세용');
		return;
	//로그인 정보가 있다면	
	}else if( $.trim ( $('#comment').val() ) == '' ){
		alert('댓글을 입력하세용');		
		$('#comment').val('');
		$('#comment').focus();
		return;
	}
	var pid = ${vo.id};
//	var user_id = ${vo.user_id };
	var con = $('#comment').val()
	$.ajax ({
		/* 경로 형태로 url  지정할꺼양 */
		url :	'share/comment/regist'			/* controller 호출  주소 형식 맵핑 */
		, data:	{ pid : pid , content : con  }
				/* pid : 원 글의 id, 입력한 댓글  */
		, success : function ( res ) {
			if( res ){	//true == true T , false == true F
				alert('댓글이 등록되었습니다.')	;
				$('#comment').val('');
				comment_list();		//댓글 목록 조회 요청
			} else {
				alert('댓글 등록을 실패하였습니다.');
			}
		}, 	error : function(req, text) {
			alert(text + " : " + req.status );
		}
	});
}


/* 댓글 목록 조회()  */
function comment_list(){
	var id = ${ vo.id };
	console.log(id);

	$.ajax({
		url : "share/comment/list/${vo.id}"
//		, data : {pid : 342 }
		, success : function ( res) {
			$('#comment_list').html( res );
		}, error : function (req, text){
			alert(text + ':' + req.status);
		}
	});
}





</script>


	
</body>
</html>