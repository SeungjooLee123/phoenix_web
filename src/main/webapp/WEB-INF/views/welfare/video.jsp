<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #popup-background{position: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: #000; opacity: 0.3; display: none; margin: 0 auto;}
   .addVideo{position: fixed; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); visibility: hidden; transform: scale(1.1); transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; }
   .video-main{position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background-color: #fff; padding: 1rem 1.5rem; width: 500px; height: 400px; border-radius: 0.5rem;}
   .video-main div{font-size: 13px;}
   
   .center {position: absolute; left:50%; top:50%; transform:translate(-50%, -50%); }
   .close-button{float: right; width: 1.5rem; line-height: 1.5rem; text-align: center; cursor: pointer; border-radius: 0.25rem; background-color: lightgray;}
   .close-button:hover{background-color: darkgray;}
   .btn-fill{border-radius: 5px; background: #8c88c9; color: #fff;}
   
   #category-ul{display: flex;}
	#category-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
	#category-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
	#category-ul li > a.btn-empty{background: #f5f5f5;}

.search{width: 900px; margin: 0 auto;}
#list-top {margin-bottom: 20px; margin-top: 20px;}
#list-top div { height: 36px; margin-top: 200px; margin-right: 20px;}
#list-top ul { margin: 0; display: flex; float: right;}
#list-top ul li:not(:first-child) { margin-left: 3px; }
#list-top ul:first-child { float: left;}
#list-top ul:last-child { float: right;}

ul.grid { width: 900px; display: inline-block; }
ul.grid li { float: left; width: 32%; height: 200px; margin: 20px 10px 0 0; 
		box-sizing: border-box; }
ul.grid li:nth-child(3n) {margin-right: 0;}
ul.grid li div {text-align: left; padding: 5px 10px; }
ul.grid li:nth-child(n+4){display: none;}

ul.grid2 { width: 900px; display: inline-block; }
ul.grid2 li { float: left; width: 32%; height: 200px; margin: 20px 10px 0 0; 
		box-sizing: border-box; }
ul.grid2 li div {text-align: left; padding: 5px 10px; }
ul.grid2 li:nth-child(n+4){display: none;}

#video1_point:hover{cursor: pointer;}
#video2_point:hover{cursor: pointer;}

</style>
</head>
<body>
	<div style="display: flex; width: 1300px; margin: 0 auto;">
      <div><jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/></div>
      <div style="width: 900px; margin-left: 95px; margin-top: 30px;">
      <div class="wrap_test">
         <h4 style="font-size: 25px; margin-left: 15px;">출산 정보</h4>
         <div class="wrap_video">
         	<ul class="grid">
         	<c:forEach var="vo" items="${list }">
         		<c:if test="${vo.category eq 'CHILDBIRTH' }">
         			<li>
         				<div><img src="https://img.youtube.com/vi/${vo.videopath }/mqdefault.jpg" style="margin-right: 20px; width: 270px; height: 157px; cursor: pointer;" class="img${vo.id }"/></div>
         				<div><h4 style="text-align: center; cursor: pointer;" class="img${vo.id }">${fn:substring(vo.explain , 0, 19) }</h4></div>
       					<c:if test="${loginInfo.admin eq 'Y' }">
       						<div><a style="float: right; display: inline-block; font-size: 13px;" id="modi" class="modify${vo.id }" href="delete_video.wel?no=${vo.id }">삭제</a></div>
       					</c:if>
         			</li>
         		</c:if>
         	</c:forEach>
         	</ul>
         	<div id="video1" style="margin: 60px auto;"><i id="video1_point" class="fas fa-angle-down" style="width: 900px; text-align: center; "></i></div>
         </div>
         
         <h4 style="margin-top: 50px; font-size: 25px; margin-left: 15px;">육아 정보</h4>
         <div class="wrap_video2">
         	<ul class="grid2">
         	<c:forEach var="vo" items="${list }">
         		<c:if test="${vo.category eq 'PARENTING' }">
         			<li>
         				<div><img src="https://img.youtube.com/vi/${vo.videopath }/mqdefault.jpg" style="margin-right: 20px; width: 270px; height: 157px; cursor: pointer;" class="img${vo.id }"/></div>
         				<div><h4 style="text-align: center; cursor: pointer;" class="img${vo.id }">${fn:substring(vo.explain , 0, 19) }</h4></div>
       					<c:if test="${loginInfo.admin eq 'Y' }">
       						<div><a style="float: right; display: inline-block; font-size: 13px;" id="modi" class="modify${vo.id }" href="delete_video.wel?no=${vo.id }"><i class="fa-solid fa-trash"></i></a></div>
       					</c:if>
         			</li>
         		</c:if>
         	</c:forEach>
         	</ul>
         	<div id="video2" style="margin: 60px auto;"><i id="video2_point" class="fas fa-angle-down" style="width: 900px; text-align: center;"></i></div>
         </div>
         
         <c:if test="${loginInfo.admin eq 'Y' }">
         	<a id="new_video" style="float: right; margin-right: 20px; padding: 10px; background: #f0efff; border: 1px solid #f0efff; border-radius: 3px; margin-top: 50px; cursor: pointer;"><i class="fa-solid fa-plus" style="margin-right: 5px;"></i>추가하기</a>
      </c:if>
      
      <div class="search">
	   <form action="video.wel" method="post" style="margin-top: 20px;" id="search_form">
	   <div id = 'list-top'>
	      <div>
	         <!-- 항목별 검색 처리 -->
	         <ul id="search_main">
	         	<li><input type="hidden" value="all" name="search"/></li>
	            <li><input type="text" style="padding: 10px; font: 16px;" name='keyword' value='${page.keyword }' class='w-px300' /></li>
	            <li class="btn-fill" style="padding: 10px; margin-left: 10px;"><a style='vertical-align: center; font: 16px;' onclick="$('#search_form').submit()">검색</a></li>
	         </ul>
	      </div>
	   </div>
	   </form>
	   </div>
      </div>
      <div class="addVideo">
      	<div class="video-main" style="text-align: center;">
      		<span class="close-button">&times;</span>
      		<h2 style="color: #030303; font-size: 16px;">동영상 추가</h2>
      		<div style="margin-top: 10px; width: 40%; margin-top: 15px;">카테고리</div>
      		<form action="video_add.wel" id="add_video" style="text-align: center;">
      			<input type="hidden" name="category" id="category"/>
	      		<ul id="category-ul" style="list-style: none; justify-content: space-around;  margin-top: 10px;">
	      			<li><a style="font-size: 16px;" class="btn-empty">출산</a></li>
	      			<li><a style="font-size: 16px;" class="btn-empty">육아</a></li>
	      		</ul>
	      		<div style="margin-top: 10px; width: 40%;  margin-top: 15px;">동영상 링크</div>
	      		<input type="text" placeholder="https://youtu.be/phwsjdmrb6w" id="videopath" name="videopath" style="padding: 8px; margin-top: 5px; width: 80%;  margin-top: 5px;" required="required"/>
	      		<div style="margin-top: 15px; width: 30%;">설명</div>
	      		<textarea placeholder="동영상에 대한 설명을 작성해주세요(100자 이내)" id="explain" name="explain" style="padding: 8px; margin-top: 5px; width: 80%; height: 100px; resize: none;" required="required"></textarea>
	      		<a style='display: inherit; margin: 0 auto; margin-top: 20px; width: 60px; padding: 5px;' onclick="insert_video()" class="btn-fill">추가</a>
      		</form>
      	</div>
      </div>
      </div>
      <div id="popup-background"></div>
      <div id="popup" class="center" style="vertical-align: middle;"></div>
   </div>
  
      <script type="text/javascript">
      $(document).on("click", "#video1_point", function(){
    	 var cntclass = $(this).attr("class");
    	 cntclass = cntclass.split(" ")[1];
    	 if(cntclass == "fa-angle-down"){
    		 $("ul.grid li:nth-child(n+3)").css("display", "block");
	    	 $("ul.grid li:nth-child(n+4)").css("marginTop", "50px");
	    	 document.getElementById("video1").innerHTML = '<i id="video1_point" class="fa-solid fa-angle-up" style="width: 900px; text-align: center;"></i>';
    	 } else{
    		 $("ul.grid li:nth-child(n+4)").css("display", "none");
    		 document.getElementById("video1").innerHTML = '<i id="video1_point" class="fas fa-angle-down" style="width: 900px; text-align: center;"></i>';
    	 }
      });
      
      $(document).on("click", "#video2_point", function(){
    	  var cntclass = $(this).attr("class");
    	  cntclass = cntclass.split(" ")[1];
    	  if(cntclass == "fa-angle-down"){
     		 $("ul.grid2 li:nth-child(n+3)").css("display", "block");
	     	 $("ul.grid2 li:nth-child(n+4)").css("marginTop", "50px");
	     	document.getElementById("video2").innerHTML = '<i id="video2_point" class="fa-solid fa-angle-up" style="width: 900px; text-align: center;"></i>';
     	 } else{
     		$("ul.grid2 li:nth-child(n+4)").css("display", "none");
     		document.getElementById("video2").innerHTML = '<i id="video2_point" class="fas fa-angle-down" style="width: 900px; text-align: center;"></i>';
     	 }
       });
      
         $(document).on('click', '.wrap_video img', function() {
        	 var indexs = $(this).attr("class");
        	 indexs = indexs.split(" ");
        	 <c:forEach var="vo" items="${list}">
        	 	if("${vo.id}" == indexs[0].split("g")[1]){
        	 		$('#popup, #popup-background').css('display', 'block');
        	 		$('#popup').html('<iframe width="1000" height="600" id="youtube" src="https://www.youtube.com/embed/${vo.videopath}?autoplay=1" title="YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	 	}
        	 </c:forEach>
        	});
         
         $(document).on('click', '.wrap_video2 img', function() {
        	 var indexs = $(this).attr("class");
        	 indexs = indexs.split(" ");
        	 <c:forEach var="vo" items="${list}">
        	 	if("${vo.id}" == indexs[0].split("g")[1]){
        	 		$('#popup, #popup-background').css('display', 'block');
        	 		$('#popup').html('<iframe width="1000" height="600" id="youtube" src="https://www.youtube.com/embed/${vo.videopath}?autoplay=1" title="YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	 	}
        	 </c:forEach>
        	});
         
         $(document).on('click', '.wrap_video h4', function() {
        	 var indexs = $(this).attr("class");
        	 indexs = indexs.split(" ");
        	 <c:forEach var="vo" items="${list}">
        	 	if("${vo.id}" == indexs[0].split("g")[1]){
        	 		$('#popup, #popup-background').css('display', 'block');
        	 		$('#popup').html('<iframe width="1000" height="600" id="youtube" src="https://www.youtube.com/embed/${vo.videopath}?autoplay=1" title="YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	 	}
        	 </c:forEach>
        	});
         
         $(document).on('click', '.wrap_video2 h4', function() {
        	 var indexs = $(this).attr("class");
        	 indexs = indexs.split(" ");
        	 <c:forEach var="vo" items="${list}">
        	 	if("${vo.id}" == indexs[0].split("g")[1]){
        	 		$('#popup, #popup-background').css('display', 'block');
        	 		$('#popup').html('<iframe width="1000" height="600" id="youtube" src="https://www.youtube.com/embed/${vo.videopath}?autoplay=1" title="YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	 	}
        	 </c:forEach>
        	});
         
        	$(document).on('click', '#popup-background', function() {
        	   $('#popup, #popup-background').css('display', 'none');
        	   $('#popup').html('<iframe id="test_click" width="1000" height="600" id="youtube" src="https://www.youtube.com/embed/lc1fVIK17Bg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        	}).on('click', '#popup-background', function (){
        		$('#popup , #popup-background' ).css('display', 'none');
        	});
        	
        	$("#new_video").click(function(){
        		$(".addVideo").css("visibility", "visible");
        	});
        	
        	$(".close-button").click(function(){
        		$(".addVideo").css("visibility", "hidden");
        	});
         
         $("#category-ul li").click(function(){
        	 var index_ca = $(this).index();
       		 $("#category-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
             $("#category-ul li>a").eq(index_ca).attr("class", "btn-fill");
             
             if(index_ca == 0){
            	 var cate = document.getElementById('category');
            	 cate.value = "CHILDBIRTH";
             } else{
            	 var cate = document.getElementById('category');
            	 cate.value = "PARENTING";
             }
         });
         
         function insert_video(){
        	 var cate = document.getElementById('category');
        	 if(cate.value == ''){
        		 alert("카테고리를 선택하세요!");
        		 return
        	 } else{
        		 $("#add_video").submit();
        	 }
         }
      </script>
   
</body>
</html>