<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${not empty msg}">
	<script>alert('${msg}');</script>
</c:if>
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>
<link rel="stylesheet" href="css/community/communityDetail.css">
<script src="js/community/community.js"></script>
</head>
<body>
<div class="communityDetail_main">
<div class="communityDetail_body">
<div class="communityDetail_head">
	<p>커뮤니티</p>
</div>
<div class="communityDetail_title">
	<div>
		<div class="communityDetail_title_head">${communityDetailList.title}</div>
		<div class="communityDetail_title_file">
		<c:choose>	
			<c:when test="${communityDetailList.fileName eq '파일 없음' or communityDetailList.fileName eq '-' or communityDetailList.fileName eq null}">
			</c:when>
			<c:otherwise>
				<img style="vertical-align: middle;" width ="22" height ="22" src="mainImages/disket.png">
				<a href="${root }download?fileName=${communityDetailList.fileName}&writer=${communityDetailList.id}" style="color : black;"> ${communityDetailList.fileName}</a>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
	<div class="communityDetail_title_midhead">
	<div class="communityDetail_title_info">
		<span class="view_info_title">등록일</span><span class="view_info_item">${communityDetailList.writeDate}</span><span>|</span>
		<span class="view_info_title">작성자</span><span class="view_info_item">${communityDetailList.id}</span><span>|</span>
		<span class="view_info_title">조회수</span><span class="view_info_item">${communityDetailList.hit}</span>
	</div>
		<c:if test="${sessionScope.id eq communityDetailList.id or sessionScope.id eq 'admin' }">
			<div class="my_write_fn"><input type="button" class="my_write_bt" onclick="location.href='community_write_proc?num=${communityDetailList.num}'" value="수정"><input type="button" class="my_write_bt" value="삭제" onclick="my_write_delete('<c:out value="${communityDetailList.num}"/>')"></div>
		</c:if>
	</div>
</div>
<div class="communityDetail_info" id="communityDetail_info">
${communityDetailList.content}
</div>
<div class="communityDetail_footerdiv">
<div><input class="footer_bt" value="목록" type="button" onclick="location.href='community;'"></div>
<div class="footerdiv">
<c:choose>
	<c:when test="${move.last ne 0}">
		<input class="footer_rightbt" value = "이전글" type="button" onclick="location.href='communityDetail?hit=0&num=${move.last}'">
	</c:when>
	<c:when test="${move.last eq 0}">
		
	</c:when>
</c:choose>
<c:choose>
	<c:when test="${move.next ne 0 }"><input class="footer_rightbt" value = "다음글" type="button" onclick="location.href='communityDetail?hit=0&num=${move.next}'"></c:when>
	<c:when test="${move.next eq 0 }"></c:when>
</c:choose>
</div><br><br>

	<div class="comments" style="clear : both; margin-left : 150px;">
		
		<div class="comment_form">
			<form id="comment_form" > 
			
				<input type="hidden" name="writeNo" value="${param.num}">
			
				<input type="hidden" value="${sessionScope.id}" id= "loginCheck">
				<c:choose>
					<c:when test="${empty sessionScope.id}">
				<textarea  id = "reContent" name="reContent" rows= "8" cols = "115" maxlength ="500" readonly = "readonly">로그인이 필요합니다.</textarea> <br>					
					</c:when>
					<c:otherwise>
				<textarea  id = "reContent" name="reContent" rows= "8" cols = "115" maxlength ="500"></textarea> <br>					
				<button type="button" id="CRB" onclick="comment_reg()">등록</button>
					</c:otherwise>
				</c:choose>
            </form>
		</div>
   </div>
<div class="comment_entireDiv"><p>덧글(${countComment})</p>
	<c:choose>
	<c:when test="${not empty comment}">
	<c:forEach var ="commentList" items="${comment}">
	<c:if test="${commentList.deleted eq 'N' }">
	<div class="comment_first">
		<div class="user_profilePhotoDiv" style=" margin-left: <c:out value="${40*commentList.redepth}"/>px; display: inline-block"> 
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
</svg>
		<c:set var="image" value="${commentList.profilePhoto}"/>
	<c:choose>
		<c:when test="${fn:startsWith(image,'http')}">
		<img class="user_profile" src="${commentList.profilePhoto}">		
		</c:when>
		<c:when test="${fn:startsWith(image,'no')}">
		<img class="user_profile" src="/image/${commentList.profilePhoto}">	
		</c:when>
		<c:otherwise>
		<img class="user_profile" src="/image/profile/${commentList.reWriter}/${commentList.profilePhoto}">	
		</c:otherwise>
	</c:choose>
		</div>
		<div>
			<div class="comment_title"><span style="font-size : 14px; font-weight: bold; margin-left:50px;">${commentList.reWriter}</span></div>
			<div class="comment_content" ><span id="reply<c:out value="${commentList.replyNo}"/>" style="font-size : 13px; margin-left:50px;">${commentList.reContent}</span></div>
			<div><div style="float : left; margin-top: 10px;"><span style="font-size : 12px; margin-left:50px;">${commentList.reDate}</span> <label id="reply2" style="font-size : 13px; cursor : pointer;" onclick="fn_replyReply('<c:out value="${commentList.replyNo}"/>')" >↳덧글</label></div>
		
			<c:if test="${sessionScope.id eq commentList.reWriter or sessionScope.id eq 'admin'}">
			<div class="edit_delete_box"><input class="comment_edit_button" type="button" value = "수정" onclick="fn_replyUpdate('<c:out value="${commentList.replyNo}"/>')"><input type="button" class="comment_delete_button" value="삭제" onclick="comment_delete('<c:out value="${commentList.replyNo}"/>')"></div>
			</c:if>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${commentList.deleted eq 'Y'}">
		<div class="comment_first">
		<div style="transform : translate(45%,70%);">
			<span>삭제된 댓글입니다.</span>
		</div>
	</div>
	</c:if>
	</c:forEach>
	</c:when>

	<c:otherwise>
	<div>등록된 댓글이 없습니다</div>
	</c:otherwise>
	</c:choose>
	</div>
	<div id="replyDiv" style="width: 99%; display:none"> <!--수정창 -->
   	 <form name="form2" id="form2">
        <input type="hidden" name="writeNo" value="${param.num}">
        <input type="hidden" name="replyNo">
        <textarea name="reContent" id="reContent" rows="3" cols="60" maxlength="500"></textarea>
        <div class="SVbtn">
        <input type="button" class = "comment_edit_save" value = "저장" onclick="fn_replyUpdateSave()">
        <input type="button" class = "comment_edit_cancel" value = "취소" onclick="fn_replyUpdateCancel()">
        </div>
   	 </form>
	</div>
	<div id="replyDialog" style="width: 99%; display:none"><!-- 댓글의 댓글창 -->
    <form name="form3" >
        <input type="hidden" name="writeNo" value="<c:out value="${param.num}"/>">
        <input type="hidden" name="replyNo">
        <input type="hidden" name="reparent">
        <textarea name="reContent" id="reContent2" rows="3" cols="60" maxlength="500"></textarea>
         <div class="SVbtn">
        <input type="button"  class = "comment_edit_save" value = "저장" onclick="fn_replyReplySave()">
        <input type="button" class = "comment_edit_cancel"  value = "취소" onclick="fn_replyReplyCancel()">
    </form>
	</div>

</div>
</div>
</div>
</body>
</html>