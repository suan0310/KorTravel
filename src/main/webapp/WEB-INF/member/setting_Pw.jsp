<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대한민국 방방곡곡</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="js/member/setting_Pw.js"></script>
<style>

article {
  margin-top: 60px;
  margin-bottom: 150px;
}
.new_Pw, .new_Pw_Confirm{
	width : 300px;
}
.form{
transform : translate(40%,30%);}

.bt_div{
transform : translate(40%,200%);}
</style>
<body>
	<article>

		<div class="container" role="main">

			<h2>새 비밀번호 설정</h2>

			<form name="form" id="form" method="post" class="form">

				<div class="mb-3">

					<label for="title">새 비밀번호</label>

					<input type="password" class="form-control new_Pw" name="new_Pw" id="new_Pw" placeholder="새 비밀번호 입력" onkeyup="pwcheck(this)">
					
					<span id="pw_info"></span>
				</div>

			
				<div class="mb-3">

					<label for="reg_id">비밀번호 확인</label>

					<input type="password" class="form-control new_Pw_Confirm" name="new_Pw_Confirm" id="new_Pw_Confirm" placeholder="비밀번호 확인" onkeyup="pwrecheck(this)">

					<span id="pwre_info"></span>
				</div>

			</form>

			<div class="bt_div">

				<button type="button" class="btn btn-sm btn-primary" id="Save" onclick="submit()">저장</button>

				<button type="button" class="btn btn-sm btn-primary" id="reset" onclick="reset()">취소</button>

			</div>

		</div>

	</article>
</body>
</html>