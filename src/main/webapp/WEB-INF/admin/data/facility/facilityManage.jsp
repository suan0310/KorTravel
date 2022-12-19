<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
<link rel = "stylesheet" href = "/css/admin/data/facility/facilityManage.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<!-- script -->
<script src = "/js/admin/data/facility/facilityManage.js"></script>

<c:if test = "${ not empty msg }">
	<script>
		alert("${ msg }");
	</script>
</c:if>

</head>
<body>
	<div class = "facilityWrapper">
		<div class = "topArea">
			<span class="searchArea"> 
				<select id = "options" class="form-select form-select-sm form-select-shapeFix">
					<option value = "">선택</option>
					<option>업체번호</option>
					<option>업체명</option>
					<option>업태</option>
					<option>삭제기록</option>
				</select>
			</span>
			
			<span class = "searchArea">
				<input type = "text" placeholder="검색" id = "searchText" class = "form-control form-control-shapeFix">
			</span>
			
			<span class = "searchArea">
				<button id = "searchBtn" class = "btn btn-light btn-shapeFix">검색</button>
			</span>
		</div>
		<table class = "table table-light table-striped table-shapeFix">
			<thead>
				<tr>
					<th>번호</th>
					<th>업태</th>
					<th>업체명</th>
					<th>주소(상세주소)</th>
					<th>전화번호</th>
					<th>추천등록</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test = "${ facilities eq '[]' }">
						<td colspan = 100>검색결과가 없습니다.</td>
					</c:when>
					<c:otherwise>
					<c:forEach var="cnt" begin="0" end="10" step="1">
					<script>
						console.log("foreach 동작")
					</script>
						<c:choose>
							<c:when test="${ facilities[cnt] != null }">
								<tr>
									<th>
										<input id = "mapX" type = "hidden" value = "${ facilities[cnt].mapX }">
										<input id = "mapY" type = "hidden" value = "${ facilities[cnt].mapY }">
										<input id = "contentId_${ cnt }" class = "facilityTitle" name = "contentId" type = "hidden" value = "${ facilities[cnt].contentId }">
										${ facilities[cnt].contentId }
									</th>
	
									<td>
										<c:choose>
											<c:when test = "${ facilities[cnt].cat1 eq 'A02' }">
												관광지
											</c:when>
											
											<c:when test = "${ facilities[cnt].cat1 eq 'A05' }">
												음식
											</c:when>
											
											<c:otherwise>
												숙박
											</c:otherwise>
										</c:choose>
									</td>
	
									<c:choose>
										<c:when test = "${ facilities[cnt].delete_yn eq 'n' }">
											<td id = "facilityTitle" class = "facilityTitle" onclick = "facilityDetail('${ facilities[cnt].contentId }')">
												${ facilities[cnt].title }
											</td>
										</c:when>
										<c:otherwise>
											<td id = "facilityTitle" class = "facilityTitle" style = "cursor : initial;">
												${ facilities[cnt].title }
											</td>
										</c:otherwise>
									</c:choose>
								
									<td class = "facilityAddr">
										${ facilities[cnt].addr1 } ${ facilities[cnt].addr2 }
									</td>
		
									<td class = "contentArea">
										<c:choose>
											<c:when test = "${ facilities[cnt].tel eq '' }">
												-
											</c:when>
											<c:otherwise>
												${ facilities[cnt].tel }
											</c:otherwise>
										</c:choose>
									</td>
								
									<td>
										<c:choose>
											<c:when test = "${ facilities[cnt].delete_yn eq 'y' }">
												-
											</c:when>
											<c:when test = "${ facilities[cnt].recommend ne 'y' }">
												<button class = "btn btn-secondary" type = "button" onclick = "recommendReg(document.getElementById('contentId_${ cnt }'))">추천등록</button>
											</c:when>
											<c:otherwise>
												<button class = "btn btn-danger" type = "button" onclick = "recommendReset(contentId_${ cnt }).value">추천해제</button>
											</c:otherwise>
										</c:choose>
									</td>
								
									<td>
										<c:choose>
											<c:when test = "${ facilities[cnt].delete_yn eq 'y' }">
												<button class = "btn btn-secondary" type = "button" onclick = "restore(${ facilities[cnt].contentId })">복구</button>
											</c:when>
											<c:otherwise>
												<button class = "btn btn-secondary" type = "button" onclick = "deleteFacility(${ facilities[cnt].contentId })">삭제</button>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:otherwise>
				</c:choose>
				<tr>
					<td colspan = 10 height = 10>
						<div class = "paginationArea">
							<ul class = "pagination">
								<li class = "page-item" onclick = "prev('${ param.index }', ${ currentPage })"><label class = "page-link">prev</label></li>
									<c:forEach var="index" begin="${ currentPage * 4 + 1 }" end="${ (currentPage + 1) * 4 }" step="1">
										<c:choose>
											<c:when test="${ index le index_MAX }">
												<li class = "page-item"><label class = "page-link" onclick="tableDisplayByIndex('${ index }', '${ param.options }', '${ param.searchText }', '${ currentPage }')">${ index }</label></li>
											</c:when>
										</c:choose>
									</c:forEach> 
								<li class = "page-item page-item-shapeFix"><label id = "next" class = "page-link page-link-shapeFix" onclick = "next(${ currentPage }, ${ maxPage }, '${ param.index }')">next</label></li>
							</ul>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>