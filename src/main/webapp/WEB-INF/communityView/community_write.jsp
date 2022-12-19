<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 킴정하 -->


<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="css/community/community_write.css">
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
<c:choose>
	<c:when test="${empty edit}">
	<article>
		<div class="container" role="main">
			<h2><b>글쓰기</b></h2>
			<form name="form"  id="form" role="form" method="post" enctype="multipart/form-data">
				<div class="write_div">
					<div class="mb-3">
						<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
					</div>
					<div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file">파일찾기</label> 
					    <input type="file" id="file" name="file">
					</div>
				</div>
					
				<div class="mb-4">
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>

			<div class="div_bt">
				<button type="button" class="commun_savewrite" id="btnSave" name="getdataEditor" onclick="save_proc()" >저장</button>
				<button type="button" class="commun_cancelwrite" id="btnList">취소</button>
			</div>
			</form>


		</div>
	</article>
	</c:when>
	<c:otherwise>
	<article>
		<div class="container" role="main">
			<h2><b>글수정</b></h2>
			<form name="form" id="form" role="form" method="post" enctype="multipart/form-data">
				<div class="write_div">
					<div class="mb-3">
						<input type="text" class="form-control" name="title" id="title" value="${edit.title}" placeholder="제목을 입력해 주세요">
					</div>
					<div class="filebox">
					    <input class="upload-name"  value="${edit.fileName}">
					    <label for="file">파일찾기</label> 
					    <input type="file" id="file" name="file">
					</div>
				</div>

				<div class="mb-4">
					<textarea class="form-control" rows="5" name="content" id="content">${edit.content}</textarea>
				</div>
				<input type="hidden" name="num" id="num" value="${edit.num}">
			</form>

			<div class="div_bt">
				<button type="button" class="commun_savewrite" id="btnSave" name="getdataEditor" onclick="save_proc()">저장</button>
				<button type="button" class="commun_cancelwrite" id="btnList">취소</button>
			</div>

		</div>
	</article>	
	</c:otherwise>
</c:choose>
</body>
<script src="ckeditor5-build-classic/ckeditor.js"></script>
<script src = "js/community/community.js"></script>
</html>