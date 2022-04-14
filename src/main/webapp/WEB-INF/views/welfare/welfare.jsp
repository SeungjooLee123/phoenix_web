<%@page import="java.util.Date"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?v=<%=new Date().getTime()%>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cb6fd9501609d98a3bbdf85a92ef53e&libraries=services"></script>
<title>육아정보</title>
<style type="text/css">
#container {
	width: 1440px;
	margin :0 auto;
}
#cate-ul{
	display: flex;
}
#cate-ul>li{
	margin: 10px;
}
#cate_ul > li > a{
	display: block;
}
a.btn-empty{
	text-align: center;
	padding: 10px 13px;
	border-radius: 20px;
	background: #e0e0e0;
}
#map-ul{
	display: flex;
}
#map-ul>li{
	margin: 10px;
}
#map-ul>li>a{
	display: block;
}
</style>


</head>
<body>
<%! String code = ""; %>
	<div id='container'>
		<h3>육아정보</h3>
		<div id="wrap_cate">
			<ul id="cate-ul">
				<li><a class="btn-empty">출산정책</a></li>
				<li><a class="btn-empty">육아정책</a></li>
				<li><a class="btn-empty">통계자료</a></li>
				<li><a class="btn-empty" id="map-search">주변장소검색</a></li>
			</ul>
		</div>
		<div id="main-content">
			<div></div>
			<div></div>
			<div></div>
			<div>
				<ul id='map-ul'>
					<li><a class="btn-empty" onclick="map_code()">병원</a></li>
					<li><a class="btn-empty" onclick="map_code()">키즈카페</a></li>
					<li><a class="btn-empty" onclick="map_code()">어린이집</a></li>
					<li><a class="btn-empty" onclick="map_code()">육아용품</a></li>
				</ul>
				<div id="map" style="width:100%;height:600px;"></div>
				<script>
				$(function(){
					$("#cate-ul li").click(function(){
						var tabItem = $(this).index();
						$("#main-content>div").eq(tabItem).show().siblings('div').hide();
					});
				});
				var code = "";
				function map_code(){
					var mapItem = $("#map-ul li").index();
					if(mapItem.eq("0")){
						code = "소아과";
					} else if(mapItem.eq("1")){
						code = "키즈카페";
					} else if(mapItem.eq("2")){
						code = "어린이집";
					} else{
						code = "육아용품";
					}
				}
				
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(); 
				
				// 키워드로 장소를 검색합니다
				ps.keywordSearch("소아과", placesSearchCB); 
				
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				        // LatLngBounds 객체에 좌표를 추가합니다
				        var bounds = new kakao.maps.LatLngBounds();
				
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       
				
				        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				        map.setBounds(bounds);
				    } 
				}
				
				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });
				
				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				    });
				}
				</script>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>