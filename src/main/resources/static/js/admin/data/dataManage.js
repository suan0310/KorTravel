$(function() {
});

// 업체정보 변경 클릭시
function facilitiesDataUpdate() {
	// li display 속성 변경
	document.getElementById("facilityRecommandManage").style.display = "none";
	document.getElementById("facilityRegist").style.display = "none";
	document.getElementById("facilityDataUpdate").style.display = "none";
	document.getElementById("facilityAddressUpdate").style.display = "block";
	document.getElementById("facilityInformUpdate").style.display = "block";
}


// 업체 추가
function facilityRegist() {
	location.href = "/data/facilityRegist";
}

// 추천장소 등록/해제 클릭시
function facilityManage() {
	location.href = "/admin/facilityManage";
}

// 데이터 갱신 클릭시
function dataRenewal() {
	location.href = "/admin/dataRenewal";
}