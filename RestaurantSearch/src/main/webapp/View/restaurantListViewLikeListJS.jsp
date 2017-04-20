<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<!-- Morenizr -->
	<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>

	
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=Smnb3AyBYKR9Jqvcg1nd"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps-geocoder.js"></script>
	
	<script>
	$(document)
			.ready(
					function() {
						$("#videoCnt").click(function() {
							var vidcnt = 0;
							vidcnt = vidcnt + 1;
						})

						$("#searchBox").click(function() {
							this.value = '';
							this.style.color = "#000";
							$(".subbox").show();

						})

						$(".popSearButton").click(
								function() {
									$(".popSearButton").css('border-bottom',
											'thick solid brown');
									$(".relSearButton").css('border-bottom',
											'thick solid grey');

								})

						$(".relSearButton").click(
								function() {
									$(".popSearButton").css('border-bottom',
											'thick solid grey');
									$(".relSearButton").css('border-bottom',
											'thick solid brown');
								})

						$("#login").click(
										function() {
											var registerCheck, passwd;

											//document.memInfo.submit()

											var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

											if ($("#memberId").val() == "") {
												//document.getElementById("ducheck")=>$("ducheck")
												$("#loginmsg").html("<font id='idColor' color='red'>먼저 이메일를 입력하세요</font>")
												$("#memberId").focus();//커서입력
												return;
											} else if (!regEmail.test($("#memberId").val())) {
												$("#loginmsg").html("<font id='idColor' color='red'>이메일 주소가 유효하지 않습니다.</font>")
												$("#memberId").focus();
												//history.back();
												return;
											}

											if ($("#password").val() == "") {
												//document.getElementById("ducheck")=>$("ducheck")
												$("#loginmsg").html("<font id='idColor' color='red'>패스워드를 입력하세요</font>")
												$("#loginmsg").focus();//커서입력
												return;
											}

											$.ajax({
														url : 'memberRegiCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
														//2.data:{매개변수명:값,매개변수명2:값2,,,,}
														data : {
															id : $("#memberId").val()
														},
														type : "POST",
														//3.success:콜백함수명(매개변수)
														success : function(args) {
															if (args == "register") {
																registerCheck = "register"
																$.ajax({
																			url : 'memberPwdCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
																			//2.data:{매개변수명:값,매개변수명2:값2,,,,}
																			data : {
																				id : $("#memberId").val(),
																				passwd : $("#password").val()
																			},
																			type : "POST",
																			//3.success:콜백함수명(매개변수)
																			success : function(args) {
																				if (args == "agreement") {
																					document.memInfo.submit()
																				} else {
																					$("#loginmsg").html("<font id='idColor' color='red'>패스워드가 정확하지 않습니다.</font>")
																				}
																			}
																		})
															} else {
																$("#loginmsg").html("<font id='idColor' color='red'>이메일이 정확하지 않습니다.</font>")
															}
														}
													})
										})

						$('#myProfile').click(function() {
											alert("id=>" + $('#memberId').val())
											alert("pwd=>"	+ $("#password").val())

											var memInfoForm = document.memInfoForm;
											var url = "memProfile.do";
											window
													.open(
															'',
															'memProfile',
															'width=800,height=600,left=300,top=50,toobar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no')
											memInfoForm.action = url;
											memInfoForm.method = "post";
											memInfoForm.target = "memProfile";
											memInfoForm.submit();
											function myProfile() {
												alert("__myProfile")
												//window.open('popup.html','popup','width=300,height=200,left=0,top=0,toobar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no')
											}
										})

						$('#memLeave').click(function() {
							if (confirm("정말 탈퇴하시겠습니까?") == true) {
								$.ajax({
									url : 'memLeave.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
									//2.data:{매개변수명:값,매개변수명2:값2,,,,}
									data : {
										id : $("#memberId").val()
									},
									type : "POST",
									//3.success:콜백함수명(매개변수)
									success : function(args) {
										alert("회원 탈퇴가 성공적으로 되었습니다.")
									}
								})
							} else {
								return;
							}
						})

						$("#searchBox").autocomplete({
							source : function(request, response) {
								$.ajax({
									type : 'post',
									url : "autocomplete.jsp",
									dataType : "json",
									//request.term = $("#autocomplete").val()
									data : {
										value : request.term
									},
									success : function(data) {
										//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
										response($.map(data, function(item) {
											return {
												label : item.data,
												value : item.data
											}
										}));
									}
								});
							},
							//조회를 위한 최소글자수
							minLength : 2,
							select : function(event, ui) {
								// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
							}
						});

						$('#pwdSearch')
								.click(
										function() {
											// 											alert("패스워드 찾기")
											//var memInfoForm=document.memInfoForm;
											//var url="pwdSearch.do";
											window
													.open(
															'pwdSearchView.do',
															'memProfile',
															'width=540,height=260,left=550,top=300,toobar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no')
											// memInfoForm.action=url;
											// memInfoForm.method="post";
											//memInfoForm.target="memProfile";
											// memInfoForm.submit();
										})
						$(document)
								.mousedown(
										function(e) {
											$('.subbox')
													.each(
															function() {
																if ($(this)
																		.css(
																				'display') == 'block') {
																	var l_position = $(
																			this)
																			.offset();
																	l_position.right = parseInt(l_position.left)
																			+ ($(this)
																					.width());
																	l_position.bottom = parseInt(l_position.top)
																			+ parseInt($(
																					this)
																					.height());

																	if ((l_position.left <= e.pageX && e.pageX <= l_position.right)
																			&& (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
																		//alert( 'popup in click' );
																	} else {
																		//alert( 'popup out click' );
																		$(this)
																				.hide(
																						"fast");
																	}
																}
															});
										});

						$(window).scroll(function() {
							if ($(this).scrollTop() > 585) {
								$('.containerSearch').css("display", "block");
							} else {
								$('.containerSearch').css("display", "none");
							}
						});

					});

	/* 	function loginCheck(){ 
	 alert("memberId__"+$("#memberId").val());
	 alert("password"+$("#password").val());
	 alert("loginCheck");
	 } */

	function show_subbox() {
		$(".subbox").show(fast);
	}
</script>
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
	
	
	var sidebar_height = $(window).height() - 43 - 20 - 117 - 43; 
	var windowHeight = $(window).height();
	// 헤더의 높이는 43px... 
	// 상단 메뉴위의 여백의 높이는 20px... 
	// 상단 메뉴의 높이는 117px... 
	// 하단 푸터의 높이는 43px...
	//  식당 아이템 하나의 높이는 168.8px.. 169px..
	
	function resize_sidebar_height() {
			var new_sidebar_height = windowHeight - 43 - 20 - 117 - 43;
			sidebar_height = new_sidebar_height;
			
			
		   $("#cuisine").css("height", sidebar_height);
		   $("#map").css("height", windowHeight);
		   console.log("cuisine_list_sidebar_height = " + sidebar_height);
	}  
	
	$(window).resize(function() {
	    var windowHeightNew = $(window).height(); 
	    if (windowHeight != windowHeightNew) {
	        // zoom has changed
	        // adjust your fixed element
	        windowHeight = windowHeightNew;
	        resize_sidebar_height();
	    } 
	});
	
	
	function init_restaurant_filter_values() {
		previous_location = [];
		previous_food = [];
		previous_booking = '';
		previous_parking = '';
		previous_price = '';
	}
	
	function open_filter_window() {
		console.log("open_filter_window");
		$("#filter_search_button").attr("href", "javascript:get_restaurant_data_by_member_id_and_filter_info('${memberId}',1);");
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
			data: {"keyword": keyword, "pageNum": pageNum, "sidebarHeight": sidebar_height},
			dataType: "json",		// RETURN 받을 데이터 형(JSON객체)
			url: "getRestaurants.do",		// 요청 URL.. 
			success: show_restaurant_list_by_paging_data
		});
	}

	function get_restaurant_data_by_member_id_and_filter_info
		(member_id, page_num) {
		
		console.log('get_restaurant_data_by_member_id_and_filter_info');
		
		if (member_id == '${memberId}') {  
			console.log('correctId!!');
			
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
				"memberId": member_id,
				"pageNum": page_num,
				"location": previous_location,
				"food": previous_food,
				"price": previous_price,
				"booking": previous_booking,
				"parking": previous_parking,
				"sidebarHeight": sidebar_height
			};
			
			$.ajax({
				type : "POST", // POST방식 요청
				data : JSON.stringify(json_search_option_object),
				contentType: "application/json; charset=UTF-8",
				dataType : "json", // RETURN 받을 데이터 형(JSON객체)
				url : "restaurantSearchByLikeList.do", // 요청 URL.. 
				success : show_restaurant_list_by_paging_data
			});
			
			$("#filter_info_window").css("display", "none");
		}
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
			"parking": previous_parking,
			"sidebarHeight": sidebar_height
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

		$(document).ready(function () {
			//getRestaurantByKeywordAndPageNum('${keyword}', 1)
			get_restaurant_data_by_member_id_and_filter_info('${memberId}', 1);
			resize_sidebar_height();
		});

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
			//contentString[7] = restaurant_home_page_string;
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
	<script type="text/javascript" src="design/plugins/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.appear.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script>
	<script type="text/javascript" src="design/plugins/masonry.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.scrollTo.min.js"></script>
	<script type="text/javascript" src="design/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="design/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script type="text/javascript" src="design/plugins/stellar/jquery.stellar.min.js"></script>
	<script type="text/javascript" src="design/plugins/knob/js/jquery.knob.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.backstretch.min.js"></script>
	<script type="text/javascript" src="design/plugins/superslides/dist/jquery.superslides.min.js"></script>
	<script type="text/javascript" src="design/plugins/nicescrolls/jquery.nicescroll.js"></script>
	<script type="text/javascript" src="design/js/scripts2.js"></script>