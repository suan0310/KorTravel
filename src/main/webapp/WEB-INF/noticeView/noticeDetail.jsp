<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>
<link rel="stylesheet" href="css/notice/noticeDetail.css">
</head>
<body>
<div class="noticeDetail_main">
<div class="noticeDetail_body">
<div class="noticeDetail_head">
	<p>공지사항</p>
</div>
<div class="noticeDetail_title">
	<div >
		<div class="noticeDetail_title_head">${noticeDetailList.title}</div>
		<div class="noticeDetail_title_file">
		<c:choose>
			<c:when test="${noticeDetailList.fileName == '파일 없음' || noticeDetailList.fileName == '-' || noticeDetailList.fileName == null || noticeDetailList.fileName ==''}">
				
			</c:when>
			<c:otherwise>
				<img style="vertical-align: middle;" width ="22" height ="22" src="mainImages/disket.png">
				<a href="/admin/noticeFileDownload?num=${noticeDetailList.num}&fileName=${noticeDetailList.fileName}" style="color : black;"> ${noticeDetailList.fileName}</a>
			</c:otherwise>
		</c:choose>

		</div>
	</div>
	<div class="noticeDetail_title_info">
		<span class="view_info_title">등록일</span><span class="view_info_item">${noticeDetailList.writeDate}</span><span>|</span>
		<span class="view_info_title">조회수</span><span class="view_info_item">${noticeDetailList.hit}</span>
	</div>

</div>


<div class="noticeDetail_info">
${noticeDetailList.content}

</div>
<div class="noticeDetail_footerdiv">
<div><input class="footer_bt" value="목록" type="button" onclick="location.href='notice;'"></div>
<div class="footerdiv">
<c:choose>
	<c:when test="${move.last ne 0}">
		<input class="footer_rightbt" value = "이전글" type="button" onclick="location.href='noticeDetail?hit=0&num=${move.last}'">
	</c:when>
	<c:when test="${move.last eq 0}">
		
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${move.next ne 0 }"><input class="footer_rightbt" value = "다음글" type="button" onclick="location.href='noticeDetail?hit=0&num=${move.next}'"></c:when>
	<c:when test="${move.next eq 0 }"></c:when>
</c:choose>
</div>
</div>
</div>
</div>
</body>
</html>