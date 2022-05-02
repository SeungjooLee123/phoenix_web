<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5cb6fd9501609d98a3bbdf85a92ef53e&libraries=services"></script>
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
        function getLocation(position) {

            var latitud = position.coords.latitude;
            var longitude = position.coords.longitude;
            
            console.log(latitud + "," + longitude);
        
            var mapContainer = document.getElementById("map")    // 지도를 표시할 DIV
            var mapOption = {
                  center : new daum.maps.LatLng(latitud, longitude)    // 지도의 중심좌표
                , level : 3    // 지도의 확대레벨
            };
            
            // 지도를 생성
            var map = new daum.maps.Map(mapContainer, mapOption);

            // 마커가 표시될 위치
            var markerPosition = new daum.maps.LatLng(latitud, longitude);

            // 마커를 생성
            var marker = new daum.maps.Marker({ position:markerPosition });

            marker.setMap(map);
        }

        if(navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(getLocation, function(error) {
                console.log(error.message);    
            });
        } else {
            console.log("Geolocation을 지원하지 않는 브라우저 입니다.");
        }
    });

	</script>
</body>
</html>