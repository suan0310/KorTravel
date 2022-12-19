<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 관리</title>

<!-- css -->
<link rel = "stylesheet" href = "/css/admin/data/dataManage.css">

<!-- script -->
<script src = "/js/admin/data/dataManage.js"></script>
</head>
<body>
	<div class = "dataManageWrapper">
		<div class = "category-select">
			<ul class = "list-group dataManageList">
				<li id = "facilityRecommandManage" class = "list-group-item" onclick = "facilityManage()">관광/음식/숙박 관리</li>
				<li id = "facilityRegist" class = "list-group-item" onclick = "facilityRegist()">관광/음식/숙박 추가</li>
				<li class = "list-group-item" onclick = "dataRenewal()"> 데이터 추가 </li>
<!-- 				<li id = "facilityDataUpdate" class = "list-group-item" onclick = "facilitiesDataUpdate()">업체정보 변경</li> -->
<!-- 				<li id = "facilityAddressUpdate" class = "list-group-item facility-addressUpdate">주소지 변경</li> -->
<!-- 				<li id = "facilityInformUpdate" class = "list-group-item facility-informUpdate">정보 변경</li> -->
			</ul>
		</div>
	</div>
</body>
</html>