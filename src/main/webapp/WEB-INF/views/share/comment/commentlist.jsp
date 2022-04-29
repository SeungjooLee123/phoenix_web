<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 댓글뿌리기 -->
<div class="asd">
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
				onclick="savebtn(this,${vo.comment_id},${vo.id});">수정</a>
				<a class="btn-fill-s btn-delete-cancel" 
				   onclick="canclebtn(this,${vo.comment_id},${vo.id});">삭제</a>
				
			</span>
		</c:if>
		<div class="original">${ fn:replace( fn:replace(vo.content, lf,'<br/>'), crlf, '<br/>') }</div>
		<div class="modify"></div>
		<c:if test="${loginInfo.id ne null }">	
			<span class="commentarea">
				<a onclick="co_coment(${vo.comment_id})">답글달기</a>
				<textarea style="display: none" id="co_co_text_${vo.comment_id}"></textarea>
				<a class="savebtn " style="display: none" id="co_co_regist_${vo.comment_id}"
				onclick="co_coment_regist(${vo.comment_id}, ${vo.id})">등록</a>
				<a class="cancelbtn modify" style="display: none" id="co_co_cancle_${vo.comment_id}"
				   onclick="display_atag(this);" >취소</a>
			</span>
		</c:if>
		
	</div>
	<hr>
</c:forEach>
</div>
 <script type="text/javascript">
 
 //대댓글 등록
 function co_coment_regist(comment_id, id) {
	//comment_id : 댓글번호, id : 글번호, user_id : 작성자
	   if (!confirm("답글을 작성 하시겠습니까?")) {
    } else {
	var text = $('#co_co_text_'+comment_id).val();
		$.ajax ({
			/* 경로 형태로 url  지정할꺼양 */
			url :	'share/co_comment/regist'			/* controller 호출  주소 형식 맵핑 */
			, data:	{ id : id , 
				      content: text,
				      comment_id : comment_id
				      }
					/* pid : 원 글의 id, 입력한 댓글  */
			, success : function ( res ) {
 				//location.href='community/comment/list?id='+id+"" ;
 				alert('detail');
 				location.href='detail.sh?id='+id+"";
 				
				
			}, 	error : function(req, text) {
				alert(text + " : " + req.status );
			}
		});
    }
}
 //클릭하면 보이게 
function co_coment(comment_id) {
	 $('#co_co_text_'+comment_id).css('display', 'inline');
	 $('#co_co_regist_'+comment_id).css('display', 'inline');
	 $('#co_co_cancle_'+comment_id).css('display', 'inline');	
}
 //수정/저장 버튼 처리
 function savebtn(tag , comment , id) {
	var $div = $(tag).closest('div');
	var thistext = $(tag).text();
		
	if( thistext == '수정'){
		var tag = "<textarea name=content style='width:96%; height:90%;' >"
		+ $div.children('.original').html().replace(/<br>/g,'\n') + "</textarea>"
		$div.children('.modify').html(tag);
		display_button(false, $div);
	}else if( thistext == '저장'){
		//alert($div.children('.modify').children('textarea').val());
		// a jax 로 바꿔야함
		location.href='comment_update.sh?comment_id='+comment +
						'&content='+ $div.children('.modify').children('textarea').val() +
						'&id=' + id;
	}
 }
 //삭제/취소 버튼 처리
 function canclebtn(tag , comment , id) {
	 	var $div = $(tag).closest('div');
	 	var $a = $(tag).closest('a');
		var thistext = $(tag).text();
		if( thistext == '취소'   ){
			display_button(true, $div);
			//display_button( $a);
		}else if ( thistext == '삭제'){
			if (!confirm("삭제하시겠습니까?")) {
		    } else {
				location.href='comment_delete.sh?comment_id='+comment + '&id=' + id;
		 	}
		} 
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
 
 
 function display_atag(tag) {
		var $div = $(tag).closest('div');
		$div.css('display' , 'none' );
}
 
 
 
 
 
</script>
 
 
 
 
 