// 지도생성
var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
// 지도 생성시 옵션
var options = { //지도를 생성할 때 필요한 기본 옵션
	// center 메뉴얼
	// - 흔히 위경도 좌표라고 부르는 WGS84 좌표계의 좌표값을 넣어서 만드는데요
	// - 생성인자는 위도(latitude), 경도(longitude) 순으로 넣어주세요.
	center: new kakao.maps.LatLng(37.5129851, 126.9399192), //지도의 중심좌표. 지도를 생성하는데 반드시 필요하다.
	level: 5 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(mapContainer, options); //지도 생성 및 객체 리턴
var moveToMap_marker = new kakao.maps.Marker({});
//var marker = new kakao.maps.Marker({ map : map, position : new kakao.maps.LatLng(33.450701, 126.570667) });

// 선긋기 좌표 보관배열
var linePath = [];
// 저장한 장소들 라인생성
polyline = new kakao.maps.Polyline({
	map: map,
	path: linePath,
	strokeWeight: 7,
	strokeColor: '#7401DF',
	strokeOpacity: 1,
	strokeStyle: 'dashed',
	strokeLineCap: 'round'
});

// 좌측에 저장된 데이터 개수
var dataCount = 0;
var coords;
var xmlReq;
var polyline;


// 마크, 선 참조값 배열
var markerArray = [];
var polylineArray = [];
// 좌측 저장 좌표 보관배열
var coordRep = [];
// 좌측 저장 좌표 백업용
var coordRep_restore = [];
// 커스텀오버레이 저장
var customOverlayArr = [];
// spec동작시 customOverlay 보관
var event_customOverlayArr = [];

// 좌측에 저장된 데이터 개수를 보관하기 위한 변수
// map상에서 연결고리 지우기 위함
var savedDataCnt = 0;

// 검색기능
function search() {
	if (document.getElementById("keyword").value == "") {
		alert("검색 결과가 없습니다.");
		return;
	}
	xmlReq = new XMLHttpRequest();
	xmlReq.onreadystatechange = searchResult;
	xmlReq.open("POST", "/route/searchInDate");
	xmlReq.send(document.getElementById("keyword").value);
}

// 검색결과 배치
function searchResult(category) {
	// AJAX 통신 기록이 없는 상태에서 HashTag 클릭 시 return;
	// 알고리즘상 문제가 존재, 코드 재작성 요
	if (xmlReq == null) {
		alert("검색 결과가 없습니다.");
		return;
	}
	// 검색결과 갯수
	var searchDataCount = 0;

	if (xmlReq.readyState == 4 && xmlReq.status == 200) {
		var searchData = JSON.parse(xmlReq.responseText);
		var placeListWrapper = document.getElementById("placeListWrapper");
		var dataPrint = "";

		if (searchData.items.length == 0) {
			alert("검색 결과가 없습니다.");
			return;
		}

		for (var cnt = 0; cnt < searchData.items.length; cnt++) {
			// 관광지 클릭시
			if (category == "A02") {
				if (searchData.items[cnt].cat1 != "A02")
					continue;
			}

			// 음식 클릭시
			else if (category == "A05") {
				if (searchData.items[cnt].cat1 != "A05")
					continue;
			}

			// 숙박 클릭시
			else if (category == "B02") {
				if (searchData.items[cnt].cat1 != "B02")
					continue;
			}

			// 검색결과 카운트++
			searchDataCount++;

			// 업체 이미지가 없을시 대체 이미지 적용
			if (searchData.items[cnt].firstImage2 == "") {
				img = "<img src = 'http://localhost/mainImages/no_image.jpg' class = 'thumbnailImage'>";
				var firstImage2 = JSON.stringify("http://localhost/mainImages/no_image.jpg");
			}
			else {
				img = "<img src = '" + searchData.items[cnt].firstImage2 + "' class = 'thumbnailImage'>";
				var firstImage2 = JSON.stringify(searchData.items[cnt].firstImage2);
			}

			// 다른 function의 매개변수로 보내기 위한 작업.
			var title = JSON.stringify(searchData.items[cnt].title),
				addr1 = JSON.stringify(searchData.items[cnt].addr1),
				addr2 = JSON.stringify(searchData.items[cnt].addr2),
				tel = JSON.stringify(searchData.items[cnt].tel),
				cat1 = JSON.stringify(searchData.items[cnt].cat1),
				mapX = searchData.items[cnt].mapX,
				mapY = searchData.items[cnt].mapY,
				contentId = searchData.items[cnt].contentId,
				recommend = JSON.stringify(searchData.items[cnt].recommend);

			// JSON형식 데이터
			// 다른 function으로 보내기 위함
			var datas = [
				title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
			];

			var img
			if (searchData.items[cnt].firstImage2 == "")
				img = "<img src = 'http://localhost/mainImages/no_image.jpg' class = 'thumbnailImage'>";
			else
				img = "<img src = '" + searchData.items[cnt].firstImage2 + "' class = 'thumbnailImage'>";

			dataPrint +=
				"<div class = 'searchResultView' onclick = 'moveTo_map(" + datas + ")'>" +
					"<div class = 'aaaa'>" +
						img +
					"</div>" +

					"<div class = 'facilityTitle'>" +
						searchData.items[cnt].title +
					"</div>" +

					"<div class = 'facilityAddr1'>" +
						searchData.items[cnt].addr1 + /*" " + searchData.items[cnt].addr2 +*/
					"</div>" +

					"<div class = 'facilityAddToCartLists'>" +
						"<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' style='margin-left: 160px;' fill='currentColor' class='bi bi-plus bi-plus-shapeFix' viewBox='0 0 16 16'" +
						"onclick = 'save(" + datas + ")'>" +
							"<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>" +
						"</svg>" +
					"</div>" +

					"<input id = 'mapX' type = 'hidden' value = '" + searchData.items[cnt].mapX + "'>" +
					"<input id = 'mapY' type = 'hidden' value = '" + searchData.items[cnt].mapY + "'>" +
				"</div>"
		}
		document.getElementById("searchDataCount").innerText = "검색결과 : " + searchDataCount + "개";
		placeListWrapper.innerHTML = dataPrint;
	}
}


// 저장버튼(+) 클릭시
function save(...args) {
	if (dataCount == 10) {
		alert("최대 10개까지 저장 가능합니다.");
		return;
	}
	// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
	// title, mapX, mapY, addr1, addr2, img, contentId, mapX, mapY
	var title = JSON.stringify(args[0]),
		addr1 = JSON.stringify(args[1]),
		addr2 = JSON.stringify(args[2]),
		tel = JSON.stringify(args[3]),
		cat1 = JSON.stringify(args[4]),
		mapX = args[5],
		mapY = args[6],
		firstImage2 = JSON.stringify(args[7]),
		contentId = args[8],
		recommend = JSON.stringify(args[9]);


	var datas = [
		// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
		title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
	];

	var prev = document.getElementById("cartList2").outerHTML;
	var cart = document.getElementById("cartList2");

	//    div tag 제거
	var tmp = prev.substring(38, prev.length - 6);
	tmp +=
		"<div id = 'child_" + contentId + "' class = 'cartListChild'>" +
			"<input id = '" + contentId + "' class =  'idx_" + dataCount + "' type = 'hidden' value = '" + dataCount + "'>" +
			
			"<div class = 'cartListChild_imgArea'>" +
				"<img src = '" + args[7] + "' id = 'firstImage2_" + dataCount + "' class = 'cartListChild_img'>" +
			"</div>" +

			"<div class = 'cartListChild_textArea' onclick = 'moveTo_map(" + datas + ")'>" +
				"<div class = 'cartListChild_titleArea'>" +
					"<label id = 'title_" + dataCount + "'>" +
						args[0] +
					"</label>" +
				"</div>" +

				"<div class = 'cartListChild_addr1Area'>" +
					"<label id = 'addr1_" + dataCount + "'>" +
						args[1] +
					"</label>" +
				"</div>" +

				"<div class = 'cartListChild_addr2Area'>" +
					"<label id = 'addr2_" + dataCount + "'>" +
						args[2] +
					"</label>" +
				"</div>" +
	
				"<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' style='margin-left: 140px;' fill='currentColor' class='bi bi-dash bi-dash-shapeFix' viewBox='0 0 16 16'" +
				"onclick = 'deleteChild(" + datas + ")'>" +
					'<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>' +
				'</svg>' +
	
				"<input id = 'mapX_" + dataCount + "' type = 'hidden' value = '" + args[5] + "'>" +
				"<input id = 'mapY_" + dataCount + "' type = 'hidden' value = '" + args[6] + "'>" +
				"<input id = 'contentId_" + dataCount + "' type = 'hidden' value = '" + args[8] + "'>" +
				// 식별자
				"<input id = 'idx_" + dataCount + "' type = 'hidden' value = '" + dataCount + "'>" +
			"</div>" +
		"</div>"
	"</div>"; // 상단에서 문자열 자르는 작업을 진행하면서 div닫힘 태그가 사라짐. 추가해줘야 한다.
	cart.innerHTML = tmp;

	// 좌측에 저장된 데이터 개수++;
	dataCount++;

	// 마커, 폴리라인 세팅
	setMarkerAndPoly(mapX, mapY, title, contentId);
}

/** coords, marker, polyline 세팅  */
function setMarkerAndPoly(...args) {
	//   moveToMap_marker.setMap(null)
	// args = mapx, mapy, title, contentId

	// 저장된 장소 좌표 저장(마커용)
	coordRep.push(new daum.maps.LatLng(args[1], args[0]));
	coordRep_restore.push(new kakao.maps.LatLng(args[1], args[0]));

	// 저장된 장소 좌표 저장(polyline용)
	// 이전에 저장된 좌표값들의 배열에 +가 되어야 선이 이어진다.
	linePath.push(new kakao.maps.LatLng(args[1], args[0]));

	// 저장한 장소 마커생성
	var imgSrc = "/image/Marker_numbering/Marker-" + (dataCount) + ".png";
	var imgSize = new kakao.maps.Size(50, 53);
	var imgOption = {
		offset: new kakao.maps.Point(34, 69)
	};
	var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);

	var marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(args[1], args[0]),
		image: markerImg
	});

	console.log("contentId : " + args[3]);
	// 커스텀 오버레이 생성
	var content =
		"<div class = 'customOverlay1'>" +
			"<button class='customBtn1' type = 'button' onclick = 'getDetail(" + args[3] + ")'>" +
				"<label class = 'customOverlay_title1'>" +
					JSON.parse(args[2]) +
				"</label>" +
			"</button>" +
		"</div>"
		
	var customOverlay = new kakao.maps.CustomOverlay({
		map: map,
		//	  position : new kakao.maps.LatLng(args[1] + 0.0005, args[0] - 0.0003),
		position: new kakao.maps.LatLng(args[1], args[0]),
		content: content,
		xAnchor: 0.5,
		yAnchor: 2.9
	});
	customOverlay.setMap(map);
	customOverlayArr.push(customOverlay);


	// 생성된 마커 배열에 보관
	// 삭제를 위한 기능
	markerArray.push(marker);

	// 삭제시 polyline.setMap(null)작업을 하기때문에 map을 넘겨줘야 한다.
	polyline.setMap(map);
	// 라인긋기
	polyline.setPath(linePath);
}

// 자세히보기 클릭시
function getDetail(contentId) { window.open("concept_detail?contentId=" + contentId, "_blink"); }

// 검색한 장소 클릭시 지도이동
function moveTo_map(...args) {
	// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
	coords = new daum.maps.LatLng(args[6], args[5]);
	map.setCenter(coords);
	moveToMap_marker.setMap(map);
	moveToMap_marker.setPosition(coords);
}

// 일정불러오기 클릭시 지도이동
function moveTo_map_ByCalendar(args) {
	// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
	coords = new daum.maps.LatLng(args[6], args[5]);
	map.setCenter(coords);

	//   var marker_calendar = new kakao.maps.Marker({});
	//   marker_calendar.setMap(map);
	//   marker_calendar.setPosition(coords);
	//   markerArray.push(marker_calendar);
}


// 좌측에 저장된 데이터 삭제(-) 클릭시
function deleteChild(...args) {
	// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend, dataCount
	console.log("args : " + args);

	var idx = document.getElementById(args[8]).value;
	console.log("idx : " + idx);
	// polyline 전부 죽이기
	polyline.setMap(null);

	// marker 전부 죽이기
	for (var cnt = 0; cnt < markerArray.length; cnt++) {
		markerArray[cnt].setMap(null);
		customOverlayArr[cnt].setMap(null);
	}
	moveToMap_marker.setMap(null);

	//   // 삭제된 데이터에 따른 배열정리
	//   var compare = new kakao.maps.LatLng(args[6], args[5]);
	//   for (var cnt = 0; cnt < coordRep.length; cnt++) {
	//      if (coordRep[cnt].toString() == compare.toString()) {
	//         coordRep.splice(cnt, 1);
	//         linePath.splice(cnt, 1);
	//         markerArray.splice(cnt, 1);
	//      }
	//   }

	// 삭제된 데이터에 따른 배열정리
	coordRep.splice(idx, 1);
	linePath.splice(idx, 1);
	markerArray.splice(idx, 1);
	customOverlayArr.splice(idx, 1);

	// polyline 복구
	polyline.setMap(map);
	polyline.setPath(linePath);

	// marker, customOverlay 복구
	for (var cnt = 0; cnt < coordRep.length; cnt++) {
		// 저장한 장소 마커생성
		var imgSrc = "/image/Marker_numbering/Marker-" + (cnt + 1) + ".png";
		var imgSize = new kakao.maps.Size(64, 64);
		var imgOption = {
			offset: new kakao.maps.Point(34, 69)
		};
		var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);

		markerArray[cnt].setMap(map);
		markerArray[cnt].setImage(markerImg);

		customOverlayArr[cnt].setMap(map);
	}

	// 삭제 눌렀을 때 args
	// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
	var index = (document.getElementById(args[8]).value * 1) + 1;
	console.log("index : " + index);
	console.log("dataCount : " + dataCount);

	for (var cnt = index; cnt < dataCount; cnt++) {
		console.log("동작안하냐");
		$("#firstImage2_" + cnt).attr("id", "firstImage2_" + (cnt - 1));
		$("#title_" + cnt).attr("id", "title_" + (cnt - 1));
		$("#addr1_" + cnt).attr("id", "addr1_" + (cnt - 1));
		$("#addr2_" + cnt).attr("id", "addr2_" + (cnt - 1));
		$("#mapX_" + cnt).attr("id", "mapX_" + (cnt - 1));
		$("#mapY_" + cnt).attr("id", "mapY_" + (cnt - 1));
		$("#contentId_" + cnt).attr("id", "contentId_" + (cnt - 1));
		$(".idx_" + cnt).attr("class", "idx_" + (cnt - 1));
		$(".idx_" + (cnt - 1)).val((cnt - 1));
	}
	dataCount--;
	
	document.getElementById("child_" + args[8]).remove();
}

// 추천장소 버튼 클릭시
function searchRecommend() {
	xmlReq = new XMLHttpRequest();
	xmlReq.onreadystatechange = setRecommendFacilities;
	xmlReq.open("POST", "route/recommendFacility");
	xmlReq.send(null);
}

function setRecommendFacilities() {

	// 검색결과 갯수
	var searchDataCount = 0;

	if (xmlReq.readyState == 4 && xmlReq.status == 200) {
		var searchData = JSON.parse(xmlReq.responseText);
		var placeListWrapper = document.getElementById("placeListWrapper");
		var dataPrint = "";

		if (searchData.items.length == 0) {
			alert("검색 결과가 없습니다.");
			return;
		}

		for (var cnt = 0; cnt < searchData.items.length; cnt++) {

			// 검색결과 카운트++
			searchDataCount++;

			// 업체 이미지가 없을시 대체 이미지 적용
			if (searchData.items[cnt].firstImage2 == "") {
				img = "<img src = 'http://localhost/mainImages/no_image.jpg' class = 'thumbnailImage'>";
				var firstImage2 = JSON.stringify("http://localhost/mainImages/no_image.jpg");
			}
			else {
				img = "<img src = '" + searchData.items[cnt].firstImage2 + "' class = 'thumbnailImage'>";
				var firstImage2 = JSON.stringify(searchData.items[cnt].firstImage2);
			}

			// 다른 function의 매개변수로 보내기 위한 작업.
			var title = JSON.stringify(searchData.items[cnt].title),
				addr1 = JSON.stringify(searchData.items[cnt].addr1),
				addr2 = JSON.stringify(searchData.items[cnt].addr2),
				tel = JSON.stringify(searchData.items[cnt].tel),
				cat1 = JSON.stringify(searchData.items[cnt].cat1),
				mapX = searchData.items[cnt].mapX,
				mapY = searchData.items[cnt].mapY,
				contentId = searchData.items[cnt].contentId,
				recommend = JSON.stringify(searchData.items[cnt].recommend);

			// JSON형식 데이터
			// 다른 function으로 보내기 위함
			var datas = [
				title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
			];

			var img
			if (searchData.items[cnt].firstImage2 == "")
				img = "<img src = 'http://localhost/mainImages/no_image.jpg' class = 'thumbnailImage'>";
			else
				img = "<img src = '" + searchData.items[cnt].firstImage2 + "' class = 'thumbnailImage'>";

			dataPrint +=
				"<div class = 'searchResultView' onclick = 'moveTo_map(" + datas + ")'>" +
					"<div class = 'aaaa'>" +
						img +
					"</div>" +

					"<div class = 'facilityTitle'>" +
						searchData.items[cnt].title +
					"</div>" +

					"<div class = 'facilityAddr1'>" +
						searchData.items[cnt].addr1 + /*" " + searchData.items[cnt].addr2 +*/
					"</div>" +

					"<div class = 'facilityAddToCartLists'>" +
						"<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' style='margin-left: 150px;' fill='currentColor' class='bi bi-plus bi-plus-shapeFix  ' viewBox='0 0 16 16'" +
						"onclick = 'save(" + datas + ")'>" +
						"<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>" +
					"</svg>" +
					"</div>" +

					"<input id = 'mapX' type = 'hidden' value = '" + searchData.items[cnt].mapX + "'>" +
					"<input id = 'mapY' type = 'hidden' value = '" + searchData.items[cnt].mapY + "'>" +
				"</div>"
		}
		document.getElementById("searchDataCount").innerText = "검색결과 : " + searchDataCount + "개";
		placeListWrapper.innerHTML = dataPrint;
	}
}

// 일정 저장하기 클릭시
function saveCalendar() {
	var subject = document.getElementById("calendarSubject").value;

	if (dataCount == 0) {
		alert("저장할 장소가 없습니다.");
		return;
	} else if (subject == "") {
		alert("제목을 입력하세요.");
		return;
	}

	xmlReq = new XMLHttpRequest();

	var obj =
		'{' +
		'"subject" : "' + subject + '", ' +
		'"calendar_start" : "' + $("#datepicker").val() + '", ' +
		'"calendar_end" : "' + $("#datepicker2").val() + '", ' +
		' "item" : [';
	for (var cnt = 0; cnt < dataCount; cnt++) {
		obj +=
			'{' +
			'"title" : "' + $("#title_" + cnt).text() + "\"," +
			'"addr1" : "' + $("#addr1_" + cnt).text() + "\"," +
			'"addr2" : "' + $("#addr2_" + cnt).text() + "\"," +
			'"mapX" : "' + $("#mapX_" + cnt).val() + "\"," +
			'"mapY" : "' + $("#mapY_" + cnt).val() + "\"," +
			'"contentId" : "' + $("#contentId_" + cnt).val() + "\"," +
			'"firstImage2" : "' + $("#firstImage2_" + cnt).attr("src") + "\"" +
			"}";
		if (dataCount - 1 != cnt)
			obj += ","
	}
	obj += "]}";

	xmlReq.onreadystatechange = saveCalendarResult;
	xmlReq.open("POST", "saveCalendar");
	xmlReq.setRequestHeader("Content-Type", "application/json; charset=UTF-8")
	xmlReq.send(obj);
}

function saveCalendarResult() {
	if (xmlReq.readyState == 4 && xmlReq.status == 200) {
		console.log("동작");
		var returnData = xmlReq.responseText;

		// 제목 중복확인 결과
		if (returnData.includes("이미")) {
			alert("이미 존재하는 제목입니다. 다시 시도하세요.");
			return;
		}

		if (confirm("일정이 저장되었습니다. 확인하러 가시겠습니까?")) {
			location.href = '/myRoute';
			return;
		}

		$(".modal-overlay").css("display", "none");
	}
}

// 일정 저장하기 클릭시
function updateCalendar() {
	var subject = document.getElementById("updateSelectBox").value;

	if (dataCount == 0) {
		alert("저장할 장소가 없습니다.");
		return;
	} else if (subject == "") {
		alert("수정할 일정의 제목을 선택하세요");
		return;
	}

	xmlReq = new XMLHttpRequest();

	var obj =
		'{' +
		'"subject" : "' + subject + '", ' +
		'"calendar_start" : "' + $("#datepicker").val() + '", ' +
		'"calendar_end" : "' + $("#datepicker2").val() + '", ' +
		' "item" : [';
	for (var cnt = 0; cnt < dataCount; cnt++) {
		obj +=
			'{' +
			'"title" : "' + $("#title_" + cnt).text() + "\"," +
			'"addr1" : "' + $("#addr1_" + cnt).text() + "\"," +
			'"addr2" : "' + $("#addr2_" + cnt).text() + "\"," +
			'"mapX" : "' + $("#mapX_" + cnt).val() + "\"," +
			'"mapY" : "' + $("#mapY_" + cnt).val() + "\"," +
			'"contentId" : "' + $("#contentId_" + cnt).val() + "\"," +
			'"firstImage2" : "' + $("#firstImage2_" + cnt).attr("src") + "\"," +
			'"memo" : "' + $("#memo").val() + "\"" +
			"}";
		if (dataCount - 1 != cnt)
			obj += ","
	}
	obj += "]}";

	xmlReq.onreadystatechange = saveCalendarResult;
	xmlReq.open("POST", "updateCalendar");
	xmlReq.setRequestHeader("Content-Type", "application/json; charset=UTF-8")
	xmlReq.send(obj);
}

function saveCalendarResult() {
	if (xmlReq.readyState == 4 && xmlReq.status == 200) {
		console.log("동작");
		var returnData = xmlReq.responseText;

		// 제목 중복확인 결과
		if (returnData.includes("이미")) {
			alert("이미 존재하는 제목입니다. 다시 시도하세요.");
			return;
		}

		if (confirm("일정이 저장되었습니다. 확인하러 가시겠습니까?")) {
			location.href = '/myRoute';
			return;
		}

		$(".modal-overlay").css("display", "none");
	}
}


// 일정 불러오기
function getCalendar(id, obj) {
	$(".modal-overlay2").css("display", "none");
	//   console.log(id);
	//   console.log(obj.value);
	xmlReq = new XMLHttpRequest();
	xmlReq.onreadystatechange = getCalendarResult;
	xmlReq.open("POST", "getCalendar");
	console.log("obj.value = " + obj);
	xmlReq.send(obj);
}

function getCalendarResult() {
	var prev = document.getElementById("cartList2").outerHTML;
	var cart = document.getElementById("cartList2");
	cart.innerHTML = ""; // 일정 불러오기 여러번 눌렸을 때를 대비
	var tmp = prev.substring(38, prev.length - 6);

	// 일정 불러오기전 모든 데이터 삭제에 따른 dataCount 초기화
	dataCount = 0;

	// 새 마커와 폴리라인을 위해 둘 다 싹 없애고 다시 세팅해야 함.
	if (xmlReq.readyState == 4 && xmlReq.status == 200) {
		// polyline 전부 죽이기
		polyline.setMap(null);

		// marker 전부 죽이기
		for (var cnt = 0; cnt < markerArray.length; cnt++) {
			markerArray[cnt].setMap(null);
			customOverlayArr[cnt].setMap(null);

			//		   if (event_customOverlayArr.length != 0) {
			//			   event_customOverlayArr[cnt].setMap(null);
			//		   }
		}
		// marker, polyline 배열 초기화
		coordRep.length = 0;
		coordRep_restore.length = 0;
		linePath.length = 0;
		markerArray.length = 0;
		customOverlayArr.length = 0;
		//	   event_customOverlayArr.length = 0;

		// 저장된 일정 server return;
		var calendars = JSON.parse(xmlReq.responseText);
		
		// 불러와진 일정 메모 보관
		var memo = calendars.items[0].memo;
		document.getElementById("memo").value = memo;

		// args : title, addr1, addr2, tel, cat1, mapX, mapY, firstImage2, contentId, recommend
		console.log("zz : " + calendars.items[0]);
		var moveToArgs = [
			JSON.stringify(""), JSON.stringify(""), JSON.stringify(""), JSON.stringify(""), JSON.stringify(""),
			calendars.items[0].mapX, calendars.items[0].mapY
		];

		// 1번째 일정으로 map 이동
		moveTo_map_ByCalendar(moveToArgs);

		for (var cnt = 0; cnt < calendars.items.length; cnt++) {
			var title = calendars.items[cnt].title,
				addr1 = calendars.items[cnt].addr1,
				addr2 = calendars.items[cnt].addr2,
				mapX = calendars.items[cnt].mapX,
				mapY = calendars.items[cnt].mapY,
				firstImage2 = calendars.items[cnt].firstImage2,
				contentId = calendars.items[cnt].contentId;

			datas = [
				JSON.stringify(""), JSON.stringify(""), JSON.stringify(""), JSON.stringify(""), JSON.stringify(""),
				mapX, mapY, JSON.stringify(firstImage2), JSON.stringify(contentId), JSON.stringify(""), dataCount
			];

			tmp +=
				"<div id = 'child_" + contentId + "' class = 'cartListChild'>" +
					"<input id = '" + contentId + "' class =  'idx_" + dataCount + "' type = 'hidden' value = '" + dataCount + "'>" +
					
					"<div class = 'cartListChild_imgArea'>" +
						"<img src = '" + firstImage2 + "' id = 'firstImage2_" + dataCount + "' class = 'cartListChild_img'>" +
					"</div>" +

					"<div class = 'cartListChild_textArea' onclick = 'moveTo_map(" + datas + ")'>" +
						"<div class = 'cartListChild_titleArea'>" +
							"<label id = 'title_" + dataCount + "'>" +
								title +
							"</label>" +
						"</div>" +

						"<div class = 'cartListChild_addr1Area'>" +
							"<label id = 'addr1_" + dataCount + "'>" +
								addr1 +
							"</label>" +
						"</div>" +

						"<div class = 'cartListChild_addr2Area'>" +
							"<label id = 'addr2_" + dataCount + "'>" +
								addr2 +
							"</label>" +
						"</div>" +
		
						"<svg class = 'svg' xmlns='http://www.w3.org/2000/svg' width='30' height='30' style='margin-left: 140px;' fill='currentColor' class='bi bi-dash' viewBox='0 0 16 16'" +
						"onclick = 'deleteChild(" + datas + ")'>" +
						'<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>' +
						'</svg>' +

						"<input id = 'mapX_" + dataCount + "' type = 'hidden' value = '" + mapX + "'>" +
						"<input id = 'mapY_" + dataCount + "' type = 'hidden' value = '" + mapY + "'>" +
						"<input id = 'contentId_" + dataCount + "' type = 'hidden' value = '" + contentId + "'>" +
					"</div>" +
				"</div>" +
			"</div>";

			// dataCount가 상단 html 생성하면서 식별자로 사용되기때문에 최하단에서 후위연산이 되어야 한다.
			// 저장 할 때 cnt로 tag 참조값을 불러오는데 cnt = 0부터 시작하기때문
			dataCount++;
			setMarkerAndPoly(
				calendars.items[cnt].mapX, calendars.items[cnt].mapY,
				JSON.stringify(calendars.items[cnt].title), JSON.stringify(calendars.items[cnt].contentId)
			);
		}

		cart.innerHTML = tmp;
		console.log("일정 불러온 후 dataCount : " + dataCount)
	}
}

// 전체 삭제
function allClearList() {
	if (confirm("저장되지 않습니다. 정말 삭제하시겠습니까?")) {
		// 데이터 개수 0으로 초기화
		dataCount = 0;

		// polyline 전부 죽이기
		polyline.setMap(null);

		// marker 전부 죽이기
		for (var cnt = 0; cnt < markerArray.length; cnt++) {
			markerArray[cnt].setMap(null);
			customOverlayArr[cnt].setMap(null);
		}
		moveToMap_marker.setMap(null)
		// marker, polyline 배열 초기화
		coordRep.length = 0;
		linePath.length = 0;
		markerArray.length = 0;
		customOverlayArr.length = 0;

		// 좌측 div clear
		document.getElementById("cartList2").innerHTML = "";
	}
}


// 지도의 현재 영역을 얻어온다.
var bounds;
var boundsStr;
var map_sw;
var map_ne;
var categoryReq;
var allPlace;
var eventMarkerArray = [];
var specPlaceCnt = 0;
var specPlaceMarker;
var func;
var cat;

// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다

kakao.maps.event.addListener(map, 'dragend', dragendFunc)
function dragendFunc() {         // Drag & Drop 시점에 마커생성
	//kakao.maps.event.addListener(map, 'center_changed', function() {   // 지도 움직임 감지마다 마커생성
	// map Level 제한
	if (map.getLevel() >= 7)
		return;

	// 카테고리 클릭이 안되어 있을 시 동작 제한
	if (cat == "")
		return;

	// 남서, 북동좌표 각 문자열로 찢어 저장
	var neLat = map.getBounds().getNorthEast().getLat();
	var neLng = map.getBounds().getNorthEast().getLng();
	var swLat = map.getBounds().getSouthWest().getLat();
	var swLng = map.getBounds().getSouthWest().getLng();
	//   var cat = $(".clicked").val();
	console.log("cat : " + cat);

	// 이벤트마커 배열 초기화
	//   eventMarkerArray.length = 0;
	console.log("markerArr : " + eventMarkerArray[0]);
	for (var cnt = 0; cnt < eventMarkerArray.length; cnt++) {
		eventMarkerArray[cnt].setMap(null);
		if (event_customOverlayArr.length != 0)
			event_customOverlayArr[cnt].setMap(null);
	}

	var eventReq = new XMLHttpRequest();
	eventReq.onreadystatechange = getSpecPlace;
	eventReq.open("POST", "getSpecPlace");
	var datas = {
		neLat: neLat, neLng: neLng,
		swLat: swLat, swLng: swLng,
		cat: cat
	};
	eventReq.setRequestHeader("Content-Type", "application/json");
	eventReq.send(JSON.stringify(datas));

	//    eventMarkerArray
	//    marker.setMap(null);
	function getSpecPlace() {
		if (eventReq.readyState == 4 && eventReq.status == 200) {
			var tmp = eventReq.responseText;

			if (tmp == 'x')
				return;

			console.log("cat1 : " + cat);
			var specPlace = JSON.parse(tmp);
			for (var cnt = 0; cnt < specPlace.items.length; cnt++) {
				var mapX = specPlace.items[cnt].mapX;
				var mapY = specPlace.items[cnt].mapY;

				var markerImg;
				var imgSrc;

				if (cat == "관광지") {
					imgSrc = "/image/Marker_numbering/culture.png"
				} else if (cat == "음식점") {
					imgSrc = "/image/Marker_numbering/food.png"
				} else if (cat == "숙소") {
					imgSrc = "/image/Marker_numbering/lodge.png"
				}

				var imgSize = new kakao.maps.Size(46, 50);
				var imgOption = {
					offset: new kakao.maps.Point(34, 69)
				};
				markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize, imgOption);

				specPlaceMarker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(mapY, mapX),
					image: markerImg
				});
				specPlaceMarker.setMap(map);
				eventMarkerArray.push(specPlaceMarker);

				var content =

					"<button class='customBtn' type = 'button' onclick = 'getDetail(" + specPlace.items[cnt].contentId + ")'>" +
					"<div class = 'customOverlay'>" +
					"<label class = 'customOverlay_title'>" +
					specPlace.items[cnt].title +
					"</label>" +
					"</button>" +
					"</div>";

				var specCustomOverlay = new kakao.maps.CustomOverlay({
					map: map,
					position: new kakao.maps.LatLng(specPlace.items[cnt].mapY, specPlace.items[cnt].mapX),
					content: content,
					xAnchor: 0.5,
					yAnchor: 2.9,
				});
				event_customOverlayArr.push(specCustomOverlay);
			}
		}
	}
};

// 카테고리 클릭 event 설정
$(function() {
	// 관광지 클릭시
	$("#category_tour").on("click", function() {
		for (var cnt = 0; cnt < eventMarkerArray.length; cnt++) {
			eventMarkerArray[cnt].setMap(null);
			if (event_customOverlayArr.length != 0) {
				event_customOverlayArr[cnt].setMap(null);
			}
		}

		// 클릭 해제
		if ($("#category_tour").attr("class") == 'clicked common_tour') {
			cat = "";
			$("#category_tour").attr("class", "common common_tour");
		}
		// 클릭
		else {
			$("#category_tour").attr("class", "clicked common_tour");
			cat = "관광지";
			dragendFunc("관광지");
		}

		$("#category_food").attr("class", "common common_food");
		$("#category_lodge").attr("class", "common common_lodge");
	});

	// 음식점 클릭시
	$("#category_food").on("click", function() {
		for (var cnt = 0; cnt < eventMarkerArray.length; cnt++) {
			eventMarkerArray[cnt].setMap(null);

			if (event_customOverlayArr.length != 0) {
				event_customOverlayArr[cnt].setMap(null);
			}
		}

		if ($("#category_food").attr("class") == 'clicked common_food') {
			cat = "";
			$("#category_food").attr("class", "common common_food");
		}
		else {
			$("#category_food").attr("class", "clicked common_food");
			cat = "음식점";
			dragendFunc("음식점");
		}

		$("#category_tour").attr("class", "common common_tour");
		$("#category_lodge").attr("class", "common common_lodge");
	});

	// 숙소 클릭시
	$("#category_lodge").on("click", function() {
		for (var cnt = 0; cnt < eventMarkerArray.length; cnt++) {
			eventMarkerArray[cnt].setMap(null);
			if (event_customOverlayArr.length != 0) {
				event_customOverlayArr[cnt].setMap(null);
			}
		}

		if ($("#category_lodge").attr("class") == 'clicked common_lodge') {
			cat = "";
			$("#category_lodge").attr("class", "common common_lodge");
		}
		else {
			$("#category_lodge").attr("class", "clicked common_lodge");
			cat = "숙소";
			dragendFunc("숙소");
		}

		$("#category_tour").attr("class", "common common_tour");
		$("#category_food").attr("class", "common common_food");
	});
});

// datePicker
$(function() {
	//모든 datepicker에 대한 공통 옵션 설정
	$.datepicker.setDefaults({
		dateFormat: 'yy.mm.dd' //Input Display Format 변경
		, showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		, showMonthAfterYear: true //년도 먼저 나오고, 뒤에 월 표시
		, changeYear: true //콤보박스에서 년 선택 가능
		, changeMonth: true //콤보박스에서 월 선택 가능                
		// ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
		// ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
		// ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
		// ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
		, yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		, showAnim: "slide" //애니메이션을 적용한다.
		, monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'] //달력의 월 부분 텍스트
		, monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip 텍스트
		, dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 부분 텍스트
		, dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 부분 Tooltip 텍스트
		, minDate: "D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		, maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		, autoclose: true //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션 
	});

	//input을 datepicker로 선언
	$("#datepicker").datepicker();
	$("#datepicker2").datepicker();

	//From의 초기값을 오늘 날짜로 설정
	$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	//To의 초기값을 내일로 설정
	$('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

	$("#datepicker").change(function() {
		var date1 = new Date($("#datepicker").datepicker("getDate"));
		var date2 = new Date($("#datepicker2").datepicker("getDate"));

		if (date1 > date2) {
			$("#datepicker2").datepicker("setDate", $("#datepicker").datepicker("getDate"));
		}
	})

	$("#datepicker2").change(function() {
		var date1 = new Date($("#datepicker").datepicker("getDate"));
		var date2 = new Date($("#datepicker2").datepicker("getDate"));

		if (date2 < date1) {
			$("#datepicker2").datepicker("setDate", $("#datepicker").datepicker("getDate"));
		}
	});
});

