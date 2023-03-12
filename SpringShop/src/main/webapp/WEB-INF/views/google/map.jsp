<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #map {
    height: 100%;
  }
  .top{
    height: 80%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
</head>
<body>
	구글 맵 출력 예정
	<div class="container top">
		<div class="row mt-2 top">
			<div div class="col-md-3 border top">
				좌		
				<div class="form-group mt-2">
					<button id="bt_geo" type="button" class="btn btn-danger">Geo</button>
				</div>		
			</div>
		
			<div class="col-md-9 border top">
				<div id="map">
			
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	//let map=new google.maps.Map(document.getElementById("map"), mapProp);
	
	// 1) 맵 초기 콜백 함수 
	function initMap(){
		let map = new google.maps.Map(document.getElementById('map'), {
			  center: new google.maps.LatLng(37.556436, 126.945207),
			  zoom: 14
			});
		
		
		// 선그리기
		  const flightPlanCoordinates = [
			    { lat: 37.772, lng: -122.214 },
			    { lat: 21.291, lng: -157.821 },
			    { lat: -18.142, lng: 178.431 },
			    { lat: -27.467, lng: 153.027 },
			  ];
		
			let test=[
				{lat : 37.56288275392123, lng : 126.94683778297095},
				{lat : 37.55906185816793, lng : 126.94410917188688},
				{lat : 37.55872803568523, lng : 126.93776684847374}
					
					
				];
				
				
		 const flightPath = new google.maps.Polyline({
			    path: test,
			    geodesic: true,
			    strokeColor: "	#FF4500",
			    strokeOpacity: 1.0,
			    strokeWeight: 4,
			  });

			  flightPath.setMap(map);
	}		
	
	function getLocation(){
		alert();
	}
	
	
	$(function(){
		initMap();
		
		$("#bt_geo").click(function(){
			alert();
			getLocation();
		});
	});

</script>
<!-- 구글 맵 API & 드로잉 레이어 라이브러리(API) -->
</body>
</html>
<script async src="https://maps.googleapis.com/maps/api/js?&libraries=drawing&libraries=drawing&libraries=drawing&key=AIzaSyCygGXycbdibyxeRnH6YKo6mZSeKV1Nfn0&callback=initMap"></script>