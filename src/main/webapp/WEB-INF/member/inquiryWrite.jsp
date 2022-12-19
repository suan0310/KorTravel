<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessionScope.id }">
	<script>
		location.href="main";
	</script>
</c:if>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="/css/member/inquiryWrite.css">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Lato|Quicksand'>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>

<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>


<title>대한민국 방방곡곡</title>

<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>


</head>

<body>
<%@ include file="../member/aside.jsp" %>
<div class="wrap">
<c:choose>
	<c:when test="${empty inquiryList}">
	<article>
		<!-- 마이페이지 제목 -->
		<div class="title">
			<img src="image/my_icon_01.png"> <span>마이페이지</span>

		</div>
		<div class="subTitle">
			<span>문의하기</span>
		</div>
		<!-- 끝 -->
		<div class="wrap1" role="main">
			<form name="inquiryWrite" action="inquiryWrite" id="inquiryWrite" method="post" >
				<div class="write_div">
					<div class="sel sel--black-panther">
						  <select name="type" id="type" >
							    <option value="">문의사항 선택</option>
							    <option value="일반문의">일반문의</option>
							    <option value="관광지문의">여행지문의</option>
							    <option value="일정문의">일정문의</option>
							    <option value="건의사항">건의사항</option>
						  </select>
					</div>	
					<div class="mb-3">
						<input type="text" class="inquiryTitle" name="title" id="title" placeholder="제목을 입력해 주세요">
					</div>
					
				</div>
					
				<div class="mb-4">
					<textarea class="inquriryContent" rows="5" name="inquiryContent" id="inquiryContent" placeholder="내용을 입력해 주세요" ></textarea>
				</div>

			<div class="div_bt">
				<button type="button" class="inquiryBtn" id="btnSave" name="getdataEditor" onclick="save()" >등록</button>
				<button type="button" class="inquiryBtn" id="btnList">취소</button>
			</div>
			</form>


		</div>
	</article>
	</c:when>
	<c:otherwise>
	<article>
		<!-- 마이페이지 제목 -->
		<div class="title">
			<img src="image/my_icon_01.png"> <span>마이페이지</span>

		</div>
		<div class="subTitle">
			<span>문의수정</span>
		</div>
		<!-- 끝 -->
		<div class="wrap1" role="main">
			<form name="inquiryWrite" action="inquiryWrite" id="inquiryWrite" method="post">
				<div class="write_div">
						<div class="sel sel--black-panther">
						  <select name="type" id="type" >
							    <option value="${inquiryList.type }">${inquiryList.type}</option>
							    <option value="일반문의">일반문의</option>
							    <option value="관광지문의">관광지문의</option>
							    <option value="일정문의">일정문의</option>
							    <option value="건의사항">건의사항</option>
						  </select>
					</div>	
					<div class="mb-3">
						<input type="text" class="inquiryTitle" name="title" id="title" value="${inquiryList.title}">
					</div>
					
				</div>

				<div class="mb-4">
					<textarea class="inquriryContent" rows="5" name="inquiryContent" id="inquiryContent">${inquiryList.inquiryContent}</textarea>
				</div>
				<input type="hidden" name="num" id="num" value="${inquiryList.num}">
			</form>

			<div class="div_bt">
				<button type="button" class="inquiryBtn" id="btnSave" name="getdataEditor" onclick="save()" >수정하기</button>
				<button type="button" class="inquiryBtn" id="btnList"  onclick='location.href = "myInquiry"'>취소</button>
			</div>

		</div>
	</article>	
	</c:otherwise>
</c:choose>
</div>
</body>
<script src="ckeditor5-build-classic/ckeditor.js"></script>
<script >
function save(){
	var title = document.getElementById("title");
 	var type = document.getElementById("type");
	var content = document.getElementById("inquiryContent");
	console.log("content : " + content);
	var form = document.getElementById("inquiryWrite");
	
	if(type.value==""){
		alert('문의사항을 선택해주세요.'); return false;
	}else 
	if(title.value==""){
		alert('제목을 입력해주세요');return;
	}else 
	if(content.value==""){
		alert('내용을 입력해주세요'); return;
	}
	
	form.submit();
}
/* ===== Logic for creating fake Select Boxes ===== */
$('.sel').each(function() {
  $(this).children('select').css('display', 'none');
  
  var $current = $(this);
  
  $(this).find('option').each(function(i) {
    if (i == 0) {
      $current.prepend($('<div>', {
        class: $current.attr('class').replace(/sel/g, 'sel__box')
      }));
      
      var placeholder = $(this).text();
      $current.prepend($('<span>', {
        class: $current.attr('class').replace(/sel/g, 'sel__placeholder'),
        text: placeholder,
        'data-placeholder': placeholder
      }));
      
      return;
    }
    
    $current.children('div').append($('<span>', {
      class: $current.attr('class').replace(/sel/g, 'sel__box__options'),
      text: $(this).text()
    }));
  });
});

// Toggling the `.active` state on the `.sel`.
$('.sel').click(function() {
  $(this).toggleClass('active');
});

// Toggling the `.selected` state on the options.
$('.sel__box__options').click(function() {
  var txt = $(this).text();
  var index = $(this).index();
  
  $(this).siblings('.sel__box__options').removeClass('selected');
  $(this).addClass('selected');
  
  var $currentSel = $(this).closest('.sel');
  $currentSel.children('.sel__placeholder').text(txt);
  $currentSel.children('select').prop('selectedIndex', index + 1);
});

</script>
</html>