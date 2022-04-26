<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime() %>'></script>  <!--파일 미리보기 필요함  -->
</head>
<body>
<section id="detail" style="width: 1300px; margin: 0 auto;">





<h1>${vo.user_id }님의 문의내역</h1>

<h3>${vo.share_date }</h3>
<h3>${vo.category }</h3>
<h3>${vo.title }</h3>
<h3>${vo.content }</h3>
<c:if test="${ ! empty vo.filename }">
	<h3>${vo.filename }</h3>
	<a href="download.bo?id=${vo.id }"><i class="fa-solid fa-download"></i></a>
</c:if>
<h3>${vo.id} </h3>
<a href='admin'>목록으로</a>

</section>
<script type="text/javascript">
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