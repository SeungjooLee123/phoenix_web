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
<title>๋งต</title>
<style type="text/css">
#map-ul{display: flex; position: relative;}
#map-ul>li>a{display: block; font-size: 14px;}
.map-main{margin-top: 30px;}
#map-ul li > a{display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
#map-ul li > a.btn-fill{background: #c3bfff; color: #fff;}
#map-ul li > a.btn-empty{background: #f5f5f5;}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'๋์',sans-serif;font-size:12px;}
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
.check{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
.not_check{color: #505050; margin: 22px 0px; font-size: 15px;}
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
					<select id="sido"><option value="11">์์ธํน๋ณ์</option></select>
					<select id="sigugun"><option value="">์?ํ</option></select>
					<select id="dong"><option value="">์?ํ</option></select>
				</div>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces('์์๊ณผ', '์์ธํน๋ณ์'); return false;"></form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div> <!-- ํ์ด์ง ๋ฒํธ -->
				    </div>
				</div>
			</div>
			<script type="text/javascript">
			var category = "์์๊ณผ";
			var sido = "";
			var sigugun = "";
			var dong = "";
			
			$(".map ul>li").click(function(){
				var indexs = $(this).index();
				$(".map ul>li:nth-child(1) a").attr("class", "check");
				if(indexs == 0 || indexs == 1){
					$(".map ul>li:nth-child(2) a").attr("class", "check");
					$(".map ul>li:nth-child(3) a").attr("class", "not_check");
					$(".map ul>li:nth-child(4) a").attr("class", "not_check");
					$(".map ul>li:nth-child(5) a").attr("class", "not_check");
				} else if(indexs == 2){
					$(".map ul>li:nth-child(3) a").attr("class", "check");
					$(".map ul>li:nth-child(2) a").attr("class", "not_check");
					$(".map ul>li:nth-child(4) a").attr("class", "not_check");
					$(".map ul>li:nth-child(5) a").attr("class", "not_check");
				} else if(indexs == 3){
					$(".map ul>li:nth-child(4) a").attr("class", "check");
					$(".map ul>li:nth-child(3) a").attr("class", "not_check");
					$(".map ul>li:nth-child(2) a").attr("class", "not_check");
					$(".map ul>li:nth-child(5) a").attr("class", "not_check");
				} else if(indexs == 4){
					$(".map ul>li:nth-child(5) a").attr("class", "check");
					$(".map ul>li:nth-child(3) a").attr("class", "not_check");
					$(".map ul>li:nth-child(2) a").attr("class", "not_check");
					$(".map ul>li:nth-child(4) a").attr("class", "not_check");
				}
			});
			
			$(".map ul>li:not(:first-of-type)").css("display", "block");
					
			jQuery(document).ready(function(){
				jQuery("#sido").empty();
				jQuery.each(hangjungdong.sido, function(idx, code){
					jQuery("#sido").append(fn_option(code.sido, code.codeNm));
				});
				sido = jQuery("#sido option:selected");
				jQuery("#sigugun").empty();
				jQuery("#sigugun").append(fn_option('', '์?ํ'));
				jQuery.each(hangjungdong.sigugun, function(idx, code){
					if(jQuery("#sido > option:selected").val() == code.sido){
						jQuery("#sigugun").append(fn_option(code.sigugun, code.codeNm));
					}
				});
				//์๋
				jQuery('#sido').change(function(){
					jQuery("#sigugun").show();
					jQuery("#sigugun").empty();
					jQuery("#sigugun").append(fn_option('', '์?ํ'));
					jQuery("#dong").empty();
					jQuery("#dong").append(fn_option('', '์?ํ'));
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
				//์๊ตฐ๊ตฌ
				jQuery("#sigugun").change(function(){
					jQuery("#dong").empty();
					jQuery.each(hangjungdong.dong, function(idx, code){
						if(jQuery("#sido > option:selected").val() == code.sido && jQuery("#sigugun > option:selected").val() == code.sigugun)
							jQuery("#dong").append(fn_option(code.dong, code.codeNm));
					});
					jQuery("#dong").prepend(fn_option('', '์?ํ'));
					jQuery("#dong option:eq('')").attr('selected', 'selected');
					sigugun = jQuery("#sigugun option:selected");
					if(sigugun.text()=="์?ํ"){
						searchPlaces(category, sido.text());
					} else{
						searchPlaces(category, sido.text() + " " + sigugun.text());
					}
				});
				//ํ์?๋
				jQuery("#dong").change(function(){
					dong = jQuery("#dong option:selected");
					if(dong.text()=="์?ํ"){
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
						category = "์์๊ณผ";
					} else if(mapItem == 2){
						category = "ํค์ฆ์นดํ";
					} else if(mapItem == 3){
						category = "์ด๋ฆฐ์ด์ง";
					} else if(mapItem == 4){
						category = "์?์์ฉํ";
					}
					if(!sigugun || sigugun.text() == "์?ํ"){
						searchPlaces(category, sido.text());
					} else if(!dong || dong.text() == "์?ํ"){
						searchPlaces(category, sido.text() + " " + sigugun.text());
					} else{
						searchPlaces(category, sido.text() + " " + sigugun.text() + " " + dong.text());
					}
				});
			});
			
			// ๋ง์ปค๋ฅผ ํด๋ฆญํ์ ๋ ํด๋น ์ฅ์์ ์์ธ์?๋ณด๋ฅผ ๋ณด์ฌ์ค ์ปค์คํ์ค๋ฒ๋?์ด์๋๋ค
			var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
			    contentNode = document.createElement('div'), // ์ปค์คํ ์ค๋ฒ๋?์ด์ ์ปจํ์ธ? ์๋ฆฌ๋จผํธ ์๋๋ค 
			    markers = []; // ๋ง์ปค๋ฅผ ๋ด์ ๋ฐฐ์ด์๋๋ค

			var mapContainer = document.getElementById('map'), // ์ง๋๋ฅผ ํ์ํ? div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ์ง๋์ ์ค์ฌ์ขํ
			        level: 10 // ์ง๋์ ํ๋ ๋?๋ฒจ
			    };

			// ์ง๋๋ฅผ ์์ฑํฉ๋๋ค    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// ์ฅ์ ๊ฒ์ ๊ฐ์ฒด๋ฅผ ์์ฑํฉ๋๋ค
			var ps = new kakao.maps.services.Places();  

			// ์ปค์คํ ์ค๋ฒ๋?์ด์ ์ปจํ์ธ? ๋ธ๋์ css class๋ฅผ ์ถ๊ฐํฉ๋๋ค 
			contentNode.className = 'placeinfo_wrap';

			// ์ปค์คํ ์ค๋ฒ๋?์ด์ ์ปจํ์ธ? ๋ธ๋์ mousedown, touchstart ์ด๋ฒคํธ๊ฐ ๋ฐ์ํ์๋
			// ์ง๋ ๊ฐ์ฒด์ ์ด๋ฒคํธ๊ฐ ์?๋ฌ๋์ง ์๋๋ก ์ด๋ฒคํธ ํธ๋ค๋ฌ๋ก kakao.maps.event.preventMap ๋ฉ์๋๋ฅผ ๋ฑ๋กํฉ๋๋ค 
			addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

			// ์ปค์คํ ์ค๋ฒ๋?์ด ์ปจํ์ธ?๋ฅผ ์ค์?ํฉ๋๋ค
			placeOverlay.setContent(contentNode);
			
			function addEventHandle(target, type, callback) {
			    if (target.addEventListener) {
			        target.addEventListener(type, callback);
			    } else {
			        target.attachEvent('on' + type, callback);
			    }
			}

			// ํค์๋๋ก ์ฅ์๋ฅผ ๊ฒ์ํฉ๋๋ค
			searchPlaces('์์๊ณผ', '์์ธํน๋ณ์');

			// ํค์๋ ๊ฒ์์ ์์ฒญํ๋ ํจ์์๋๋ค
			function searchPlaces(category, address) {
			    // ์ฅ์๊ฒ์ ๊ฐ์ฒด๋ฅผ ํตํด ํค์๋๋ก ์ฅ์๊ฒ์์ ์์ฒญํฉ๋๋ค
			    placeOverlay.setMap(null);
			    ps.keywordSearch(address + " " + category, placesSearchCB); 
			}

			// ์ฅ์๊ฒ์์ด ์๋ฃ๋์ ๋ ํธ์ถ๋๋ ์ฝ๋ฐฑํจ์ ์๋๋ค
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        // ์?์์?์ผ๋ก ๊ฒ์์ด ์๋ฃ๋์ผ๋ฉด ๊ฒ์ ๋ชฉ๋ก๊ณผ ๋ง์ปค๋ฅผ ํ์ถํฉ๋๋ค
			        displayPlaces(data);

			        // ํ์ด์ง ๋ฒํธ๋ฅผ ํ์ถํฉ๋๋ค
			        displayPagination(pagination);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			        alert('๊ฒ์ ๊ฒฐ๊ณผ๊ฐ ์กด์ฌํ์ง ์์ต๋๋ค.');
			        return;
			    } else if (status === kakao.maps.services.Status.ERROR) {
			        alert('๊ฒ์ ๊ฒฐ๊ณผ ์ค ์ค๋ฅ๊ฐ ๋ฐ์ํ์ต๋๋ค.');
			        return;
			    }
			}

			// ๊ฒ์ ๊ฒฐ๊ณผ ๋ชฉ๋ก๊ณผ ๋ง์ปค๋ฅผ ํ์ถํ๋ ํจ์์๋๋ค
			function displayPlaces(places) {
			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // ๊ฒ์ ๊ฒฐ๊ณผ ๋ชฉ๋ก์ ์ถ๊ฐ๋ ํญ๋ชฉ๋ค์ ์?๊ฑฐํฉ๋๋ค
			    removeAllChildNods(listEl);

			    // ์ง๋์ ํ์๋๊ณ? ์๋ ๋ง์ปค๋ฅผ ์?๊ฑฐํฉ๋๋ค
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {
			        // ๋ง์ปค๋ฅผ ์์ฑํ๊ณ? ์ง๋์ ํ์ํฉ๋๋ค
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // ๊ฒ์ ๊ฒฐ๊ณผ ํญ๋ชฉ Element๋ฅผ ์์ฑํฉ๋๋ค

			        // ๊ฒ์๋ ์ฅ์ ์์น๋ฅผ ๊ธฐ์ค์ผ๋ก ์ง๋ ๋ฒ์๋ฅผ ์ฌ์ค์?ํ๊ธฐ์ํด LatLngBounds ๊ฐ์ฒด์ ์ขํ๋ฅผ ์ถ๊ฐํฉ๋๋ค
			        bounds.extend(placePosition);

			        // ๋ง์ปค์ ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ์ mouseover ํ์๋ ํด๋น ์ฅ์์ ์ธํฌ์๋์ฐ์ ์ฅ์๋ช์ ํ์ํฉ๋๋ค mouseout ํ์ ๋๋ ์ธํฌ์๋์ฐ๋ฅผ ๋ซ์ต๋๋ค
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

			    // ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ๋ค์ ๊ฒ์๊ฒฐ๊ณผ ๋ชฉ๋ก Element์ ์ถ๊ฐํฉ๋๋ค
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;

			    // ๊ฒ์๋ ์ฅ์ ์์น๋ฅผ ๊ธฐ์ค์ผ๋ก ์ง๋ ๋ฒ์๋ฅผ ์ฌ์ค์?ํฉ๋๋ค
			    map.setBounds(bounds);
			}

			// ๊ฒ์๊ฒฐ๊ณผ ํญ๋ชฉ์ Element๋ก ๋ฐํํ๋ ํจ์์๋๋ค
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

			// ๋ง์ปค๋ฅผ ์์ฑํ๊ณ? ์ง๋ ์์ ๋ง์ปค๋ฅผ ํ์ํ๋ ํจ์์๋๋ค
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ๋ง์ปค ์ด๋ฏธ์ง url, ์คํ๋ผ์ดํธ ์ด๋ฏธ์ง๋ฅผ ์๋๋ค
			        imageSize = new kakao.maps.Size(36, 37),  // ๋ง์ปค ์ด๋ฏธ์ง์ ํฌ๊ธฐ
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // ์คํ๋ผ์ดํธ ์ด๋ฏธ์ง์ ํฌ๊ธฐ
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ์คํ๋ผ์ดํธ ์ด๋ฏธ์ง ์ค ์ฌ์ฉํ? ์์ญ์ ์ข์๋จ ์ขํ
			            offset: new kakao.maps.Point(13, 37) // ๋ง์ปค ์ขํ์ ์ผ์น์ํฌ ์ด๋ฏธ์ง ๋ด์์์ ์ขํ
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // ๋ง์ปค์ ์์น
			            image: markerImage 
			        });

			    marker.setMap(map); // ์ง๋ ์์ ๋ง์ปค๋ฅผ ํ์ถํฉ๋๋ค
			    markers.push(marker);  // ๋ฐฐ์ด์ ์์ฑ๋ ๋ง์ปค๋ฅผ ์ถ๊ฐํฉ๋๋ค

			    return marker;
			}

			// ์ง๋ ์์ ํ์๋๊ณ? ์๋ ๋ง์ปค๋ฅผ ๋ชจ๋ ์?๊ฑฐํฉ๋๋ค
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ )
			        markers[i].setMap(null);
			    markers = [];
			}

			// ๊ฒ์๊ฒฐ๊ณผ ๋ชฉ๋ก ํ๋จ์ ํ์ด์ง๋ฒํธ๋ฅผ ํ์๋ ํจ์์๋๋ค
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			      	 i; 

			    // ๊ธฐ์กด์ ์ถ๊ฐ๋ ํ์ด์ง๋ฒํธ๋ฅผ ์ญ์?ํฉ๋๋ค
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

			// ๊ฒ์๊ฒฐ๊ณผ ๋ชฉ๋ก ๋๋ ๋ง์ปค๋ฅผ ํด๋ฆญํ์ ๋ ํธ์ถ๋๋ ํจ์์๋๋ค. ์ธํฌ์๋์ฐ์ ์ฅ์๋ช์ ํ์ํฉ๋๋ค
			function displayPlaceInfo (place) {
			    var content = '<div class="placeinfo">' +
			                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
			
			    if (place.road_address_name) {
			        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
			                    '  <span class="jibun" title="' + place.address_name + '">(์ง๋ฒ : ' + place.address_name + ')</span>';
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

			 // ๊ฒ์๊ฒฐ๊ณผ ๋ชฉ๋ก์ ์์ Element๋ฅผ ์?๊ฑฐํ๋ ํจ์์๋๋ค
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