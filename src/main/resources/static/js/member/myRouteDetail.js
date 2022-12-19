function myRouteDelete(subject) {
	if(!confirm("삭제하시겠습니까?")){return;}
	location.href="myRouteDelete?subject=" + subject;
}

var req;
function save() {
	
	
	var subject =  document.getElementById('subject').value;
	var preSubject = document.getElementById("preSubject").value;
	if(subject==null || subject==""){
		alert("제목이 비어있습니다"); return;
	}
	if(subject != preSubject){
	req = new XMLHttpRequest();
	req.onreadystatechange = returntext;
	req.open('post', 'checkSubject');
	req.send(subject);}
	else{
		var form = document.getElementById("routeSubjectUpdate");
		form.submit();
	}
}

function returntext(){
	if(req.readyState==4 && req.status==200){
		if(req.responseText == "이미 존재하는 제목입니다."){
			alert(req.responseText + "다른 제목을 입력해주세요");
			return;
		}
		var form = document.getElementById("routeSubjectUpdate");
		form.submit();
	}
}

//일정 불러오기
function myRouteMap(id,subject) {
   console.log(id);
   console.log(subject);
   xmlReq = new XMLHttpRequest();
   xmlReq.onreadystatechange = getCalendarResult;
   xmlReq.open("POST", "myRouteMap");
   xmlReq.send(id);
   xmlReq.send(subject);
}

// ------------------------- kakaoMap ------------------------- //
var markerArr = [],
	linePath = [];

var container = document.getElementById('map');
var options = {
	center: new kakao.maps.LatLng(
		document.getElementById(0 + "_mapY").value,
		document.getElementById(0 + "_mapX").value
	),
	level: 5
};
//지도 보여주기
var map = new kakao.maps.Map(container, options);
  
var index = document.getElementById("idx").value; //갯수 가져오기
for (var i = 0; i < index; i++) {
	var mapX = document.getElementById(i + "_mapX").value;
		mapY = document.getElementById(i + "_mapY").value;
		title = document.getElementById(i+ "_title").value;

	// 마커 이미지의 이미지 크기
	var imageSize = new kakao.maps.Size(64, 64);
	var imageSrc = "/image/Marker_numbering/Marker-" + (i + 1)  + ".png";

	// 마커 이미지를 생성   
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

	// 마커를 생성
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: new kakao.maps.LatLng(
			// 마커를 표시할 위치
			document.getElementById(i + "_mapY").value,
			document.getElementById(i + "_mapX").value,
		), 
        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
	});
	linePath.push(new kakao.maps.LatLng(mapY, mapX));
}

polyline = new kakao.maps.Polyline({
   map: map,
   path: linePath,
   strokeWeight: 7,
   strokeColor: '#FF4848',
   strokeOpacity: 1,
   strokeStyle: 'dashed',
   strokeLineCap: 'round'
});
