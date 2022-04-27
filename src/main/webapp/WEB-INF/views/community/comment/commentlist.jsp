<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 댓글뿌리기 -->
<c:forEach items="${list}" var="vo" varStatus="status">


	<input type="hidden" name="comment_id" value="${vo.comment_id }">
	<input type="hidden" name="id" value="${vo.id }">
	
	${status.index eq 0 ? '<hr>' : '' }	<!-- 첫 번째 순서 값에 hr 태그 부여 -->
	<div class="left" >
		${vo.user_id} [${vo.write_date }]
		
		<!-- 로그인한 사용자가 작성한 댓글인 경우 수정/삭제 가능 -->
		<c:if test="${loginInfo.id eq vo.user_id }">
			<span style=" float: right; ">
				<a class="btn-fill-s btn-modify-save"
				onclick="saveLog(this,${vo.comment_id},${vo.id});"
				>수정</a>
				<a class="btn-fill-s btn-delete-cancel" 
				   onclick="test(this,${vo.comment_id},${vo.id});">삭제</a>
			</span>
		</c:if>
		
		<div class="original">${ fn:replace( fn:replace(vo.content, lf,'<br/>'), crlf, '<br/>') }</div>
		<div class="modify"></div>
		
	</div>
	<hr>
</c:forEach>

 <script type="text/javascript">
 
 function saveLog(tag , comment , id) {

	var $div = $(tag).closest('div');
	var thistext = $(tag).text();
	alert(thistext);
	/* .closest() 메소드는 자신을 포함한 상위 요소 주에서 전달받은
		선택자에 해당하는 요소의 집합에서 가장 첫 번째 요소를 선택! */
		
	if( thistext == '수정'){
		var tag = "<textarea name=content style='width:96%; height:90%;' >"
		+ $div.children('.original').html().replace(/<br>/g,'\n') + "</textarea>"
		$div.children('.modify').html(tag);
		// 수정 상태(false) : 저장/취소 , 보기/상태(true) : 수정/삭제 버튼
		display_button(false, $div);
	}else if( thistext == '저장'){
		alert($div.children('.modify').children('textarea').val());
		location.href='comment_update.co?comment_id='+comment +
						'&content='+ $div.children('.modify').children('textarea').val() +
						'&id=' + id;
		//var vo = '${vo.id}';
	//	$('#comment_form').submit();
	}
 }
 
 function test(tag , comment , id) {
	 	var $div = $(tag).closest('div');
		var thistext = $(tag).text();
		if( thistext == '취소'){
			display_button(true, $div);
		}else if ( thistext == '삭제'){
			if (!confirm("삭제하시겠습니까?")) {
		    } else {
				location.href='comment_delete.co?comment_id='+comment + '&id=' + id;
		 	}
		} 
	 
	 
	 //alert(tag.text);
	}



 $('.btn-modify-cancel').on('click', function (){
		var $div = $(this).closest('div');
	
	});
 
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
 
 
 
 
 