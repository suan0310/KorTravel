    var req;
    function send(obj){
    	req = new XMLHttpRequest();
    	req.onreadystatechange = changeText;
    	req.open('post',"conceptInfo");
    	req.send(obj);
    }
    
    $(document).ready(function(e){
	req = new XMLHttpRequest();
	req.onreadystatechange = changeText;
	req.open('post', 'conceptInfo');
	req.send(null);
	
});
    

    
function changeText() {
	if (req.readyState == 4 && req.status == 200) {
		var tbody1 = document.getElementById("tbody1");
		var tbody2 = document.getElementById("tbody2");
		var tbody3 = document.getElementById("tbody3");
		var tbody4 = document.getElementById("tbody4");
		var tbody5 = document.getElementById("tbody5");
		var resData = JSON.parse(req.responseText);

		var printData1 = '';
		var printData2 = '';
		var printData3 = '';
		var printData4 = '';
		var printData5 = '';

		for (i = 0; i < 6; i++) {
			if (resData.item[i].firstImage == null || resData.item[i].firstImage == "") {
				printData1 +=
					"<div class='card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"no_image\" src = \"/image/noimg.jpg\">" +
					"</div>" +
					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}

			else {
				printData1 +=
					"<div class = 'card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"img\" src=\"" + resData.item[i].firstImage + "\">" +
					"</div>" +

					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}
		}
		for (i = 6; i < 12; i++) {

			if (resData.item[i].firstImage == null || resData.item[i].firstImage == "") {
				printData2 +=
					"<div class='card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"no_image\" src = \"/image/noimg.jpg\">" +
					"</div>" +
					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}

			else {
				printData2 +=
					"<div class = 'card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"img\" src=\"" + resData.item[i].firstImage + "\">" +
					"</div>" +

					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}
		}
		for (i = 12; i < 18; i++) {

			if (resData.item[i].firstImage == null || resData.item[i].firstImage == "") {
				printData3 +=
					"<div class='card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"no_image\" src = \"/image/noimg.jpg\">" +
					"</div>" +
					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}

			else {
				printData3 +=
					"<div class = 'card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"img\" src=\"" + resData.item[i].firstImage + "\">" +
					"</div>" +

					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}
		}
		for (i = 18; i < 24; i++) {

			if (resData.item[i].firstImage == null || resData.item[i].firstImage == "") {
				printData4 +=
					"<div class='card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"no_image\" src = \"/image/noimg.jpg\">" +
					"</div>" +
					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}

			else {
				printData4 +=
					"<div class = 'card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"img\" src=\"" + resData.item[i].firstImage + "\">" +
					"</div>" +

					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}
		}
		for (i = 24; i < 30; i++) {

			if (resData.item[i].firstImage == null || resData.item[i].firstImage == "") {
				printData5 +=
					"<div class='card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"no_image\" src = \"/image/noimg.jpg\">" +
					"</div>" +
					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}

			else {
				printData5 +=
					"<div class = 'card'>" +
					"<div onclick = \"location.href = 'concept_detail?contentId=" + resData.item[i].contentId + "'\">" +
					"<img class = \"img\" src=\"" + resData.item[i].firstImage + "\">" +
					"</div>" +

					"<div class = 'text'>" +
					"<span>" +
					resData.item[i].title +
					"</span>" +
					"</div>" +
					"</div>";
			}
		}


		tbody1.innerHTML = printData1;
		tbody2.innerHTML = printData2;
		tbody3.innerHTML = printData3;
		tbody4.innerHTML = printData4;
		tbody5.innerHTML = printData5;
	}
}
    
    		
            $(() => {
            // swiper ??????
            var swiper = new Swiper(".swiper-classname", {
                // ????????? ????????? ???????????? ??????
              	infinite : true,
                rows : 2,
                slidesToShow : 6,
                slidesToScroll : 1,
                
                // ??????????????? ??????
                spaceBetween: 30,
                // ????????????
                autoplay: {
                    // ???????????? ??????
                    delay: 2500,
                },

                // ????????? ??????
                pagination: {
                    // ????????? ??? ?????? ???????????????
                    el: ".swiper-classname .swiper-pagination",
                    // ??????????????????
                    clickable: true,
                    infinite : true,
                },
                // ?????? ??????
                navigation: {
                    nextEl: ".swiper-classname .swiper-button-next",
                    prevEl: ".swiper-classname .swiper-button-prev",
                },
            });
        });