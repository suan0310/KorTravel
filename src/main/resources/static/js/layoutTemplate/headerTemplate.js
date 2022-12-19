// Menu bar display on/off
$(function () {
	var detailMenu = document.getElementById("detailMenu");
	
	$(".menubar").on("click", function() {
		if (detailMenu.style.display == "none") {
			detailMenu.style.opacity = 10;
			detailMenu.style.display = "inline-block";
			return;
		}
		
		detailMenu.style.opacity = 0;
		detailMenu.style.display = "none";
	})
});

var timer;
var cnt = parseInt(60*60);//시간 조절(60초 * 60);
function counter_init(){//숫자 세는거 시작
	timer = setInterval("counter_run()",1000); //setInterval(함수,시간) : 특정시간마다 함수를 호출하는 메서드 1000으로 설정하면 1초마다 호출함
}

function counter_reset() { //시간 연장 누르면 숫자 세던거 리셋
	clearInterval(timer);  //setInterval 설정해놓은거 없앰
	cnt = parseInt(60*60);   //시간설정 다시
	counter_init();
}

function counter_run(){  //시간이 줄어들면서 화면 표시
	var count_sessionTime = document.getElementById("count_sessionTime");
	count_sessionTime.innerText = time_format(cnt);
	cnt--;
	if(cnt<0){ //시간 다 되면 interval 지우고 로그아웃됨
		clearInterval(timer);
		location.href="logout";
	}
}

function time_format(s){  //시간 포맷
	
	var Min = 0;
	var Sec = 0;
	if(s>0){
		Min = parseInt(s/60);
		Sec = s%60;
		if(Min>60){
			Hour = parseInt(Min/60);
			Min = Min%60;
		}
	}
	if(Sec<10) Sec = "0"+Sec;
	if(Min<10) Min = "0"+Min;
	
	return Min+":"+Sec;
}



var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "_Ot58RblJDMniarmYL3a", //내 애플리케이션 정보에 cliendId
			callbackUrl: "http://localhost:80/callback", // 내 애플리케이션 API설정의 Callback URL 
			loginButton: {color: "green", type: 3, height: 45 },
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문.	
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
			else{
					var req = new XMLHttpRequest();
					req.onreadystatechange = naverMsg;
					req.open('post', 'naverLogin');
					req.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
					
					var data = {email:email};
					data = JSON.stringify(data);
					req.send(data);
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
}

var req;
function search_onKeyuUp(obj){
	var searchbox = document.getElementById("search_box");
	searchbox.style.display = "";
	if(obj.value==""||obj.value==null){
		searchbox.style.display = "none";
	}
	req = new XMLHttpRequest();
	req.onreadystatechange = searchInfo;
	req.open("post", "searchProc");
	req.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	
	var data = {search:obj.value};
	data = JSON.stringify(data);
	req.send(data);
}

function search_onKeyPress(obj){
	var a = document.getElementById("searchBoxInfo_area").value;
	location.href="search_onKeyProc?select=A02&title="+a;
}

function searchInfo(){
		if(req.readyState==4 && req.status==200){
			if(req.responseText==""){
				return;
			}

			var search_ul = document.getElementById("search_ul");
			var printData ='';
			var resData = JSON.parse(req.responseText);
			for(i=0; i<resData.cd.length; i++){
				printData +="<li style=\"cursor : pointer;\"onclick=\"location.href='concept_detail?contentId="+resData.cd[i].contentId+"'\">"+resData.cd[i].title + "</li>"

			}
			search_ul.innerHTML = printData;
	}
}

function search_box_closeProc(){
	var searchbox = document.getElementById("search_box");
	searchbox.style.display = "none";
}




