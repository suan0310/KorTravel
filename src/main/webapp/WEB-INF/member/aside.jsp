<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/member/aside.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <nav class="sidebar">
    
      <ul>
        <li class="active sideBorder"><a href="myRoute" >나의 일정</a></li>
<!--         <li class="active sideBorder"><a href="myPage">내정보</a></li> -->
        <li class="active sideBorder"><a href="userUpdateCheck" >내 정보수정</a></li>
        <li class="active sideBorder"><a href="myLog" >커뮤니티 활동</a></li>
        <li class="active sideBorder"><a href="myInquiry" >1:1문의</a></li>
        <li class="active sideBorder"><a href="myLogin" >나의 로그인</a></li>
        <li class="active sideBorder"><a href="userDelete" >회원탈퇴</a></li>
      </ul>
    </nav>
    <div class="content">
      
    </div>

    <script>
   
      $('nav ul li').click(function(){
        $(this).addClass("active").siblings().removeClass("active");
      });
      
      
     
    </script>

  </body>

