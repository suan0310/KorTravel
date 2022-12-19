<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href="main";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/member/myInquiry.css">
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
			<span>문의내역</span>
			<div style="float: right; margin-right:500px;">
			<input type="button" value="문의하기" class="inquiryWriteBtn" onclick="location.href='inquiryWrite'">
			</div>
		</div>
		<!-- 끝 -->
		
		<div class="inquiryList">
		<table class="myInquiryTable" >
			<thead>
			<tr style="height : 40.5px;">
				<th width = 5%>번호</th>
				<th width = 10%>작성자</th>
				<th width = 20% >제목</th>
				<th width = 5%>문의상태</th>
				<th width = 15%>등록일</th>
			</tr>
			</thead>
			<tr><td></td></tr>
		<c:if test="${empty inquiryList}">
			<tr><td><br></td></tr>
			<tr><th colspan="6">검색 결과가 없습니다</th></tr>
			<tr><td><br></td></tr>
		</c:if>
		<c:forEach var = "list" items="${inquiryList}">
			<tr>
				<td>${list.num}</td>
				<td>${list.id}</td>
				<c:choose>
				<c:when test="${list.answer eq '' or list.answer eq null }">
				<td ><span  style="cursor : pointer;" onclick = "location.href='inquiryDetail?num='+${list.num}">${list.title}</span>
				</td>
				</c:when>
				<c:otherwise>
				<td >
<!-- 				<details style="text-align: left;"><summary> -->
				<span  style="cursor : pointer;" onclick = "location.href='inquiryDetail?num='+${list.num}">${list.title}</span>
<!-- 				</summary> -->
<%--    				<p>&nbsp;&nbsp;&nbsp;↳&nbsp; ${list.answer}</p> --%>
<!--    				</details> -->
				</td>
				</c:otherwise>
				</c:choose>
				
				<c:choose>
				<c:when test="${list.result eq 'n' or  list.result eq null}"><td>
				<input type="button" class="notAn" value="답변대기">
				</td></c:when>
				<c:otherwise>
				<td>
				<input type="button" class="an" value="답변완료">
				</td>
				</c:otherwise>
				</c:choose>
				
				<td>${list.inquiryDate}</td>	 
			</tr>
			<tr><th colspan="6"><hr></th></tr>
		</c:forEach>
			
			</table>
		<div align="center" class="paging" >${ inquiryPage }</div>
		
		</div>
		
<%-- 		<div align="center" class="paging"><c:out value = "${ inquiryPage }"/></div> --%>
	</div>
</body>
</html>