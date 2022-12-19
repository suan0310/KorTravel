<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <c:if test="${empty sessionScope.id }">
	<script>
		location.href="main";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>
<link rel="stylesheet" href="/css/member/inquiryDetail.css">
</head>
<body>
<%@ include file="../member/aside.jsp" %>
	<div class="wrap">
		<!-- 마이페이지 제목 -->
		<div class="title">
			<img src="image/my_icon_01.png"> <span>마이페이지</span>

		</div>
		<div class="subTitle">
			<span>문의 상세</span>
		</div>
		<!-- 끝 -->
<div class="communityDetail_main">
<div class="communityDetail_body">
<div class="communityDetail_title">
	<hr>
	<div class="titleHead">${inquiryList.title}</div>
		<div class="inquiryDetailInfo">
			<input type="hidden" id = "num" name="num" value="${inquiryList.num }" />
			<span class="view_info_title">등록일&nbsp;&nbsp;:&nbsp;&nbsp;</span><span class="view_info_item">${inquiryList.inquiryDate}</span>
		</div>
		<div class="writer">
		<span >작성자&nbsp;&nbsp;:&nbsp;&nbsp;</span><span class="view_info_item">${inquiryList.id}</span>
		</div>
	<div class="modify">
		<c:if test="${sessionScope.id eq inquiryList.id }">
			<div class="my_write_fn">
			<c:if test="${inquiryList.result eq 'n'}">
			<input type="button" class="inquiryBtn" onclick="location.href='inquiryModifyProc?num=${inquiryList.num}'" value="수정">			
			</c:if>
			<c:if test="${inquiryList.result eq 'y' }">
			<input type="button" class="inquiryBtn" style="border : none;">
			</c:if>
			<input type="submit" class="inquiryBtn" value="삭제" onclick="inquiryDeleteProc()"></div>
		</c:if>
			</div>
	</div>
</div>
<div class="inquiryContent" id="communityDetail_info">
<hr >
${inquiryList.inquiryContent}
</div>
<c:if test="${inquiryList.result eq 'y' }">
<div class="adminAnswer">
<hr>
<div class="adminAnswerSpan">
	<span>&nbsp;&nbsp;&nbsp;&nbsp; ↳ &nbsp;답변 내용</span>
</div>
<div class="adminAnswerText">
	<textarea rows="10" cols="90" readonly="readonly" maxlength="1000">${inquiryList.answer}</textarea>
</div>
</div>
</c:if>
<div class="communityDetail_footerdiv">
<div><input class="inquiryBtn" value="목록" type="button" onclick="location.href='myInquiry;'"></div>
<br><br>



</div>
</div>
</div>
</body>
<script type="text/javascript">
function comment_reg(){
	var comment_form = document.getElementById("comment_form");
	var loginCheck = document.getElementById("loginCheck");
	var reContent = document.getElementById("reContent");
	if(loginCheck.value==null || loginCheck.value==""){
		alert('로그인 후 이용가능합니다.');
		return;
	}
	if(reContent.value==""){
		alert("내용을 입력하세요");
		return;
	}
	comment_form.action = "inquiryComment";
	comment_form.submit();
}

function inquiryDeleteProc(num){
	if(!confirm("삭제하시겠습니까?")){ return; }
	var num = document.getElementById("num").value;
	location.href = "inquiryDeleteProc?num=" + num;
}
</script>
</html>