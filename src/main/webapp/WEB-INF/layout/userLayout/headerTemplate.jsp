<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>	

<meta charset="UTF-8">

<c:if test = "${ not empty msg }">
	<script>
		alert('${ msg }')
	</script>
</c:if>

<link rel = "stylesheet" type = "text/css" href = "css/layout/userLayout/headerTemplate.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link rel = "stylesheet" href="css/member/find-modal.css"/>
<link rel = "stylesheet" href="css/member/login-modal.css"/>

</head>
<body>
	<div class = "header">
		<div class = "content_top">
			<div class = "spaceArea_top"> 
			<c:if test="${not empty sessionScope.id}">
							<script>$(document).ready(function(){
								counter_init();})</script>
								<div class="timeoutDiv"><img alt="" src="mainImages/timeout.jpg" width ="30" height = "30" ></div>
							<span id="count_sessionTime" style="color : gray;"></span>
							<input type="button" class="time_span" value="시간 연장" onclick="counter_reset()"><br>
							<!-- <span>마지막 로그인 시간 : ${sessionScope.lastAccess }</span> -->
			 </c:if>
			 </div>
			
			<div>
				<span class = "logoArea">
				<a href="main">	<img src = "image/r.gif" class = "logo"></a>
				</span>
				
				<span class = "searchArea">
					<input class = "searchBox" id= "searchBoxInfo_area" type = "text" placeholder = "어디로, 어떤 여행을 떠날 예정인가요?" onkeyup="search_onKeyuUp(this)" onkeypress="if(event.keyCode == 13){ search_onKeyPress(this); return;}">
					<img src = "image/search.png" class = "searchIcon" onclick="search_onKeyPress(this);" onkeypress="if(event.keyCode == 13){ search_onKeyPress(this); return;}">
				</span>
				
				<span class = "infoArea">
					<c:choose>
						<c:when test = "${ empty sessionScope.id }">
							<label class="login"  id = "btn-modal">로그인</label> | <label><a href="register" style="text-decoration-line : none; text-decoration : none; color : black;">회원가입</a></label>
						</c:when>
						
						<c:otherwise>
							
							<label style="cursor : default">환영합니다 <strong>${ sessionScope.id }</strong>님</label>  | <label><a href="logout"  style="text-decoration-line:none; text-decoration:none; color:black;">로그아웃</a></label> | <label><a href="myRoute" style="text-decoration-line : none; text-decoration : none; color : black;">마이페이지</a></label><br>
							<br>

						</c:otherwise>
					</c:choose>
				</span>
			</div>
		</div>
		
		<div class="search_box" id = "search_box" style="z-index : 100; display : none;" >
			<div class="search_letter_box">
				<ul id="search_ul">

				</ul>
			</div>
			<div class="search_close_box">
				<span class="search_close_span" style="cursor : pointer; color : gray; font-size : 14px;" onclick="search_box_closeProc()">닫기</span>
			</div>
		</div>
		
		<div class = "content_bottom">
			<div class = "spaceArea_bottom"> <!-- white space area --> </div>
			
			<span class = "searchProcArea" onclick="location.href='areaSearch?areaCode=1&select=A02'">
				<label class = "searchLabel">지역별 관광지</label>
			</span>

			
			<span class = "specialArea" onclick="location.href='concept'">
				<label class = "special" >특집관</label>
			</span>
			
			<span class = "dateCreateArea" onclick = "location.href = '/route'">
				<label class = "dateCreate">일정 만들기</label>
			</span>
			
			<span class = "communityArea" onclick = "location.href = 'community'">
				<label class = "community">커뮤니티</label>
			</span>
			
			<span class = "noticeArea" onclick = "location.href = 'notice'">
				<label class = "notice">공지사항</label>
			</span>
		</div>
	</div>
   	<div id="loginmodal" class="modal-overlay" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-window" role="dialog">
			<div class="close-area">X</div>
				<div class = "logindiv">
		
		<form id = "f" method ="post">
		<div> <img src ="image/logologo.png" class="logos" > <br> <span class="login_T"> LOGIN </span> </div>
			<table class ="logintb">
				<tr><td></td></tr>
				<tr><td colspan ="3" class="in"><input type="text" id="loginId" name="loginId" class ="loginId" onkeypress="if(event.keyCode == 13){ login_check(); return;}" placeholder = "아이디" value ="">
				 </td></tr>
				
				<tr><td colspan ="3" class="in"><input type="password" id="loginPw" name ="loginPw" class ="loginPw" onkeypress="if(event.keyCode == 13){ login_check(); return;}" placeholder = "비밀번호">
				 </td></tr>
				<tr><td colspan ="3" align ="left"><span id = "alert_info"></span><br></td></tr>
				
				<tr><td colspan ="3" height="50"><input type="button" id="login_bt" class="login_bt" style="width : 310px; height : 50px; cursor : pointer;" onclick ="login_check()"onkeypress="if(event.keyCode == 13){ login_check(); return;}"  value = "일반로그인" style="cursor : pointer"></td></tr>
				
				<tr><td><br><input type ="checkbox" checked = "checked" value = "true" id ="loginmt"  name ="loginmt" class ="loginmt" >
				<span id ="loginmt_text" class ="login_text">로그인 유지하기</span>	
				<a  id ="find_login" class ="find_login" style="cursor : pointer">아이디/비밀번호 찾기</a><br></td>			
		</table>
		
		<img alt="" src="image/hr.png" style="width: 310px;">
			
				<a href="https://kauth.kakao.com/oauth/authorize?
												client_id=41af3522bd71f40b96c20b2376771225&
												redirect_uri=http://localhost/kakaoLogin&
												response_type=code">
				<img src="mainImages/kakao_login_medium_wide.png" width="310" height = "57" alt="카카오 로그인"  id="ka_login"/></a>
				
				<a href="${url}"><img width="310" height ="57" src="mainImages/na.png" id="na_login"/></a>

              <div class="re_B">
              <span id="register_question" class= "register_question" style="cursor : pointer">회원이 아니신가요? </span> 
              <a href ="register" id ="register_connect" class ="register_connect">회원가입</a>
              </div>
		</form>
		</div>
		</div>
	</div>
	
	<div id="findmodal" class="findmodal-overlay" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="findmodal-window" role="dialog">
			<div class="findCloseBtn">X</div>
				<div class = "finddiv">
		
		<form id = "ff" method ="post">
			<table class ="findtb">
				
				<tr><td colspan ="2"><h2 class= "findTitle">아이디 찾기 . 비밀번호 재설정</h2></td></tr>
				
				<tr><td colspan ="2" ><p class = "findFont">로그인을 연동하시면 <br>아이디, 비밀번호를 찾을 필요 없이<br>이용 하실 수 있습니다.</p></td></tr>
				
				<tr><td colspan ="3">				<a href="https://kauth.kakao.com/oauth/authorize?
												client_id=41af3522bd71f40b96c20b2376771225&
												redirect_uri=http://localhost/kakaoLogin&
												response_type=code">
				<img src="mainImages/kakao_login_medium_wide.png" width="310" height = "57" alt="카카오 로그인"  id="ka_login"/></a>
				</td></tr>
				<tr><td colspan="3"><a href="${url}"><img width="310" height ="57" src="mainImages/na.png" id="na_login"/></a></td></tr>
				<tr><td colspan ="2"><p class = "findFont">계정에 연결된 이메일을 입력하시면 <br>아이디 조회와 비밀번호를 재설정 하실 수 있습니다.</p></td></tr>
				<tr><td><br></td></tr>
				<tr><td><input class = "inputEmail" name = "email" id = "email"  type = "text" placeholder = "이메일을 입력해주세요.">
					<td><input class = "confirmBt" id="confirmBt" type = "button" value = "인증번호 받기" onclick = "sendAuth2()" ></td></tr>
		
				<tr>
					<td><input class = "confirmEmail" type = "text"  name = "member_email_confirm" id = "member_email_confirm" placeholder = "인증번호 입력"></td>
					<td><input class = "confirm_num_bt" id="confirm_num_bt"  type = "button" value = "확인" onclick = "checkAuth()"></td>
				</tr>
				<tr><td><br></td></tr>
				<tr><td colspan="2"><a class ="return-Login" id="btn-backLogin" style="cursor : pointer; color : black;">로그인화면</a>으로 돌아가기</td></tr>
				<tr><td><br></td></tr>
			</table>
		</form>
		</div>
		</div>
	</div>
	

<script src="js/member/login-modal.js"></script>
<script src ="js/member/find_member.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src ="js/layoutTemplate/headerTemplate.js"></script>
<script src ="js/member/login.js"></script>



</body>

</html>