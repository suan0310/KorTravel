<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>

<script src="js/member/member.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <c:if test="${empty sessionScope.id }"> --%>
<!-- 	<script> -->
<!-- // 		location.href="main"; -->
<!-- 	</script> -->
<%-- </c:if> --%>
<link rel="stylesheet" href ="css/member/register.css">

</head>
<body>
<c:if test="${not empty msg }">
<script>alert('${msg}')</script>
</c:if>

<div class="shipping">
<div class="floatdiv">

 <form id="register_Form" method="post">
      <h4 class="title1"> <b> 회원가입 </b></h4>

        <div class="inputContainer">
        <c:choose>
        	<c:when test="${empty sessionScope.APIId}">
        <input type="text" class="input id" id="id" name="id" value="" placeholder="a" onkeyup="idcheck(this)">        	
        	</c:when>
        	<c:otherwise>        	
        <input type="text" class="input id" id="id" name="id"  value = "${sessionScope.APIId}"  readonly = "readonly">        	
        	</c:otherwise>
        </c:choose>
        <label for=""  class="label" >아이디*</label>
        <button type="button" class="id_button" onclick="id_check(this)" style="cursor : pointer">중복 확인</button>
      </div>
      <span id="id_info"></span>

        <div class="inputContainer">
        <input type="password" class="input" id="pw" name="pw" value="" placeholder="a" onkeyup="pwcheck(this)">
        <label for=""  class="label" >비밀번호*</label>
      </div>
      <span id="pw_info"></span>

        <div class="inputContainer">
        <input type="password" class="input" id="member_repw" name="member_repw" value="" placeholder="a" onkeyup="pwrecheck(this)">
        <label for=""  class="label" >비밀번호 확인*</label>
      </div>
      <span id="pwre_info"></span>

        <div class="inputContainer email">
        <c:choose>
        	<c:when test="${not empty sessionScope.APIEmail }">
        		<input type="text" name="email" id="email1" class="input email" value="${sessionScope.APIEmail}" readonly="readonly">
        	</c:when>
        	<c:otherwise>
        		<input type="text" name="email" id="email1" class="input email" placeholder="a" onkeyup="emailcheck(this)">        	
        	</c:otherwise>
        </c:choose>
        <label for="" class="label"> 이메일* </label>
        <input type="button" class="email_button" onclick="sendAuthemail()" value = "인증번호 받기" style="cursor : pointer">
      </div>
       <span id="email_info"></span>
       
        <div class="inputContainer email" id = "confirm_div">
        <input type="text"  name="member_email_confirm1" id="member_email_confirm1" class="input email" value="" placeholder="a" >
        <label for="" class="label"> 인증번호 확인* </label>
        <input type="button" class="email_button" onclick="checkAuthemail()" value = "인증번호 확인" style="cursor : pointer">
      </div>
       <span id="msg"></span>
       
       
        <div class="inputContainer">
        <c:choose>
        	<c:when test="${not empty sessionScope.APImobile}">
        	   <input type="text" name="phone" id="phone" class="input" placeholder="a" value="${sessionScope.APImobile}" maxlength="13" oninput="autoHyphen(this)"onclick="digitcheck(this)">
     		   <label for="" class="label"> 전화번호* </label>
        	</c:when>
        	<c:otherwise>
       		   <input type="text" name="phone" id="phone" class="input" placeholder="a" value="" maxlength="13" oninput="autoHyphen(this)" onclick="digitcheck(this)">
     		   <label for="" class="label"> 전화번호* </label>        	
        	</c:otherwise>
        </c:choose>
      </div>
       <span id="digit_Info"></span>
       
        <div class="inputContainer">
        <c:choose>
        	<c:when test="${empty sessionScope.APIGender}">
        <input type="radio" name="gender" id="gender1" value="man"><label for="gender1" class="input_gender" style="cursor : pointer">남자</label>
        <input type="radio" name="gender" id="gender2" value="woman"><label for="gender2" class="input_gender" style="cursor : pointer">여자</label>
        <input type="radio" name="gender" id="gender3" value="none"><label for="gender3" class="input_gender" style="cursor : pointer">선택안함</label>        	
        	</c:when>
        	<c:when test="${sessionScope.APIGender eq 'male'}">
        <input type="radio" name="gender" id="gender1" value="man" checked="checked"><label for="gender1" class="input_gender" style="cursor : pointer">남자</label>
        <input type="radio" name="gender" id="gender2" value="woman"><label for="gender2" class="input_gender" style="cursor : pointer">여자</label>
        <input type="radio" name="gender" id="gender3" value="none"><label for="gender3" class="input_gender" style="cursor : pointer">선택안함</label>         	
        	</c:when>
        	<c:when test="${sessionScope.APIGender eq 'female'}">
        <input type="radio" name="gender" id="gender1" value="man" ><label for="gender1" class="input_gender" style="cursor : pointer">남자</label>
        <input type="radio" name="gender" id="gender2" value="woman" checked="checked"><label for="gender2" class="input_gender" style="cursor : pointer">여자</label>
        <input type="radio" name="gender" id="gender3" value="none"><label for="gender3" class="input_gender" style="cursor : pointer">선택안함</label>         	
        	</c:when>
        	<c:otherwise>
        <input type="radio" name="gender" id="gender1" value="man" ><label for="gender1" class="input_gender" style="cursor : pointer">남자</label>
        <input type="radio" name="gender" id="gender2" value="woman"><label for="gender2" class="input_gender" style="cursor : pointer">여자</label>
        <input type="radio" name="gender" id="gender3" value="none" checked="checked"><label for="gender3" class="input_gender" style="cursor : pointer">선택안함</label>         	
        	</c:otherwise>
        </c:choose>

        
      </div>
      <span id="gender_info"></span>


           <div class="inputContainer">
        <input type="text" name="zipcode" id="zipcode" class="input zipcode" value="" placeholder="a" readonly="readonly">
        <label for="" class="label">우편번호*</label>
         <button type="button" class="zipcode_button" onclick="daumPost()" style="cursor : pointer">우편번호 검색</button>
      </div>
	 
	  
	             <div class="inputContainer">
        <input type="text" name="addr1" id="addr1" class="input" value="" placeholder="a" readonly="readonly">
        <label for="" class="label">주소*</label>
      </div>
	  
	  
	             <div class="inputContainer">
        <input type="text" name="addr2" id="addr2" class="input" value="" placeholder="a" onkeyup="upyeoncheck(this)">
        <label for="" class="label">상세주소*</label>
      </div>
	  <span id="city_info3"></span>
	  
	   <div class="inputContainer" 	>
        <input type="button" onclick="member_allcheck()" style="cursor : pointer" class="submit" value="회원가입" >
        <input type="button" onclick="member_outcheck()" style="cursor : pointer" class="cancel"  value="취소" >        
      </div>

</form>
</div></div>


</body>
</html>