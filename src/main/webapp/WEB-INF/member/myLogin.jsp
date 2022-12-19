<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href="main";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/member/myLogin.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://iq-tree.github.io/KJL_/kjl/0.0.1.js"></script>

<!-- <script type="text/javascript"> -->
<!-- // function loadCountry() { -->
<!-- //     $.ajax({ -->
<!-- //         "url": "https://api.ip.pe.kr/json/", -->
<!-- //         "method": "GET" -->
<!-- //     }).done(function (data) { -->
<!-- //         $("#ip").text(data.ip); -->
<!-- //         $("#code").text(data.country_code); -->
<!-- //         $("#country").text(data.country_name['ko']); -->
<!-- //     }) -->
<!-- // } -->

<!-- // loadCountry(); -->
<!-- </script> -->
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
			<span>나의 로그인</span>
		</div>
		<!-- 끝 -->
		<table class="table2">
			<thead>
				<tr>
					<th colspan="2">로그인 기록</th>
				</tr>
			</thead>
			<tr>
					<th></th>
					<th>IP주소 </th>
					<th>국가코드 </th>
					<th>국가 </th>
					<th>접속 기록 </th>
				</tr>
				<tr>
					<c:set var="data" value="${getLoginList}"/>
					<c:set var="ip" value="${fn:split(data.ip, ',')}"/>
					<c:set var = "lastAccess" value = "${ fn:split(data.lastAccess, ',')}"/>
					<c:set var = "code" value = "${ fn:split(data.code, ',')}"/>
					<c:set var = "country" value = "${ fn:split(data.country, ',')}"/>
					<c:forEach var = 'cnt' begin = "0" end = "9" step = "1">
						<c:if test = "${ not empty ip[cnt] }">
							<tr>
								<td>${cnt+1 } </td>
								<td>${ ip[cnt] }</td>
								<td>${ code[cnt] }</td>
								<td>${ country[cnt] }</td>
								<td>${ lastAccess[cnt] }</td>
							</tr>
						</c:if>
					</c:forEach>

			</tbody>
		</table>

	</div>
</body>
</html>