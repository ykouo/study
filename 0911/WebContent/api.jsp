<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API Test</title>
<style type="text/css">
#map {
	width: 500px; /*가로*/
	height: 400px; /*세로*/
	border: 2px dotted tomato; /*테두리선*/
}

button {
	color: gold;
	background: tomato;
}
</style>
<script src="http://maps.google.com/maps/api/js?key=&region=kr"></script>
</head>
<body>
	<h1>API TEST</h1>
	<hr color="gold">
	<div id="map"></div>
	<hr color="gold">
	<button id="btn1">지도변경1</button>
	<button id="btn2">newMap</button>
	<button id="btn3">다중마크업</button>
	<button id="btn4">말풍선</button>
	
	<script type="text/javascript">
		
		var btn1 = document.getElementById("btn1");
		var btn2 = document.getElementById("btn2");
		var btn3 = document.getElementById("btn3");
		var btn4 = document.getElementById("btn4");
		
		btn1.addEventListener("click", changeMap);
		btn2.addEventListener("click", newMap);
		btn3.addEventListener("click", multipleMarker);
		btn4.addEventListener("click", initialize);
		var map;
		var Icon = new google.maps.MarkerImage("images/icon.png");

		
		// GoogleMAP 등록
		function initMap(){
			var ll = {
					lat:37.49988,
					lng:127.02701
			};
			map=new google.maps.Map
			(document.getElementById("map"),{
				zoom:17,
				center:ll
			}
		);
		new google.maps.Marker({
			position:ll,
			map:map,
			label:"내 현재 위치"
		});	
		}
		initMap();
		
		
		// 지도의 중심을 변경하는 작업 
		 function changeMap() {
			var ll = {
					lat : 37.37214,
					lng : 126.94342
			};
			map.panTo(ll);
			map.setZoom(9);
		} 
		// 새로운 지도 
		function newMap() {
			var ll = {
				lat : 37.35770,
				lng : 126.93238
			};
			map = new google.maps.Map(document.getElementById("map"), {
				zoom : 13,
				center : ll
			});
		} 

		// 다중마크업 
		function multipleMarker() {
			var location = [{place : "바비레드 강남본점",lat : "37.50346",lng : "127.02842"}, {place : "마초쉐프 강남본점",lat : "37.50420",lng : "127.02809"}, {place : "딘타이펑 강남역점",lat : "37.49934",lng : "127.02577"}, {place : "이춘복 참치&스시 강남점",lat : "37.49906",lng : "127.02563"}];
			for (var i = 0; i < location.length; i++) {
				var marker = new google.maps.Marker({
					map : map,
					position : new google.maps.LatLng(location[i].lat,
							location[i].lng),
					label : location[i].place,
					icon: Icon 
				});
			}
		} 
		
		function initialize(){
			var ll = new google.maps.LatLng(37.49669,127.02391);
			var MapOptions={
					zoom:17,
					center:ll
			}
			var map = new google.maps.Map(document.getElementById('map'), MapOptions);
			var memo = '<div style="width:100px;height:50px;">역삼역</div>';
			var infowindow = new google.maps.InfoWindow({
				content: memo,
				size:new google.maps.Size(200,100)
			});
			var marker= new google.maps.Marker({
				position:ll,
				map:map
			});
			google.maps.event.addListener(marker,'click',function(){
				infowindow.open(map,marker);
			});	
		}
		google.maps.event.addDomListener(window, 'load', initialize);
 
	</script>

</body>
</html>