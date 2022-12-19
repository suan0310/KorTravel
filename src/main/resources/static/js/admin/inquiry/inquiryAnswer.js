$(function() {
	$("#cancelBtn").on("click", function() {
		location.href = "/admin/inquiryManage";
	});
});

function answerRegist() {
	var answer = document.getElementById("inquiryAnswerContent").value;
	var num = document.getElementById("inquiryNum").value;
//	var answer = encodingURIComponent(document.getElementById("inquiryAnswerContent").value);
	var answer = document.getElementById("inquiryAnswerContent").value;
	
	var form = document.getElementById("inquiryForm");
	
	if (answer == "") {
		alert("내용을 작성해주세요.");
		return;
	}
	
	form.action = "/admin/inquiryAnswer?num=" + num + "&answer=" + answer;
	form.submit();
	
//	location.href = "/admin/inquiryAnswer?num=" + num + "&answer=" + answer;
}