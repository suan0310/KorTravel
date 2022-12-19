var xmlReq;

$(function() {
	$("#options").change(function() {
		if ($("#options").val() == '삭제기록') {
			document.getElementById("searchText").value = "";
			document.getElementById("searchText").readOnly = "false";
		}
	});
	
	// 검색기능
	$("#searchBtn").on("click", function() {
		var option = document.getElementById("options").value;
		var searchText = document.getElementById("searchText").value;

		if (option == "삭제기록") {
			location.href = "/admin/facilityManage?options=" + option + "&searchText=" + searchText;
			return;
		}

		if (option == null || option == "") {
			alert("검색 카테고리를 선택하세요.");
			return;
		} else if (searchText == null || searchText == "") {
			alert("검색어를 입력하세요.");
			return;
		}

		location.href = "/admin/facilityManage?options=" + option + "&searchText=" + searchText;
	});
});

// 추천등록 클릭시
function recommendReg(contentId) {
	location.href = "/admin/recommendReg?contentId=" + contentId.value;
}

// 추천해제 클릭시
function recommendReset(contentId) {
	location.href = "/admin/recommendReset?contentId=" + contentId.value;
}

// 업체 클릭시
function facilityDetail(contentId) {
	var mapX = document.getElementById("mapX").value;
	var mapY = document.getElementById("mapY").value;
	location.href = "/admin/facilityDetail?contentId=" + contentId + "&mapX=" + mapX + "&mapY=" + mapY;
}

// 삭제 클릭시
function deleteFacility(contentId) {
	if (confirm("삭제하시겠습니까?")) {
		xmlReq = new XMLHttpRequest();
		xmlReq.onreadystatechange = deleteResult;
		xmlReq.open("POST", "/admin/facilityDelete")
		xmlReq.send(contentId);
	}
}

function deleteResult() {
	if (xmlReq.readyState == 4 && xmlReq.status == 200) { location.href = "/admin/facilityManage"; }
}


// 복구 클릭시
function restore(contentId) {
	if (confirm("복구하시겠습니까?")) {
		xmlReq = new XMLHttpRequest();
		xmlReq.onreadystatechange = restoreResult;
		xmlReq.open("POST", "/admin/facilityRestore")
		xmlReq.send(contentId);
	}
}

function restoreResult() {
	if (xmlReq.readyState == 4 && xmlReq.status == 200) { location.href = "/admin/facilityManage"; }
}

// indexing
function tableDisplayByIndex(index, options, searchText, currentPage) {
	location.href = "/admin/facilityManage?index=" + index + "&options=" + options + "&searchText=" + searchText + "&currentPage=" + currentPage; 
}

function prev(index, currentPage) {
	if (currentPage == 0)
		return;
	else if (currentPage == "")
		currentPage = 0;
		
	if (index == "")
		index = 1;
	else
		index = parseInt(index);
		
	location.href = "/admin/facilityManage?index=" + (parseInt(currentPage - 1) * 4 + 1) + "&currentPage=" + (parseInt(currentPage) - 1);
}

function next(currentPage, maxPage, index) {
	if (currentPage == (maxPage - 1))
		return;
		
	if (currentPage == "")
		currentPage = 0;
		
	if (index == "")
		index = 1;
	else
		index = parseInt(index);
	
	location.href = "/admin/facilityManage?index=" + (parseInt(currentPage + 1) * 4 + 1) + "&currentPage=" + (parseInt(currentPage) + 1);
}