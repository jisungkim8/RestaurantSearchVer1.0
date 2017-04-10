<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800"
	rel="stylesheet" type="text/css" />

<!-- CORE CSS -->
<link href="design/css/bootstrap-theme.css" rel="stylesheet"/>
<link href="design/css/elegant-icons-style.css" rel="stylesheet" />

<link href="design/css/widgets.css" rel="stylesheet"/>
<link href="design/css/style.css" rel="stylesheet"/>
<link href="design/css/style-responsive.css" rel="stylesheet" />
<link href="design/css/xcharts.min.css" rel=" stylesheet"/> 
<link href="design/css/jquery-ui-1.10.4.min.css" rel="stylesheet"/>
 
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
<link href="design/plugins/styleswitcher/styleswitcher.css" rel="stylesheet" type="text/css" />		
	
<!-- Morenizr -->
<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>

<style type="text/css">

.equal, .equal > div {  
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    flex:1 0 auto;
}

</style>
</head>
<body  style="margin: 0px;">
	<header id="topHead">
		<div class="container">

			<!-- Mobile Menu Button -->
			<button class="btn btn-mobile toggle-nav" style="margin-top: 0px;" data-original-title="Toggle Navigation" data-target=".nav-main-collapse">
				<i class="fa fa-bars"></i>
			</button>
			
			<!-- Logo text or image -->
			<a class="logo" href="restaurantMain.do" style="margin-top: 0px;"> 
				<img src="design/images/logo.png" alt="Atropos" />
			</a>

			<!-- Top Nav -->
				<div class="pull-right nav signin-dd">
					<a id="quick_sign_in" href="page-signin.html" data-toggle="dropdown"><span class="btn btn-success">로그인</span></a>
					<div class="dropdown-menu" role="menu" aria-labelledby="quick_sign_in">

						<h4>Sign In</h4>
						<form action="page-signin.html" method="post" role="form">

							<div class="form-group"><!-- email -->
								<input required type="email" class="form-control" placeholder="Username or email"/>
							</div>

							<div class="input-group">

								<!-- password -->
								<input required type="password" class="form-control" placeholder="Password"/>
								
								<!-- submit button -->
								<span class="input-group-btn">
									<button class="btn btn-primary btn-xs">로그인</button>
								</span>

							</div>

							<div class="checkbox"><!-- remmember -->
								<label>
									<input type="checkbox"> Remember me &bull; <a href="page-signin.html">Forgot password?</a>
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
	
	<aside>
		<!-- <div id="sidebar"  class="nav-collapse "> -->
		<div id="sidebar" class="nav" style="z-index: 2;">
			<!-- sidebar menu start--> 
			<ul class="sidebar-menu">
				<li class="sub-menu">
					<a href="javascript:;" class="" style="min-height: 55px;">
						<i	class="icon_house_alt" style="float: left;"></i>
						<span style="float: left; margin-right: 10px;">키워드</span>
						
						<input  id="keyword_input" type="text" class="col-sm-8" value="${keyword}" style="color: #1A1A1A;" placeholder="장소" />
					</a>
				</li>
					
				<li class="sub-menu">
					<a href="javascript:;" class="" >
						<i class="icon_genius"></i>
							<span>상세검색</span> 
						<span	class="menu-arrow arrow_carrot-right"></span>
					</a>
					
					<ul class="sub"> 
						<li class="sub-menu">
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 25px;">가격</span> 
						
								<input  type="text" class="col-sm-3" style="height: 25px; margin-right:5px;"placeholder="초밥"/>
									<span  style="float: left; margin-right: 5px;">~</span>
								<input  type="text" class="col-sm-3" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
						
						<li class="sub-menu">
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 25px;">장소</span> 
						
								<input  type="text" class="col-sm-8" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
						
						<li class="sub-menu">
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 25px;">장르</span> 
						
								<input  type="text" class="col-sm-8" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
					
						<li class="sub-menu">
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 25px;">용도</span> 
						
								<input  type="text" class="col-sm-8" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
						
						<li>
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 25px;">예약</span> 
						
								<input  type="text" class="col-sm-8" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
						
						<li>
							<a href="javascript:;" class="" style="padding-top: 5px;">
								<i class="icon_document_alt" style="float: left;"></i> 
								<span style="float: left; margin-right: 10px;">주차장</span> 
						
								<input  type="text" class="col-sm-8" style="height: 25px;"placeholder="초밥"/>
							</a>
						</li>
					</ul>
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
	<div id="map" style="width: 100%; min-height: 900px; height: 100%; z-index: 1;"> 
	</div> 

	<script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Smnb3AyBYKR9Jqvcg1nd"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
	<script type="text/javascript">  
	var restaurantList = [];
	
	var restaurant_addr_list = [];
	var restaurant_jibun_addr_list = [];
	var restaurant_doro_addr_list = [];
	var abbr_food_keywords = [];
	var abbr_theme_keywords = [];
	
	var markers = [];
	
	var infowindow = null;
	/* var contentStrings = [];
	var infowindows = []; */
	
	function init_restaurant_array() {
		restaurantList = [];
		restaurant_addr_list = [];
		restaurant_jibun_addr_list = [];
		restaurant_doro_addr_list = [];
		abbr_food_keywords = [];
		abbr_theme_keywords = [];
		
		contentStrings = [];
		infowindows = [];
		
		if (markers.length != 0) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
		}
		
		markers = [];
	}
	
	function getRestaurantByKeywordAndPageNum(keyWord, pageNum) {
		init_restaurant_array();
		$.ajax({ 
			type: "POST",			// POST방식 요청
			data: {"keyword": keyWord, "pageNum": pageNum},
			dataType: "json",		// RETURN 받을 데이터 형(JSON객체)
			url: "getRestaurants.do",		// 요청 URL.. 
			success: function (pagingData) {  // 콜백 함수.. 매개변수의 result가 위의 obj1 객체로 매핑되어 옴.
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
					aTag.setAttribute("href", "restaurantDetView.do?restaurantId=" + restaurantId);
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

				// 마지막에 지도에 마커 표시하기... 
				if (restaurantList.length != 0) {
					show_markers_on_screen(restaurantList);
					
					// 마커에 이벤트처리기 등록 
					if (markers.length != 0) {
						add_events_to_all_markers();
					}
				}
			}
		});
	}
	
	$(document).ready(getRestaurantByKeywordAndPageNum('${keyword}', 1));
	
	function pageMove() {
		var keyWord = $("#keyword_input").val();
		var pageNum = 1;
		
		console.log('keyWord = ' + keyWord);
		console.log('pageNum = ' + 1);
		getRestaurantByKeywordAndPageNum(keyWord, pageNum);
	}
	
	$(document).on( "keyup", function(event) {
		if (event.keyCode == 13) {
			console.log(event.keyCode);
			pageMove();	
		}
	});
		
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 8,
	    zoomControl: true, //줌 컨트롤의 표시 여부 
        zoomControlOptions: { //줌 컨트롤의 옵션
            position: naver.maps.Position.TOP_RIGHT
        }
	}); 

	function make_markers_by_restaurant_length(restaurant_length) {
		var marker = null;
		
		for (var restaurant_index = 1; restaurant_index <= restaurant_length; restaurant_index++) {
			marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(37.3595704, 127.105415),
			    map: map
			});
			
			markers.push(marker);
		}
		console.log(markers);
	}
	
	// result by latlng coordinate
	function searchAddressToCoordinate(address, restaurant_index) {
	    naver.maps.Service.geocode({
	        address: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
  
	        var item = response.result.items[0],
	            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
	            point = new naver.maps.Point(item.point.x, item.point.y);

	        markers[restaurant_index].setPosition(point);
	        //map.setCenter(point);
	    });
	}

	
	function show_markers_on_screen(restaurantList) {
		var addr_temp = [];
		
		for (var restaurant_index = 0; restaurant_index < restaurantList.length; restaurant_index++) {
			console.log(restaurant_index);
			restaurant_addr_list.push(restaurantList[restaurant_index].addr);
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
			searchAddressToCoordinate(restaurant_doro_addr_list[restaurant_index], restaurant_index);
		}
	}
    
	function add_events_to_all_markers() {
		for (var marker_index = 0; marker_index < markers.length; marker_index++) {
			add_event_to_marker(marker_index);
		}
	}
	 
	var restaurant_name_tag = null;
	var restaurant_addr_tag = null;
	var restaurant_img_tag = null;
	var restaurant_div_phone_tag = null;
	var restaurant_food_string = null;
	var restaurant_theme_string = null;
	var restaurant_home_page_string = null;
	
	var contentString = null;

	function init_info_str() {
		restaurant_name_tag = '   ';
		restaurant_addr_tag = '   ';
		restaurant_img_tag = '       ';
		restaurant_div_phone_tag = '       ';
		restaurant_food_string = '			';
		restaurant_theme_string = '			';
		restaurant_home_page_string = '       ';
		
		contentString = [
	        '<div style="width: 360px; height: 250px;">',
	        restaurant_name_tag,
	        restaurant_addr_tag,
	        restaurant_img_tag,
	        restaurant_div_phone_tag,
	        restaurant_food_string,
	        restaurant_theme_string,
	        restaurant_home_page_string, 
	        '   </div>', 
	        '</div>'
	    ];
	}
	
    /* .join('') */ // 공백('')을 구분자로 배열의 원소들을 직렬화하여 string형식으로 변환함(태그생성)
		
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
		
		restaurant_img_tag += "<img src='";
		restaurant_img_tag += restaurantList[marker_index].representPhoto +"' ";
		restaurant_img_tag += "width='140' height='140' alt='' class='thumb' style='float: left; margin: 10px 10px 5px 5px;'/>";
		
		restaurant_div_phone_tag += "<div style='margin:10px 5px 0px 0px;'>"
		restaurant_div_phone_tag += "전화:" + restaurantList[marker_index].phoneNumber +"<br/>";

		restaurant_food_string += "음식:" + abbr_food_keywords[marker_index] +"<br/>";
		
		restaurant_theme_string += "테마:" + abbr_theme_keywords[marker_index] + "<br/>"
		
		restaurant_home_page_string = '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>';
		
		contentString[1] = restaurant_name_tag;
		contentString[2] = restaurant_addr_tag;
		contentString[3] = restaurant_img_tag;
		contentString[4] = restaurant_div_phone_tag;
		contentString[5] = restaurant_food_string;
		contentString[6] = restaurant_theme_string;
		contentString[7] = restaurant_home_page_string;
	}
	
	infowindow = new naver.maps.InfoWindow({
	    content: contentString,
	    maxWidth: 360,
	    backgroundColor: "#eee",
	    borderColor: "#2db400",
	    borderWidth: 3,
	    anchorSize: new naver.maps.Size(30, 30),
	    anchorSkew: true,
	    anchorColor: "#eee",
	    pixelOffset: new naver.maps.Point(20, -20)
	});
	
	function add_event_to_marker(marker_index) {
		naver.maps.Event.addListener(markers[marker_index], "click", function(e) {
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
	<script type="text/javascript" 	src="design/plugins/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.appear.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script>
	<script type="text/javascript" src="design/plugins/masonry.js"></script>
	 
	<script src="design/plugins/jquery.scrollTo.min.js"></script>

	<script type="text/javascript"
		src="design/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- 	<script type="text/javascript"
		src="design/plugins/magnific-popup/jquery.magnific-popup.min.js"></script> -->
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
	<script src="design/plugins/nicescrolls/jquery.nicescroll.js" type="text/javascript"></script>
	<script type="text/javascript" src="design/js/scripts2.js"></script>
</body>
</html>