<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록</title>

<!-- css -->
<link rel = "stylesheet" href = "/css/admin/data/facility/facilityRegist.css">

<!-- script -->
<!-- KakaoMap API Import -->
<%-- 
	kakaoMap API Key : 
	b430f2906597b025c6f5b2e2f62729be
--%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b430f2906597b025c6f5b2e2f62729be&libraries=services"></script>

<!-- Daum PostCode API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- script -->
<script src = "/js/admin/data/facility/facilityRegist.js"></script>
</head>
<body>
	<div class = "facilityRegistWrapper">
		<div id = "facilityRegistData" class = "facilityRegistData">
			<form id = "facilityRegForm" class="row g-3" method = "POST" enctype = "multipart/form-data">
				<div class="facilityDataInputArea">
					<label for="formGroupExampleInput" class="form-label">업체명</label> 
					<input type="text" class="form-control" id = "facilityTitle" name = "title" placeholder="업체명을 입력하세요.">
				</div>
				
				<div id = "recommandArea-1" class="facilityDataInputArea">
					<input id = "recommend" name = "recommend" type = "hidden"> 
					<label for="formGroupExampleInput" id = "recommandTxt" class="form-label">추천업소 등록</label> <br>
					<button type = "button" id = "registRecommand" class = "btn btn-secondary btn-secondary-shapeFix">추천업소 등록하기</button>
				</div>
				
<!-- 				<div id = "recommandArea-2" class="facilityDataInputArea display-none"> -->
<!-- 					<input id = "recommend" name = "recommend" type = "hidden">  -->
<!-- 					<label for="formGroupExampleInput2" id = "recommandComment" class="form-label">추천 comment</label>  -->
<!-- 					<input type="text" class="form-control" id="facilityRecommendComment" name = "recommandComment" placeholder = "추천 comment를 입력하세요."> -->
<!-- 				</div> -->
				
				<div class="facilityDataInputArea">
					<label for="formGroupExampleInput2" class="form-label">전화번호</label> 
					<input type="text" class="form-control" id="facilityTel" name = "tel" placeholder="업체 전화번호를 입력하세요.">
				</div>
				
				<div class="facilityDataInputArea">
					<label for="formGroupExampleInput2" class="form-label addressLabel">주소</label> 
					<input type="text" class="form-control addressInput" id="facilityZipcode" name = "zipcode" placeholder = "우편번호" readonly>
					<button type = "button" class = "btn btn-secondary addressSearchBtn"  onclick = "postCodeOpen()">주소 검색</button>
					<input type="text" class="form-control address" id = "facilityAddr1" name = "addr1" placeholder = "주소" readonly>
					<input type="text" class="form-control address" id = "facilityAddr2" name = "addr2" placeholder = "상세주소를 입력하세요.">
					<input type = "hidden" id = "areaCode" name = "areaCode">
					<input type = "hidden" id = "mapX" name = "mapX">
					<input type = "hidden" id = "mapY" name = "mapY">
				</div>

				<div class="facilityDataInputArea">
					<label for="facilityCat1" class="form-label">업태</label> <br>
					<select id = "cat1" class = "form-select form-select-lg mb-3 facilityCat1" name = "cat1">
						<option value = "">-- 카테고리(1) --</option>
						<option id = "cat1_1" class = "cat1_1" value = "A02">[A02]인문(문화/예술/역사)</option>
						<option id = "cat1_2" class = "cat1_2" value = "A05">[A05]음식</option>
						<option id = "cat1_3" class = "cat1_3" value = "B02">[B02]숙박</option>
					</select>

					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-fast-forward bi-fast-forward-margin" viewBox="0 0 16 16">
  						<path d="M6.804 8 1 4.633v6.734L6.804 8Zm.792-.696a.802.802 0 0 1 0 1.392l-6.363 3.692C.713 12.69 0 12.345 0 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z" />
  						<path d="M14.804 8 9 4.633v6.734L14.804 8Zm.792-.696a.802.802 0 0 1 0 1.392l-6.363 3.692C8.713 12.69 8 12.345 8 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z" />
					</svg>

					<select id = "cat2" class = "form-select form-select-lg mb-3 facilityCat2" name = "cat2">
						<option id = "cat2" class = "cat2_noVal" value = "">-- 카테고리(2)--</option>
						<option id = "cat2_1" class = "cat2_1" value = "A0101">[A0101]자연관광지</option>
						<option id = "cat2_2" class = "cat2_2" value = "A0102">[A0102]관광자원</option>
						<option id = "cat2_3" class = "cat2_3" value = "A0502">[A0502]음식점</option>
						<option id = "cat2_4" class = "cat2_4" value = "B0201">[B0201]숙박시설</option>
					</select>
				</div>
				
				<div class="facilityDataInputArea">
					<label for="formFileMultiple" class="form-label">대표이미지</label>
					<input class="form-control" type="file" id="formFileMultiple" name = "uploadFile">
				</div>
				
				<div class="facilityDataInputArea">
					<label for="formFileMultiple" class="form-label">썸네일 이미지</label>
					<input class="form-control" type="file" id="formFileMultiple" name = "uploadFile">
				</div>
				
				<div class = "facilityDataInputArea" align = center>
					<button id = "nextBtn" type="button" class="btn btn-secondary btn-secondary-shapeFix-next btn-secondary-event">다음단계</button>
				</div>
			</form>
		</div>
		
		<div id = "map" class = "map">
			<script src = "/js/admin/data/facility/facilityRegist_kakaoMap.js"></script>
		</div>
	</div>
	<div id = "facilityRegistData2" class = "facilityRegistData overviewArea facilityRegistData-zindex">
		<div class="facilityDataInputArea">
			<label for="formGroupExampleInput" class="form-label">설명/정보</label> 
			<textarea rows = 25 id = "facilityOverview" class="form-control form-control-resizable" name = "overview" placeholder="업체에 대한 설명과 정보를 작성하세요."></textarea>
		</div>
		
		<div class = "facilityDataInputArea facilityDataInputArea-btnReplace" align = center>
			<button id = "prevBtn" type="button" class="btn btn-secondary btn-secondary-shapeFix-prev btn-secondary-event">이전단계</button>
			<button type="button" id = "registBtn" class="btn btn-danger btn-danger-shapeFix">저장</button>
		</div>
	</div>
</body>
</html>