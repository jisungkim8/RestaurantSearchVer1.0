var begin = 3;

var urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}

$(document).ready(function() {

	var moreCount = urlParam("moreCount");
	var restaurantId = urlParam("restaurantId");
	var filterName = urlParam("filterName");
	
	var moreReview = function() {
		var start = moreCount*3 + 1;
		var end = start + 2;
		
		$.ajax({
			url : "moreReview.do", 
			method : "GET", 
			data : {restaurantId:restaurantId, start:start, end:end, moreCount:moreCount, filterName:filterName}, 
			success : function(args) {
//				alert("more Clicked!! moreCount = " + moreCount);
//				alert("start = " + start);
//				alert("end = " + end);
				$("#getReview").append(args);
				moreCount = moreCount*1 + 1;
//				alert("moreCount After = " + moreCount)
//				alert("test = " + $("#checkMoreReview").val());
//				alert("filterName = " + filterName);
				
				if ($("#checkMoreReview").val() == "false") $("#more").remove();
			}
		});
	};
	
	// 네이버 지도 사용을 위한 네이버 지도 map 객체... 
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(37.3595704, 127.105399),
		zoom : 8,
		zoomControl : true, //줌 컨트롤의 표시 여부 
		zoomControlOptions : { //줌 컨트롤의 옵션
			position : naver.maps.Position.RIGHT_CENTER
		}
	});

	// 마커 표시를 위한 marker 객체.. 
	var marker = marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.3595704, 127.105415),
			map : map
		});

	// restaurantid를 이용하여 server에 restaurant의 json 객체 요청... 
	function get_restaurant_by_id(restaurantId)	 {
//		alert("asdasdasd");
		$.ajax({
			type : "POST", // POST방식 요청
			data : {"restaurantId": restaurantId},
			dataType : "json", // RETURN 받을 데이터 형(JSON객체)
			url : "getRestaurantByRestaurantId.do", // 요청 URL.. 
			success : show_marker_on_screen // 응답 성공시 콜백 함수.. 
		});
	}

	// 도로명 주소를 이용하여 지도에 마커 표시하기.. 
	function show_marker_on_screen(restaurant) {
		console.log(restaurant)
		var restaurant_doro_addr = restaurant.addr; // restaurant 객체의 도로명 주소만 잘라서 restaurant_doro_addr변수에 대입하기..
		searchAddressToCoordinate(restaurant_doro_addr); // 해당 도로명 주소로 함수 호출..
//		alert("asdasdasd");
	}		


	//주소를 파라미터로 받아 좌표로 변환 후,  마커의 위치를 지정하여 지도가 해당 위치의 정 중앙으로 오도록 setting 해주는 함수 
	// address는 반드시 지번주소가 아닌, 도로명 주소이어야 함.. 
	function searchAddressToCoordinate(address) {
//		alert("asdasdasd");
		naver.maps.Service	// geocode라는 서비스 함수 요청(ajax요청)
				.geocode(
						{
							address : address	// 보낼 키 명 : address, 보낼 값 : address 변수
						},
						function(status, response) { // 콜백 함수 (ajax요청의 콜백함수)
							
							if (status === naver.maps.Service.Status.ERROR) { // 에러 발생 시 
								return alert('Something Wrong!');
							}

							console.log(response);

							// item의 point정보를 받아와서 point 객체(좌표객체) 생성... 
							var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
									: '[지번 주소]', point = new naver.maps.Point(
									item.point.x, item.point.y);
							
							// marker의 위치를 point좌표로 지정
							marker.setPosition(point);
							
							// map의 위치를 해당 point좌표가 정중앙에 오도록 이동시킴.. 
							map.setCenter(point);
						});
	}
	
	get_restaurant_by_id(restaurantId);
	
	moreReview();
	
	$(document).on("click", "#replyWrite", function(e) {
		alert("asdasdasd");
	});
	
	$(document).on("click", "#filtering", function(e) {
		filterName = (this).value;
		moreCount = 0;
		var start = moreCount*3 + 1;
		var end = start + 2;
		
		$.ajax({
			url : "orderByRecommendCnt.do",
			method : "GET", 
			data : {restaurantId:restaurantId, start:start, end:end, moreCount:moreCount, filterName:filterName}, 
			success : function(args) {
//				alert("moreCount = " + moreCount);
//				alert("restaurantId = " + restaurantId);
//				alert("current = " + current);
//				alert(args);
//				alert("filterName = " + filterName);
				$("#getReview").children().remove();
				moreReview();

				$("#more").remove();
				var content = "<h4 align='center'><button id='more' class='btn btn-default'>더보기..</button></h4>";
				$(content).appendTo("#moreLocation");
			}
		});
	});
	
	$("#moreReviewPhotoFile").on("click", function(e) {
		var content = "";
		var number = $("#reviewPhotoFileGroup input").length + 1;
		
		content = "<input type='file' " +
				"class='form-control' " +
				"style='height:50px;' " +
				"name='upload' " +
				"id='reviewPhotoFile" + number + "'>";
		
		$(content).appendTo("#reviewPhotoFileGroup");
		
		return false;
	});
	
	$(document).on("click", "#recommend", function(e) {
		var current = (this).value;
		
		if ((this).getAttribute("class") == "btn btn-success") {
			alert("asd");
			return;
		}
		
		(this).setAttribute("class", "btn btn-success");
		
		$.ajax({
			url : "recommend.do",
			method : "POST", 
			data : {restaurantId:restaurantId, current:current, moreCount:moreCount}, 
			success : function(args) {
//				alert("moreCount = " + moreCount);
//				alert("restaurantId = " + restaurantId);
				alert("current = " + current);
//				alert(args);
			}
		});
	});
	
	
	$(document).on("click", "#more", function(e) {
		moreReview();
	});
})



function addLikeSessionExists() {
	alert("addLikeSessionExists")
}

function addLikeSessionNotExists() {
	alert("addLikeSessionNotExists")
	$("#login").attr('class', 'pull-right nav signin-dd open');
	$("#quick_sign_in").attr('aria-expanded', true);
}
