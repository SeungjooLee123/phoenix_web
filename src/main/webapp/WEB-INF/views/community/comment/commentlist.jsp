<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach items="${list}" var="vo" varStatus="status">
	${status.index eq 0 ? '<hr>' : '' }	<!-- 첫 번째 순서 값에 hr 태그 부여 -->
	<div class="left">
		${vo.name} [${vo.writedate }]
		
		<!-- 로그인한 사용자가 작성한 댓글인 경우 수정/삭제 가능 -->
		<c:if test="${loginInfo.id eq vo.writer }">
			<span style=" float: right; ">
				<a class="btn-fill-s btn-modify-save"   >수정</a>
				<a class="btn-fill-s btn-delete-cancel" >삭제</a>
			</span>
		</c:if>
		
		<div class="original">${ fn:replace( fn:replace(vo.content, lf,'<br/>'), crlf, '<br/>') }</div>
		<div class="modify"></div>
		
	</div>
	<hr>
</c:forEach>
 <script type="text/javascript">
$('.btn-modify-save').on('click', function (){
	var $div = $(this).closest('div');
	/* .closest() 메소드는 자신을 포함한 상위 요소 주에서 전달받은
		선택자에 해당하는 요소의 집합에서 가장 첫 번째 요소를 선택! */
		
		if( $(this).text() == '수정'){
			var tag = "<textarea style='width:96%; height:90%;' >"
			+ $div.children('.original').html().replace(/<br>/g,'\n') + "</textarea>"
			$div.children('.modify').html(tag);
			// 수정 상태(false) : 저장/취소 , 보기/상태(true) : 수정/삭제 버튼
			display_button(false, $div);
		}
	
})
 
 /* 버튼이 보여지는 형태(텍스트) 변경 */
 function display_button(mode, div){
	/* 특정 태그의 자식 요소를 찾을 땐 children을 사용할 수 있지만 
		자손인 경우엔 find 로 찾을 수 있음*/
	div.find('.btn-modify-save').text(mode ? '수정' : '저장' );
	div.find('.btn-delete-cancel').text(mode ? '삭제' : '취소');
	
	//수정상태 : .original 안보이게 , modify 보이게
	//보기상태 : .original 보이게, .modify 안 보이게
	div.children('.original').css('display' , mode ? 'block' : 'none');
	div.children('.modify').css('display' , mode ? 'none' : 'block');
}
 
 
</script>
 
 
 
 
 