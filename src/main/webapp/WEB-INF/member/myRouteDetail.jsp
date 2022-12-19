<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href = "main";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<!-- script -->

<!-- css -->
<link rel="stylesheet" href="/css/member/myRouteDetail.css">
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>
</head>
<body>
	<%@ include file="../member/aside.jsp"%>
	<div class="wrap">
		<!-- 마이페이지 제목 -->
		<div class="title">
			<img src="image/my_icon_01.png"> <span>마이페이지</span>

		</div>
		<div class="subTitle">
			<span>일정 상세정보</span>
		</div>
		<!-- 끝 -->

		<div class="content">
			<form action="routeSubjectUpdate" name="routeSubjectUpdate"
				id="routeSubjectUpdate" method="post">
				<input type="hidden" id="id" name="id" value="${sessionScope.id }" />

				<c:choose>
					<c:when test="${empty myRouteDetail}">
						<div class="routeNon1">
							<!-- 				<div class="routeNon2"> -->
							<!-- 					<input type="button" value="일정만들기" class="RouteBtn" onclick="location.href='route'"> -->
							<!-- 				</div> -->
							<div class="routeNon2">
								<span style="font-size: 40px;">나의 일정이 없습니다.</span>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="routeDiv">
							<!-- 							<input type="button" value="저장하기" class="RouteBtn" onclick="save()">  -->
							<input type="button" value="일정 수정하기" class="RouteBtn"
								onclick="location.href='route'">
							<%-- 							<input type="button" value="일정삭제" class="RouteBtn" onclick="myRouteDelete('${ myRouteDetail[0].subject }')"> --%>
						</div>
						<div class="subject">
							<c:forEach var="mysubject" items="${myRouteDetail}" begin="0"
								end="0">
								<%-- 				<input type="text" id="subject" name="subject" value="${fn:escapeXml(mysubject.subject) }"> --%>
								<label style="font-size: 20px;"> &nbsp;&nbsp;
									&nbsp;&nbsp; </label>
								<input type="text" id="subject" name="subject"
									value="${mysubject.subject}" maxlength="15"
									oninput="handleInputLength(this, 15)"
									onkeydown="return event.key != 'Enter';">
								<p>*클릭 시 제목 수정이 가능합니다</p>
							</c:forEach>
							<c:forEach var="preSubject" items="${myRouteDetail}" begin="0"
								end="0">
								<input type="hidden" id="preSubject" name="preSubject"
									value="${preSubject.subject}">
							</c:forEach>
							<!-- 							일정 주제 확인 -->
							<c:forEach var="subjectCheck" items="${subjectCheck}" begin="0"
								end="${ subjectCheck.size() }">
								<input type="hidden" id="subjectCheck" name="subjectCheck"
									value="${subjectCheck.subject}">
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
				<div></div>
				<c:forEach var="myRoute" items="${myRouteDetail}">
					<div class="myRouteWrap">
						<div class="myRoute">
							<c:set var="i" value="${i+1 }" />
							<div class="myRouteNum">
								<span>${i }</span>
							</div>
							<div class="routeImg" style="cursor: pointer;"
								onclick="location.href='concept_detail?contentId=${myRoute.contentId }'">
								<img class="img" src="<c:out value="${myRoute.firstImage2}"/>">
							</div>
							<div class="routeInfo">
								<div class="routeTitle"
									onclick="location.href='concept_detail?contentId=${myRoute.contentId }'">
									<label class="myRoute_title" style="width: 450px;"><c:out
											value="${myRoute.title}" /></label> <br>
								</div>
								<div class="routeAddress">
									<c:out value="${myRoute.addr1}" />
									<c:out value="${myRoute.addr2}" />
								</div>
							</div>
						</div>
						<!-- 					<hr style="margin: 40px 0 -40px 200px"> -->
					</div>
					<c:forEach var="cnt" begin="0"
						end="${myRouteDetail.size()-(myRouteDetail.size())}">
						<%-- 							<c:if test="not empty cnt"> --%>
						<div>
							<img src="/image/12.png"
								style="width: 50px; margin: 20px 0px -60px 600px;">
						</div>
						<%-- 					</c:if> --%>
					</c:forEach>
				</c:forEach>
				<c:forEach var="memo" items="${myRouteDetail}" begin="0" end="0">
					<c:if test="${empty memo.memo}">
						<div class="textareaDiv">
							<textarea rows="8" cols="70" id="memo" name="memo"
								style="white-space: normal;" maxlength="2000"
								placeholder="여행에 대해 간단한 기록을 할 수 있어요."></textarea>
						</div>
					</c:if>
				</c:forEach>
				<c:forEach var="memo" items="${myRouteDetail}" begin="0" end="0">
					<c:if test="${!empty memo.memo}">
						<div class="textareaDiv">
							<textarea rows="8" cols="70" id="memo" name="memo"
								maxlength="2000"> ${memo.memo }</textarea>
						</div>
					</c:if>
				</c:forEach>
			</form>
			<!-- 			지도 -->
			<c:forEach var="cnt" begin="0" end="${ myRouteDetail.size() }"
				step="1">
				<c:if test="${ cnt  eq myRouteDetail.size() }">
					<input id="idx" type="hidden" value="${ cnt }">
				</c:if>
				<input id="${ cnt }_title" type="hidden"
					value="${ myRouteDetail[cnt].title }">
				<input id="${ cnt }_mapX" type="hidden"
					value="${ myRouteDetail[cnt].mapX }">
				<input id="${ cnt }_mapY" type="hidden"
					value="${ myRouteDetail[cnt].mapY }">
			</c:forEach>
		</div>

	</div>
	<div class="mapWrap">
		<div class="map" id="map"
			style="width: 800px; height: 500px; user-select: none; border: 2px solid gray;">
			<!-- kakoMap API, Script -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=323990993000f85cf458c22c6ceaa8cf&libraries=services"></script>
			<script src="/js/member/myRouteDetail.js"></script>
		</div>

	</div>
	<div class="routeDiv1">
		<input type="button" value="저장하기" class="RouteBtn" onclick="save()">
		<input type="button" value="일정삭제" class="RouteBtn"
			onclick="myRouteDelete('${ myRouteDetail[0].subject }')">
	</div>
	<!-- 			<div class="routeImg"> -->
	<!-- 			<hr> -->
	<!-- 				<img src="image/route.gif" class="gif"> -->
	<!-- 			</div> -->
</body>
</html>