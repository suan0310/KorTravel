<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>대한민국 방방곡곡</title>
<link rel="stylesheet" href="css/search/areaSearch.css">
<script type="text/javascript" src="js/search/areaSearch.js"></script>
</head>
<body>
	<div class="area_search_main">
		<div class="area_search_middle">
			<div class="area_search_top">
			<c:choose>
				<c:when test="${param.areaCode =='1' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#서울 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='1' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#서울 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='1' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#서울 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='2' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#인천 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='2' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#인천 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='2' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#인천 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='3' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대전 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='3' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대전 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='3' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대전 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='4' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대구 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='4' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대구 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='4' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#대구 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='5' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#광주 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='5' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#광주 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='5' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#광주 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='6' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#부산 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='6' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#부산 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='6' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#부산 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='7' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#울산 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='7' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#울산 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='7' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#울산 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='8' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#세종 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='8' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#세종 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='8' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#세종 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='31' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경기 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='31' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경기 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='31' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경기 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='32' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#강원 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='32' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#강원 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='32' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#강원 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='33' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충북 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='33' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충북 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='33' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충북 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='34' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충남 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='34' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충남 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='34' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#충남 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='35' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경북 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='35' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경북 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='35' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경북 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='36' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경남 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='36' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경남 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='36' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#경남 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='37' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전북 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='37' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전북 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='37' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전북 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='38' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전남 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='38' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전남 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='38' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#전남 #숙소</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='39' and param.select=='A02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#제주 #관광지</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='39' and param.select=='A05'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#제주 #맛집</h1></div>
				</c:when>
				<c:when test="${param.areaCode =='39' and param.select=='B02'}">
				<div class="area_search_top_info"><h1 class="area_search_top_h1">#제주 #숙소</h1></div>
				</c:when>
			</c:choose>
				
			</div>
			<div class="area_search_left">
				<div class="area_search_left_top">총 <span class="area_search_left_total">${totalCount } </span>건</div>
					<c:forEach var="list" items="${searchList}">
							<div class="search_spot">
								<c:choose>
									<c:when test="${not empty list.firstImage2}">
											<c:set var = "image" value="${list.firstImage2}"/>
										<c:choose>
											<c:when test="${fn:startsWith(image, 'C:')}">
												<div class="search_imgDiv">
													<img class="search_img" src="/facilityImage/(${list.areaCode})_${list.title}/firstImage2.png" onclick="location.href='concept_detail?contentId=${list.contentId}'" style="cursor : pointer;">
												</div>											
											</c:when>
											<c:otherwise>
												<div class="search_imgDiv">
													<img class="search_img" src="${list.firstImage2}" onclick="location.href='concept_detail?contentId=${list.contentId}'" style="cursor : pointer;">
												</div>											
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<div class="search_imgDiv">
											<img class="search_img" src="mainImages/no_image.jpg" onclick="location.href='concept_detail?contentId=${list.contentId}'" style="cursor : pointer;">
										</div>									
									</c:otherwise>
								</c:choose>
								<div class="search_info">
								<br>
									<div class="search_a"><a class="search_a_a" href="concept_detail?contentId=${list.contentId}" >${list.title}</a></div><br>
									<c:set var="addr" value="${fn:split(list.addr1,' ')}"/>
									<span>${addr[0]} ${addr[1]}</span><br>
									<c:set var = "overView" value="${fn:split(list.overview,' ')}"/>
									<span>${overView[0]} ${overView[1]} ${overView[2]} ${overView[3]} ${overView[4]} ${overView[5]} ${overView[6]} ${overView[7]} ${overView[8]} ${overView[9]}..</span>
								</div>
							</div>
					</c:forEach>
					<div align = "center" class="pageDiv">${page }</div>
			</div>
			<div class="area_search_right">
				<div class="area_search_right_area">
					<div class="area_search_right_category">
						<c:if test="${param.select eq 'A02'}">
						<button class="city_bt1" style="width : 80px;" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A02'"><span>#관광지</span></button>						
						<button class="city_bt" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A05'"><span>#맛집</span></button>						
						<button class="city_bt" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=B02'"><span>#숙소</span></button>
						</c:if>
						<c:if test="${param.select eq 'A05'}">
						<button class="city_bt" style="width : 80px;" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A02'"><span>#관광지</span></button>						
						<button class="city_bt1" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A05'"><span>#맛집</span></button>						
						<button class="city_bt" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=B02'"><span>#숙소</span></button>
						</c:if>
						<c:if test="${param.select eq 'B02'}">
						
						<button class="city_bt" style="width : 80px;" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A02'"><span>#관광지</span></button>						
						<button class="city_bt" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=A05'"><span>#맛집</span></button>						
						<button class="city_bt1" onclick="location.href='areaSearch?areaCode=${param.areaCode}&select=B02'"><span>#숙소</span></button>
						</c:if>
					</div>
					<div class="area_search_right_city">
					<c:if test="${param.areaCode eq '1' }">
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '2' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '3' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '4' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '5' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '6' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '7' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '8' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '31' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '32' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '33' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '34' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '35' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '36' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '37' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '38' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
					<c:if test="${param.areaCode eq '39' }">
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=1&select=${param.select}'"><span>#서울</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=2&select=${param.select}'"><span>#인천</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=3&select=${param.select}'"><span>#대전</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=4&select=${param.select}'"><span>#대구</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=5&select=${param.select}'"><span>#광주</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=6&select=${param.select}'"><span>#부산</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=7&select=${param.select}'"><span>#울산</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=8&select=${param.select}'"><span>#세종</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=31&select=${param.select}'"><span>#경기</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=32&select=${param.select}'"><span>#강원</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=33&select=${param.select}'"><span>#충북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=34&select=${param.select}'"><span>#충남</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=35&select=${param.select}'"><span>#경북</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=36&select=${param.select}'"><span>#경남</span></button>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=37&select=${param.select}'"><span>#전북</span></button><br>
						<button class="city_bt"  onclick="location.href='areaSearch?areaCode=38&select=${param.select}'"><span>#전남</span></button>
						<button class="city_bt1"  onclick="location.href='areaSearch?areaCode=39&select=${param.select}'"><span>#제주</span></button>
					</c:if>
	


					</div>
				</div>
			</div>
			
		</div>	
		
	</div>
</body>
</html>