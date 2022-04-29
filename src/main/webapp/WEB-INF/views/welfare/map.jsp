<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cb6fd9501609d98a3bbdf85a92ef53e&libraries=services"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<title>맵</title>
<style type="text/css">
#map-ul{display: flex; position: relative;}
#map-ul>li>a{display: block; font-size: 14px;}
.map-main{margin-top: 30px;}
#map-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
#map-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
#map-ul li > a.btn-empty{background: #f5f5f5;}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:650px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #c3bfff;background: #c3bfff url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
.map ul>li:nth-child(1) a{color: #000; font-weight: 700; border-bottom: 1px solid #000;}

#address{text-align: right;}
.map_wrap{margin: 15px 0;}
#address select{height: 30px;}
#mapcontainer{width: 1050px; margin-left: 95px; margin-top: 50px;}
</style>
</head>
<body>
<div style="display: flex; width: 1300px; margin: 0 auto;">
	<div>
		<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
	</div>
	<div id="mapcontainer">
		<div>
			<div class="map-main">
				<div id="address">
					<select id="sido"><option value="11">서울특별시</option></select>
					<select id="sigugun"><option value="">선택</option></select>
					<select id="dong"><option value="">선택</option></select>
				</div>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces('소아과', '서울특별시'); return false;"></form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div> <!-- 페이지 번호 -->
				    </div>
				</div>
			</div>
			<script type="text/javascript">
			var category = "소아과";
			var sido = "";
			var sigugun = "";
			var dong = "";
			
			$(".map ul>li:not(:first-of-type)").css("display", "block");
					
			jQuery(document).ready(function(){
				jQuery("#sido").empty();
				jQuery.each(hangjungdong.sido, function(idx, code){
					jQuery("#sido").append(fn_option(code.sido, code.codeNm));
				});
				sido = jQuery("#sido option:selected");
				jQuery("#sigugun").empty();
				jQuery("#sigugun").append(fn_option('', '선택'));
				jQuery.each(hangjungdong.sigugun, function(idx, code){
					if(jQuery("#sido > option:selected").val() == code.sido){
						jQuery("#sigugun").append(fn_option(code.sigugun, code.codeNm));
					}
				});
				//시도
				jQuery('#sido').change(function(){
					jQuery("#sigugun").show();
					jQuery("#sigugun").empty();
					jQuery("#sigugun").append(fn_option('', '선택'));
					jQuery("#dong").empty();
					jQuery("#dong").append(fn_option('', '선택'));
					jQuery.each(hangjungdong.sigugun, function(idx, code){
						if(jQuery("#sido > option:selected").val() == code.sido){
							jQuery("#sigugun").append(fn_option(code.sigugun, code.codeNm));
						}
					});
					if(jQuery("#sido option:selected").val() == '36'){
						jQuery("#sigugun").hide();
						jQuery("#sigugun option:eq(1)").attr('selected', 'selected');
						jQuery("#sigugun").trigger("change");
					}
					sido = jQuery("#sido option:selected");
					searchPlaces(category, sido.text());
				});
				//시군구
				jQuery("#sigugun").change(function(){
					jQuery("#dong").empty();
					jQuery.each(hangjungdong.dong, function(idx, code){
						if(jQuery("#sido > option:selected").val() == code.sido && jQuery("#sigugun > option:selected").val() == code.sigugun)
							jQuery("#dong").append(fn_option(code.dong, code.codeNm));
					});
					jQuery("#dong").prepend(fn_option('', '선택'));
					jQuery("#dong option:eq('')").attr('selected', 'selected');
					sigugun = jQuery("#sigugun option:selected");
					if(sigugun.text()=="선택"){
						searchPlaces(category, sido.text());
					} else{
						searchPlaces(category, sido.text() + " " + sigugun.text());
					}
				});
				//행정동
				jQuery("#dong").change(function(){
					dong = jQuery("#dong option:selected");
					if(dong.text()=="선택"){
						searchPlaces(category, sido.text() + " " + sigugun.text());
					} else{
						searchPlaces(category, sido.text() + " " + sigugun.text() + " " + dong.text());
					}
				});
			});
			
			function fn_option(code, name) { 
				if(code == 11)
					return '<option value="' + code + '"selected>' + name + '</option>';
				return '<option value="' + code + '">' + name + '</option>';
			}
			
			$(function(){
				$(".map ul>li").click(function(){
					console.log("click");
					var mapItem = $(this).index();
					if(mapItem == 1){
						category = "소아과";
					} else if(mapItem == 2){
						category = "키즈카페";
					} else if(mapItem == 3){
						category = "어린이집";
					} else if(mapItem == 4){
						category = "유아용품";
					}
					if(!sigugun || sigugun.text() == "선택"){
						searchPlaces(category, sido.text());
					} else if(!dong || dong.text() == "선택"){
						searchPlaces(category, sido.text() + " " + sigugun.text());
					} else{
						searchPlaces(category, sido.text() + " " + sigugun.text() + " " + dong.text());
					}
				});
			});
			// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
			var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
			    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			    markers = []; // 마커를 담을 배열입니다

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 10 // 지도의 확대 레벨
			    };

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  

			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);
			
			function addEventHandle(target, type, callback) {
			    if (target.addEventListener) {
			        target.addEventListener(type, callback);
			    } else {
			        target.attachEvent('on' + type, callback);
			    }
			}

			// 키워드로 장소를 검색합니다
			searchPlaces('소아과', '서울특별시');

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces(category, address) {
			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    placeOverlay.setMap(null);
			    ps.keywordSearch(address + " " + category, placesSearchCB); 
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        // 정상적으로 검색이 완료됐으면 검색 목록과 마커를 표출합니다
			        displayPlaces(data);

			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			        alert('검색 결과가 존재하지 않습니다.');
			        return;
			    } else if (status === kakao.maps.services.Status.ERROR) {
			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;
			    }
			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);

			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {
			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해 LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);

			        // 마커와 검색결과 항목에 mouseover 했을때 해당 장소에 인포윈도우에 장소명을 표시합니다 mouseout 했을 때는 인포윈도우를 닫습니다
			        (function(marker, place) {
			            kakao.maps.event.addListener(marker, 'click', function() {
			                displayPlaceInfo(place);
			            });
			            
			            itemEl.onclick = function(){
			            	placeOverlay.setMap(null);
			            	map.relayout();
			            	map.setCenter(marker.getPosition());
			            };
			        })(marker, places[i]);
			        fragment.appendChild(itemEl);
			    }

			    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;

			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';

			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           

			                
			    el.innerHTML = itemStr;
			    el.className = 'item';

			    return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });

			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

			    return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ )
			        markers[i].setMap(null);
			    markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			      	 i; 

			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }

			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;

			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }

			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다. 인포윈도우에 장소명을 표시합니다
			function displayPlaceInfo (place) {
			    var content = '<div class="placeinfo">' +
			                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
			
			    if (place.road_address_name) {
			        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
			                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
			    }  else {
			        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
			    }                
			   
			    content += '    <span class="tel">' + place.phone + '</span>' + 
			                '</div>' + 
			                '<div class="after"></div>';
			
			    contentNode.innerHTML = content;
			    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			    placeOverlay.setMap(map);  
			}

			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
			</script>
		</div>
	</div>
</div>
</body>
</html>