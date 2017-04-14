<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>맛집검색 - ${keyword}</title>

<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />

<!-- WEB FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800"
	rel="stylesheet" type="text/css" />

<!-- CORE CSS -->
<link href="design/css/bootstrap-theme.css" rel="stylesheet" />
<link href="design/css/elegant-icons-style.css" rel="stylesheet" />

<link href="design/css/widgets.css" rel="stylesheet" />
<link href="design/css/style.css" rel="stylesheet" />
<link href="design/css/style-responsive.css" rel="stylesheet" />
<link href="design/css/xcharts.min.css" rel=" stylesheet" />
<link href="design/css/jquery-ui-1.10.4.min.css" rel="stylesheet" />

<!--  -->
<link href="design/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="design/css/font-awesome.css" rel="stylesheet"
	type="text/css" />
<link href="design/plugins/magnific-popup/magnific-popup.css"
	rel="stylesheet" type="text/css" />
<link href="design/css/animate.css" rel="stylesheet" type="text/css" />
<link href="design/css/superslides.css" rel="stylesheet" type="text/css" />

<!-- REALESTATE -->
<link href="design/css/realestate.css" rel="stylesheet" type="text/css" />

<!-- THEME CSS -->
<link href="design/css/essentials.css" rel="stylesheet" type="text/css" />
<link href="design/css/layout.css" rel="stylesheet" type="text/css" />
<link href="design/css/layout-responsive.css" rel="stylesheet"
	type="text/css" />
<link href="design/css/color_scheme/orange.css" rel="stylesheet"
	type="text/css" />

<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->
<link href="design/plugins/styleswitcher/styleswitcher.css"
	rel="stylesheet" type="text/css" />

<!-- Morenizr -->
<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>

<style type="text/css">
.equal, .equal>div {
	display: -webkit-box;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	flex: 1 0 auto;
}

.panel .panel-heading {
	line-height: 20px;
	min-height: 20px;
	border-radius: 2px;
}

.panel-default>.panel-heading {
	padding: 3px 12px;
}

.panel-body {
	padding: 11px;
}
</style>
</head>
<body style="margin: 0px;">
	<header id="topHead">
	<div class="container">

		<!-- Mobile Menu Button -->
		<button class="btn btn-mobile toggle-nav" style="margin-top: 0px;"
			data-original-title="Toggle Navigation"
			data-target=".nav-main-collapse">
			<i class="fa fa-bars"></i>
		</button>

		<!-- Logo text or image -->
		<a class="logo" href="restaurantMain.do" style="margin-top: 0px;">
			<img src="design/images/logo.png" alt="Atropos" />
		</a>

		<!-- Top Nav -->
		<div class="pull-right nav signin-dd">
			<a id="quick_sign_in" href="page-signin.html" data-toggle="dropdown"><span
				class="btn btn-success">로그인</span></a>
			<div class="dropdown-menu" role="menu"
				aria-labelledby="quick_sign_in">

				<h4>Sign In</h4>
				<form action="page-signin.html" method="post" role="form">

					<div class="form-group">
						<!-- email -->
						<input required type="email" class="form-control"
							placeholder="Username or email" />
					</div>

					<div class="input-group">

						<!-- password -->
						<input required type="password" class="form-control"
							placeholder="Password" />

						<!-- submit button -->
						<span class="input-group-btn">
							<button class="btn btn-primary btn-xs">로그인</button>
						</span>

					</div>

					<div class="checkbox">
						<!-- remmember -->
						<label> 
							<input type="checkbox"> Remember me &bull;
								<a href="page-signin.html">Forgot password?</a>
						</label>
					</div>
				</form>
				
				<hr />

				<p class="bottom-create-account">
					<a href="memberRegister.do">회원 가입</a>
				</p>
			</div>
		</div>
		<!-- /SIGN IN -->
	</div>
	</header>

	<span id="header_shadow" style="z-index: 1;"></span>

	<div id="filter_info_window"
		style="position: fixed; background-color: gray; width: 450px; height: 90%; top: 40px; z-index: 999; border: solid black 2px; border-radius: 5px; display: none;">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default"> 
				<div class="panel-heading">
					<h5 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">장소</a>
					</h5>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
						<section class="panel"> 
							<header class="panel-heading tab-bg-primary ">
							<ul class="nav nav-tabs">
								<li class="active">
									<a data-toggle="tab" href="#home">강남</a>
								</li>
								<li class="">
									<a data-toggle="tab" href="#about">강북</a>
								</li>
								<li class="">
									<a data-toggle="tab" href="#contact">인천</a>
								</li>
								<li class="">
									<a data-toggle="tab" href="#profile">경기</a>
								</li>
								<li class="">
									<a data-toggle="tab" href="#profile2">부산</a>
								</li>
								<li class="">
									<a data-toggle="tab" href="#profile2">광주</a>
								</li>
								<li class="">
									<!-- <a data-toggle="tab" href="#profile2">. . .</a> -->
									
									<!-- <div class="btn-group">
									<button id="btnGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										...<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="btnGroupVerticalDrop1">
										<li>
											<a data-toggle="tab" href="#profile2">부산</a>
										</li>
										<li>
											<a data-toggle="tab" href="#contact">인천</a>
										</li>
									</ul>
								</div> -->
							</li>
							</ul>
							</header>
						
							<div class="panel-body">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
									
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> 
												<input	type="checkbox" id="location_checkbox_gangnam" name="location_checkbox" value="강남역"> 
												강남역
											</label> 
											<label class="btn btn-primary"> 
												<input type="checkbox" id="location_checkbox_garosu" name="location_checkbox" value="가로수길">
												가로수길 
											</label>
											<label class="btn btn-primary"> 
												<input	type="checkbox" id="location_checkbox_sinsa/apgu" name="location_checkbox" value="신사동_압구정">
												 신사/압구정 
											</label>
											<label class="btn btn-primary"> 
												<input	type="checkbox" id="location_checkbox_gangdong" name="location_checkbox" value="강동구">
												 강동구 
											</label>
										</div>
									</div>
								</div>
									<div id="about" class="tab-pane">강북</div>
									<div id="contact" class="tab-pane">인천</div>
									<div id="profile" class="tab-pane">경기</div>
									<div id="profile2" class="tab-pane">부산</div>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">음식</a>
					</h5>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="btn-row">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> 
									<input	type="checkbox" id="food_checkbox_korean" name="food_checkbox" value="한식"> 
									한식
								</label> 
								<label class="btn btn-primary"> 
									<input type="checkbox" id="food_checkbox_japanese" name="food_checkbox" value="중식">
									중식
								</label> 
								<label class="btn btn-primary"> 
									<input	type="checkbox" id="food_checkbox_chinese" name="food_checkbox" value="일식">
									 일식 
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">가격대</a>
					</h5>
				</div>
				<div id="collapse3" class="panel">
					<div class="panel-body" style="text-align: center;">
							<div class="btn-row">
                                  <div class="btn-group" data-toggle="buttons">
                                      <label class="btn btn-default" style="width: 80px;">
                                          <input type="radio" name="price_radio" id="price_radio_under_10k" style="margin: 0 auto;" value="10000--">
                                          	만원미만
                                      </label>
                                      <label class="btn btn-default" style="width: 80px;">
                                          <input type="radio" name="price_radio" id="price_radio_over_10k" value="10000++" > 
                                          	만원대
                                      </label>
                                      <label class="btn btn-default" style="width: 80px;">
                                          <input type="radio" name="price_radio" id="price_radio_over_20k" value="20000++" > 
                                          	2만원대
                                      </label>
                                      <label class="btn btn-default" style="width: 80px;">
                                          <input type="radio" name="price_radio" id="price_radio_over_30k" value="30000++"> 
                                          	3만원++
                                      </label>
                                      <label class="btn btn-default active" style="width: 80px;"> 
                                          <input type="radio" name="price_radio" id="price_radio_over_40k" value="가격:무관" checked="checked"> 
                                          	무관
                                      </label>
                                  </div>
                            </div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">예약</a>
					</h5>
				</div>
				<div id="collapse4" class="panel">
					<div class="panel-body" style="text-align: center;">
						<div class="btn-row">
                             <div class="btn-group" data-toggle="buttons">
                                 <label class="btn btn-info">
                                     <input type="radio" name="booking_radio" id="booking_radio_able_to_book" value="예약:가능">
                                     	가능
                                 </label>
                                 <label class="btn btn-info active">
                                     <input type="radio" name="booking_radio" id="booking_radio_unable_to_book_" value="예약:무관" checked="checked"> 
                                     	무관
                                 </label>
                             </div>
                         </div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">주차장</a>
					</h5>
				</div>
				<div id="collapse5" class="panel">
					<div class="panel-body" style="text-align: center;">
						<!-- <input type="radio" name="parking" id="parking_radio_parkable" value="주차:가능">가능</input> 
						<input type="radio" name="parking" id="parking_radio_unparkable" checked="checked" value="주차:무관">무관</input> -->
						 <div class="btn-group" data-toggle="buttons">
                             <label class="btn btn-info">
                                 <input type="radio" name="parking_radio" id="parking_radio_parkable" value="주차:가능">
                                 	가능
                             </label>
                             <label class="btn btn-info active">
                                 <input type="radio" name="parking_radio" id="parking_radio_unparkable" value="주차:무관" checked="checked"> 
                                 	무관
                             </label>
                         </div>
					</div>
				</div>
			</div>

		</div>

		<div style="margin-top: 15px; text-align: center;">
			<a class="btn btn-default btn-lg" style="width: 128px;"
				href="javascript:close_filter_window();"
				title="Bootstrap 3 themes generator">닫기</a> <a
				class="btn btn-info btn-lg" style="width: 128px;"
				href="javascript:get_restaurant_data_by_keyword_and_filter_info('',1);"
				title="Bootstrap 3 themes generator">적용</a>
		</div>


	</div>
	<aside> 
	<div id="sidebar" class="nav" style="z-index: 2;">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li class="sub-menu"><a href="javascript:;" class="" style="min-height: 55px;"> 
				<i class="icon_house_alt" style="float: left;"></i> 
				<span style="float: left; margin-right: 10px;">키워드</span> 
				<input	id="keyword_input" type="text" class="col-sm-8" value="${keyword}"	style="color: #1A1A1A;" placeholder="장소" />
				</a>
			</li>

			<li class="sub-menu">
				<a href="javascript:open_filter_window();" class=""> 
					<i class="icon_genius"></i> <span>상세검색</span>
				</a>
			</li>

			<li id="cuisine" class="sub-menu" style="clear: left; height: 500px;">
				<ul id="cuisine_list" style="padding-left: 0px;">
				</ul>
			</li>

			<li id="paging_html" class="sub-menu" style="display: inline;">
			</li>
		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside>

	<!--sidebar end-->
	<div id="map"
		style="width: 100%; min-height: 1200px; height: 100%; z-index: 1;">
	</div>

	<script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Smnb3AyBYKR9Jqvcg1nd"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
	<script type="text/javascript">
	var previous_location = [];
	var previous_food = [];
	var previous_booking = null;
	var previous_parking = null;
	var previous_price = null;
	
	var min_x_position = 0;
	var max_x_position = 0;
	var min_y_position = 0;
	var max_y_position = 0;
	
	var checking_array = [];
	
	function init_restaurant_filter_values() {
		previous_location = [];
		previous_food = [];
		previous_booking = '';
		previous_parking = '';
		previous_price = '';
	}
	
	function open_filter_window() {
		console.log("open_filter_window");
		$("#filter_info_window").css("display", "block");	 
	} 
	
	function close_filter_window() {
		$("#filter_info_window").css("display", "none");	
	}
	
	var restaurantList = [];
	
	var restaurant_addr_list = [];
	var restaurant_jibun_addr_list = [];
	var restaurant_doro_addr_list = [];
	var abbr_food_keywords = [];
	var abbr_theme_keywords = [];
	
	var markers = [];
	
	var infowindow = null;
	
	function init_restaurant_array() {
		restaurantList = [];
		restaurant_addr_list = [];
		restaurant_jibun_addr_list = [];
		restaurant_doro_addr_list = [];
		abbr_food_keywords = [];
		abbr_theme_keywords = [];
		
		min_x_position = 0;
		max_x_position = 0;
		min_y_position = 0;
		max_y_position = 0;
		
		contentStrings = [];
		infowindows = [];
		
		checking_array = [];
		
		if (markers.length != 0) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
		}
		
		markers = [];
	}
	
	function show_restaurant_list_by_paging_data(pagingData) {  // 콜백 함수.. 매개변수의 result가 위의 obj1 객체로 매핑되어 옴.
		init_restaurant_array();
		
		restaurantList = pagingData["restaurantList"]; //currentPage, keyword, pagingHtml
		var currentPage = pagingData["currentPage"];
		var keyword = pagingData["keyword"];
		var pagingHtml = pagingData["pagingHtml"];
		
	 	var liTag = null;
		var aTag = null;
		var imgDiv = null;
		var infoDiv = null;
		var imgTag = null;
		var h5Tag = null;
		
		var reviewSmallTag = null;
		var phoneSmallTag = null;
		var foodSmallTag = null;
		var themeSmallTag = null;
		var addrSmallTag = null;
		
		var divTag = null;
		var smallTag = null;
		
		var restaurantId = "";
		var restaurantName = "";
		var representPhoto = "";
		var addr = "";
		var phoneNumber = "";
		var reviewNumber = "";
		var locationKeywords = "";
		var foodKeywords = "";
		var themeKeywords = "";
		var reviewAverageScore ="";
		
		var nameText = "";
		var reviewText = "";
		var phoneText = "";
		var foodText = "";
		var themeText = "";
		var addrText = "";
		
		var cuisine_list = document.getElementById("cuisine_list");		
		
		console.log("cuisine_list = " + cuisine_list);
		
		cuisine_list.innerHTML = "";
		var brTag = null;
		
		for (var i = 0; i < restaurantList.length; i++) {
			restaurantId = restaurantList[i].restaurantId;
			restaurantName = restaurantList[i].restaurantName;
			representPhoto = restaurantList[i].representPhoto;
			addr = restaurantList[i].addr;
			phoneNumber = restaurantList[i].phoneNumber;
			locationKeywords = restaurantList[i].locationKeywords;
			foodKeywords = restaurantList[i].foodKeywords;
			themeKeywords = restaurantList[i].themeKeywords;
			reviewNumber = restaurantList[i].reviewNumber;
			reviewAverageScore = restaurantList[i].reviewAverageScore;
			
			var abbrKeywords = "";
			if (foodKeywords.length >= 44) {
				abbrKeywords = foodKeywords.substr(0, 44);
				abbrKeywords += "...";
				foodKeywords = abbrKeywords;
			}
			
			abbr_food_keywords.push(foodKeywords);
			
			if (themeKeywords.length >= 20) {
				abbrKeywords = themeKeywords.substr(0, 20);
				abbrKeywords += "...";
				themeKeywords = abbrKeywords;
			}
			
			abbr_theme_keywords.push(themeKeywords);
			
			liTag = document.createElement("li");
			aTag = document.createElement("a");
			imgDiv = document.createElement("div");
			infoDiv = document.createElement("div");
			imgTag = document.createElement("img");
			h5Tag = document.createElement("h5");
				
			reviewSmallTag = document.createElement("small");
			phoneSmallTag = document.createElement("small");
			foodSmallTag = document.createElement("small");
			themeSmallTag = document.createElement("small");
			addrSmallTag = document.createElement("small");
			
			nameText = restaurantName;
			reviewText = "리뷰:" + reviewNumber + "/점수:" + reviewAverageScore;
			phoneText = "전화번호:" + phoneNumber;
			foodText = "음식:" + foodKeywords;
			themeText = "테마:" + themeKeywords;
			
			addrText = "주소:" + addr;
			
			h5Tag.setAttribute("style", "display: table-cell; color: orange;");
			h5Tag.innerText = nameText;
			
			reviewSmallTag.innerText = reviewText;
			phoneSmallTag.innerText = phoneText;
			foodSmallTag.innerText = foodText;
			themeSmallTag.innerText = themeText;
			addrSmallTag.innerText = addrText;
			
			infoDiv.setAttribute("class", "d-flex w-100");
			infoDiv.setAttribute("style", "display: table-cell;");
			
			brTag = document.createElement("br");
			var brTag2 = document.createElement("br");
			var brTag3 = document.createElement("br");
			infoDiv.appendChild(h5Tag);
			infoDiv.appendChild(reviewSmallTag);
			infoDiv.appendChild(phoneSmallTag);
			infoDiv.appendChild(brTag3);
			infoDiv.appendChild(foodSmallTag);
			infoDiv.appendChild(brTag);
			infoDiv.appendChild(themeSmallTag);
			infoDiv.appendChild(brTag2);
			infoDiv.appendChild(addrSmallTag);
			
			imgTag.setAttribute("style", "width: 140px; height: 140px;");
			imgTag.setAttribute("src", representPhoto);
			
			imgDiv.setAttribute("class", "col-sm-4");
			imgDiv.setAttribute("style", "width: 140px; height: 140px; padding: 0px; margin-right: 10px; display: table-cell; background-color: green;");
			
			imgDiv.appendChild(imgTag);
			
			aTag.setAttribute("id", restaurantId);
			aTag.setAttribute("href", "restaurantDetView.do?restaurantId=" + restaurantId + "&moreCount=0&filterName=reviewId");
			aTag.setAttribute("class", "list-group-item-action flex-column");  
			 
			aTag.appendChild(imgDiv);
			aTag.appendChild(infoDiv);
			
			liTag.appendChild(aTag);
			
			cuisine_list.appendChild(liTag);
		}
		
		liTag = document.getElementById("paging_html");
		liTag.innerHTML = "";
		
		divTag = document.createElement("div");
		divTag.setAttribute("style", "background-color: green;  width: 30%;");
		
		smallTag = document.createElement("small");
		smallTag.innerHTML = pagingHtml; 
		
		divTag.appendChild(smallTag);
		
		liTag.appendChild(divTag);
		
		show_markers_and_add_event_listener(); 
	}
	
	function show_markers_and_add_event_listener() {
		// 마지막에 지도에 마커 표시하기... 
		if (restaurantList.length != 0) {
			show_markers_on_screen(restaurantList);
			
			// 마커에 이벤트처리기 등록 
			if (markers.length != 0) {
				add_events_to_all_markers();
			}
		}
	}
	
	function getRestaurantByKeywordAndPageNum(keyword, pageNum) {
		$.ajax({ 
			type: "POST",			// POST방식 요청
			data: {"keyword": keyword, "pageNum": pageNum},
			dataType: "json",		// RETURN 받을 데이터 형(JSON객체)
			url: "getRestaurants.do",		// 요청 URL.. 
			success: show_restaurant_list_by_paging_data
		});
	}

	function get_restaurant_data_by_keyword_and_filter_info
		(keyword, page_num) {
		
		if (keyword.trim() == '') {
			keyword = $("#keyword_input").val();	
		}
		
		if (keyword.trim() == '') {
			alert("키워드를 입력해주세요.");
			return;
		}
		
		init_restaurant_filter_values(); 
		
		$("input:checkbox[name='location_checkbox']:checked").each(
				function () {
					previous_location.push($(this).val());
				});
		$("input:checkbox[name='food_checkbox']:checked").each(
				function () {
					previous_food.push($(this).val());
				});
		
		$("input:radio[name='booking_radio']:checked").each(
				function () {
					previous_booking  = $(this).val(); 
				});
		
		$("input:radio[name='parking_radio']:checked").each(
				function () {
					previous_parking = $(this).val(); 
				});
		
		$("input:radio[name='price_radio']:checked").each(
				function () {
					previous_price = $(this).val(); 
				});
		
		var json_search_option_object = {
			"keyword": keyword,
			"pageNum": page_num,
			"location": previous_location,
			"food": previous_food,
			"price": previous_price,
			"booking": previous_booking,
			"parking": previous_parking
		};
		
		$.ajax({
			type : "POST", // POST방식 요청
			data : JSON.stringify(json_search_option_object),
			contentType: "application/json; charset=UTF-8",
			dataType : "json", // RETURN 받을 데이터 형(JSON객체)
			url : "getRestaurantsByFilter.do", // 요청 URL.. 
			success : show_restaurant_list_by_paging_data
		});
		
		$("#filter_info_window").css("display", "none");
	}

		$(document).ready(getRestaurantByKeywordAndPageNum('${keyword}', 1));

		function update_restaurants() {
			var keyword = $("#keyword_input").val();
			var pageNum = 1;

			if (keyword.trim() == "") {
				alert("검색어를 입력해주십시오.");
				return;
			}

			get_restaurant_data_by_keyword_and_filter_info(keyword, pageNum);
		}

		$(document).on("keyup", function(event) {
			if (!$('#filter_info_window').is(':visible')) { // 필터 정보창이 표시 되지 않을 때에만 엔터키가 먹힘.. 
				if (event.keyCode == 13) {
					console.log(event.keyCode);
					update_restaurants();
				}
			}
		});

		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 8,
			zoomControl : true, //줌 컨트롤의 표시 여부 
			zoomControlOptions : { //줌 컨트롤의 옵션
				position : naver.maps.Position.RIGHT_CENTER
			}
		});

		function make_markers_by_restaurant_length(restaurant_length) {
			var marker = null;

			for (var restaurant_index = 1; restaurant_index <= restaurant_length; restaurant_index++) {
				marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(37.3595704, 127.105415),
					map : map
				});

				markers.push(marker);
			}
			console.log(markers);
		}

		// result by latlng coordinate
		function searchAddressToCoordinate(address, restaurant_index) {
			naver.maps.Service
					.geocode(
							{
								address : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
										: '[지번 주소]', point = new naver.maps.Point(
										item.point.x, item.point.y);
								
								if (min_x_position == 0) {
									min_x_position = point.x;
								} else {
									if (min_x_position > point.x) {
										min_x_position = point.x;
									}
								}
								
								if (max_x_position == 0) {
									max_x_position = point.x;
								} else {
									if (max_x_position < point.x) {
										max_x_position = point.x;
									}
								}
								
								if (min_y_position == 0) {
									min_y_position = point.y; 
								} else {
									if (min_y_position > point.y) {
										min_y_position = point.y;
									}
								}
								
								if (max_y_position == 0) {
									max_y_position = point.y;
								} else {
									if (max_y_position < point.y) {
										max_y_position = point.y;
									}
								}
								
								markers[restaurant_index].setPosition(point);
								
								checking_array.push(point);
								
								if (checking_array.length == restaurantList.length) {
									console.log("final min_x_position"  + min_x_position);
									console.log("final max_x_position"  + max_x_position);
									console.log("final min_y_position"  + min_y_position);
									console.log("final max_y_position"  + max_y_position);
									
									var targetLatLng = new naver.maps.LatLngBounds(
							 				new naver.maps.LatLng(min_y_position, min_x_position),
								              new naver.maps.LatLng(max_y_position, max_x_position)
								              ); 
								              	              
									var margin = { top: 0, right: 0, bottom: 0, left: 500};

									map.fitBounds(targetLatLng, margin);
								}
							});
		}

		function show_markers_on_screen(restaurantList) {
			var addr_temp = [];

			for (var restaurant_index = 0; restaurant_index < restaurantList.length; restaurant_index++) {
				console.log(restaurant_index);
				restaurant_addr_list
						.push(restaurantList[restaurant_index].addr);
			}

			for (var restaurant_index = 0; restaurant_index < restaurantList.length; restaurant_index++) {
				addr_temp = restaurant_addr_list[restaurant_index].split(",");
				restaurant_jibun_addr_list.push(addr_temp[0]);
				restaurant_doro_addr_list.push(addr_temp[1]);
			}

			console.log(restaurant_jibun_addr_list);
			console.log(restaurant_doro_addr_list);

			make_markers_by_restaurant_length(restaurantList.length);

			for (var restaurant_index = 0; restaurant_index < restaurantList.length; restaurant_index++) {
				searchAddressToCoordinate(
						restaurant_doro_addr_list[restaurant_index],
						restaurant_index);
			}
		}
		
		function add_events_to_all_markers() {
			for (var marker_index = 0; marker_index < markers.length; marker_index++) {
				add_event_to_marker(marker_index);
			}
		}

		var restaurant_name_tag = null;
		var restaurant_addr_tag = null;
		var restaurant_a_img_tag = null;
		var restaurant_img_tag = null;
		var restaurant_div_phone_tag = null;
		var restaurant_food_string = null;
		var restaurant_theme_string = null;
		var restaurant_home_page_string = null;
		

		var contentString = null;

		function init_info_str() {
			restaurant_name_tag = '   ';
			restaurant_addr_tag = '   ';
			restaurant_a_img_tag = '';
			restaurant_img_tag = '       ';
			restaurant_div_phone_tag = '       ';
			restaurant_food_string = '			';
			restaurant_theme_string = '			';
			restaurant_home_page_string = '       ';

			contentString = [ '<div style="width: 360px; height: 250px;">',
					restaurant_name_tag, restaurant_addr_tag,
					restaurant_img_tag, restaurant_div_phone_tag,
					restaurant_food_string, restaurant_theme_string,
					restaurant_home_page_string, '   </div>', '</div>' ];
		}

		function build_restaurant_info(marker_index) {
			init_info_str();

			restaurant_name_tag += "<h4>";
			restaurant_name_tag += restaurantList[marker_index].restaurantName;
			restaurant_name_tag += "</h4>";

			restaurant_addr_tag += "<div>";
			restaurant_addr_tag += restaurant_jibun_addr_list[marker_index];
			restaurant_addr_tag += " | ";
			restaurant_addr_tag += "<br/>";
			restaurant_addr_tag += restaurant_doro_addr_list[marker_index];

			
			restaurant_a_img_tag += "<a href=";
			restaurant_a_img_tag += "restaurantDetView.do?restaurantId=" + restaurantList[marker_index].restaurantId + "&moreCount=0&filterName=reviewId>";
			
			restaurant_img_tag += "<img src='";
			restaurant_img_tag += restaurantList[marker_index].representPhoto +"' ";
			restaurant_img_tag += "width='140' height='140' alt='' class='thumb' style='float: left; margin: 10px 10px 5px 5px;'/>";

			restaurant_a_img_tag += restaurant_img_tag;
			restaurant_a_img_tag += "</a>";
				
			restaurant_div_phone_tag += "<div style='margin:10px 5px 0px 0px;'>"
			restaurant_div_phone_tag += "전화:"
					+ restaurantList[marker_index].phoneNumber + "<br/>";

			restaurant_food_string += "음식:" + abbr_food_keywords[marker_index]
					+ "<br/>";

			restaurant_theme_string += "테마:"
					+ abbr_theme_keywords[marker_index] + "<br/>"

			restaurant_home_page_string = '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>';
 
			contentString[1] = restaurant_name_tag;
			contentString[2] = restaurant_addr_tag; 
			//contentString[3] = restaurant_img_tag;
			contentString[3] = restaurant_a_img_tag;
			contentString[4] = restaurant_div_phone_tag;
			contentString[5] = restaurant_food_string;
			contentString[6] = restaurant_theme_string;
			contentString[7] = restaurant_home_page_string;
		}

		infowindow = new naver.maps.InfoWindow({
			content : contentString,
			maxWidth : 360,
			backgroundColor : "#eee",
			borderColor : "#2db400",
			borderWidth : 3,
			anchorSize : new naver.maps.Size(30, 30),
			anchorSkew : true,
			anchorColor : "#eee",
			pixelOffset : new naver.maps.Point(20, -20)
		});

		function add_event_to_marker(marker_index) {
			naver.maps.Event.addListener(markers[marker_index], "click",
					function(e) {
						build_restaurant_info(marker_index);

						if (infowindow.getMap()) {
							infowindow.close();
						} else {
							infowindow.setContent(contentString.join(''));
							infowindow.open(map, markers[marker_index]);
						}
					});
		}
	</script>
	<!-- /WRAPPER -->

	<!-- FOOTER -->

	<!-- /FOOTER -->

	<!-- JAVASCRIPT FILES -->
	<script type="text/javascript"
		src="design/plugins/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.appear.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script>
	<script type="text/javascript" src="design/plugins/masonry.js"></script>

	<script src="design/plugins/jquery.scrollTo.min.js"></script>

	<script type="text/javascript"
		src="design/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="design/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="design/plugins/stellar/jquery.stellar.min.js"></script>
	<script type="text/javascript"
		src="design/plugins/knob/js/jquery.knob.js"></script>
	<script type="text/javascript"
		src="design/plugins/jquery.backstretch.min.js"></script>
	<script type="text/javascript"
		src="design/plugins/superslides/dist/jquery.superslides.min.js"></script>
	<script src="design/plugins/nicescrolls/jquery.nicescroll.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="design/js/scripts2.js"></script>
</body>
</html>