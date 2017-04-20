<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>맛집검색 - 더이상 속지 마세요!</title>

<!-- mobile settings -->
<meta name="viewport"
	content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" />

<!-- WEB FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800"
	rel="stylesheet" type="text/css" />

<!-- CORE CSS -->
<link href="design/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="design/css/font-awesome.css" rel="stylesheet"
	type="text/css" />
<link href="design/plugins/owl-carousel/owl.carousel.css"
	rel="stylesheet" type="text/css" />
<link href="design/plugins/owl-carousel/owl.theme.css" rel="stylesheet"
	type="text/css" />
<link href="design/plugins/owl-carousel/owl.transitions.css"
	rel="stylesheet" type="text/css" />
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

<!-- Morenizr -->
<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>




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
						var fileTarget = $('.filebox .upload-hidden');
						fileTarget.on('change', function() { // 값이 변경되면 
							if (window.FileReader) { // modern browser
								var filename = $(this)[0].files[0].name;
							} else { // old IE
								var filename = $(this).val().split('/').pop()
										.split('\\').pop(); // 파일명만 추출 
							}
							// 추출한 파일명 삽입 
							//$(this).siblings('.upload-name').val(filename); 
							if ($('.upload-name').val() != "") {
								var ext = filename.split('.').pop()
										.toLowerCase();
								if ($.inArray(ext, [ 'gif', 'png', 'jpg',
										'jpeg' ]) == -1) {
									alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
									return;
								}
							}
							$('.upload-name').val(filename);
						});

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
												$("#loginmsg")
														.html(
																"<font id='idColor' color='red'>먼저 이메일를 입력하세요</font>")
												$("#memberId").focus();//커서입력
												return;
											} else if (!regEmail.test($(
													"#memberId").val())) {
												$("#loginmsg")
														.html(
																"<font id='idColor' color='red'>이메일 주소가 유효하지 않습니다.</font>")
												$("#memberId").focus();
												//history.back();
												return;
											}

											if ($("#password").val() == "") {
												//document.getElementById("ducheck")=>$("ducheck")
												$("#loginmsg")
														.html(
																"<font id='idColor' color='red'>패스워드를 입력하세요</font>")
												$("#loginmsg").focus();//커서입력
												return;
											}

											$.ajax({
														url : 'memberRegiCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
														//2.data:{매개변수명:값,매개변수명2:값2,,,,}
														data : {
															id : $("#memberId")
																	.val()
														},
														type : "POST",
														//3.success:콜백함수명(매개변수)
														success : function(args) {
															if (args == "register") {
																registerCheck = "register"
																$
																		.ajax({
																			url : 'memberPwdCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
																			//2.data:{매개변수명:값,매개변수명2:값2,,,,}
																			data : {
																				id : $(
																						"#memberId")
																						.val(),
																				passwd : $(
																						"#password")
																						.val()
																			},
																			type : "POST",
																			//3.success:콜백함수명(매개변수)
																			success : function(
																					args) {
																				if (args == "agreement") {
																					document.memInfo
																							.submit()
																				} else {
																					$(
																							"#loginmsg")
																							.html(
																									"<font id='idColor' color='red'>패스워드가 정확하지 않습니다.</font>")
																				}
																			}
																		})
															} else {
																$("#loginmsg")
																		.html(
																				"<font id='idColor' color='red'>이메일이 정확하지 않습니다.</font>")
															}
														}
													})
										})

						$('#myProfile')
								.click(
										function() {
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

// 						$('#memLeave').click(function() {
// 							if (confirm("정말 탈퇴하시겠습니까?") == true) {
// 								$.ajax({
// 									url : 'memLeave.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
// 									//2.data:{매개변수명:값,매개변수명2:값2,,,,}
// 									data : {
// 										id : $("#memberId").val()
// 									},
// 									type : "POST",
// 									//3.success:콜백함수명(매개변수)
// 									success : function(args) {
// 										alert("회원 탈퇴가 성공적으로 되었습니다.")
// 									}
// 								})
// 							} else {
// 								return;
// 							}
// 						})

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


</head>
<body>
	<!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="design/images/boxed_background/1.jpg"  -->

	<!-- TOP NAV -->
	<header id="topHead">
		<div class="container">

			<!-- Mobile Menu Button -->
			<button class="btn btn-mobile" data-toggle="collapse"
				data-target=".nav-main-collapse" style="display:none">
				<i class="fa fa-bars"></i>
			</button>

			<!-- Logo text or image -->
			<a class="logo" href="index.jsp"> <img
				src="design/images/logo.png" alt="Atropos" />
			</a>

			<!-- Top Nav -->
			<!-- <div class="navbar-collapse nav-main-collapse collapse pull-right">
				<button type="button" class="btn btn-danger">회원가입</button>
				<button type="button" class="btn btn-success">로그인</button> -->
			<!-- SIGN IN -->
			<c:choose>
				<c:when test="${not empty sessionScope.userLoginInfo and sessionScope.userLoginInfo.memberId ne 'kicRestAdmin@rest.com'}">
					<div class="navbar-collapse nav-main-collapse collapse pull-right nav signin-dd" style="top: -30px;left: 30%;">
<!-- 					<div class="pull-right nav signin-dd" style="top: -30px;left: 30%;"> -->
<!-- 						<li class="dropdown"> -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<c:if test="${sessionScope.userLoginDetInfo.photoPath == null}">
									<img src="images/porfilepic_default.jpg" class="img-circle img-responsive" width="50" height="50">
								</c:if>
								
								<c:if test="${sessionScope.userLoginDetInfo.photoPath != null}">
									<img src="images/${sessionScope.userLoginDetInfo.photoPath}" class="img-circle img-responsive" width="50" height="50"> 
								</c:if>
								
<%-- 								<span> 닉네임 :<c:out value="${sessionScope.userLoginDetInfo.nickname}" /> </span> --%>
							</a>
							
							<ul class="dropdown-menu extended logout" style="width: 251px;left: -205px;top: 78%;">
								<div class="log-arrow-up"></div>
								<li class="eborder-top">
									<a href="#" id="myProfile">
										<i class="icon_profile"></i> My Profile
									</a>
								</li>
								
								 <li class="eborder-top">
                                	<a href="restaurantSearchByLikeList.do">
                                		<i class="icon_profile"></i>좋아요리스트
                                	</a>
                            	</li> 
								
								<li class="eborder-top">
									<a href="list.do" id="quick_board">
										<i class="icon_profile"></i> 게시판
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="memberLogout.do">
										<i class="icon_profile"></i> 로그아웃
									</a>
								</li>
								
<!-- 								<li class="eborder-top"> -->
<!-- 									<a href="#" id="memLeave"> -->
<!-- 										<i class="icon_profile"></i> 회원탈퇴 -->
<!-- 									</a> -->
<!-- 								</li> -->
							</ul>
<!-- 						</li> -->
						<form name="memInfoForm">
							<input type="hidden" id="memberId" name="memberId" value="${sessionScope.userLoginInfo.memberId}" /> 
							<input type="hidden" id="password" name="password" value="${sessionScope.userLoginInfo.password}" />
						</form>
					</div>
				</c:when>

				<c:when test="${sessionScope.userLoginInfo.memberId eq 'kicRestAdmin@rest.com'}">
					<div class="navbar-collapse nav-main-collapse collapse pull-right nav signin-dd" style="top: -30px;left: 30%;">
<!-- 					<div class="pull-right nav signin-dd"> -->
<!-- 						<li class="dropdown"> -->
							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
								<c:if test="${sessionScope.userLoginDetInfo.photoPath == null}">
									<img src="images/porfilepic_default.jpg" class="img-circle img-responsive" width="50" height="50"> 
								</c:if>
								
								<c:if test="${sessionScope.userLoginDetInfo.photoPath != null}">
									<img src="images/${sessionScope.userLoginDetInfo.photoPath}" class="img-circle img-responsive" width="50" height="50"> 
								</c:if>
							
<%-- 							<span> 닉네임 :<c:out value="${sessionScope.userLoginDetInfo.nickname}" /> </span> --%>
							</a>
							
							<ul class="dropdown-menu extended logout" style="width: 251px;left: -205px;top: 78%;">
								<div class="log-arrow-up"></div>
								<li class="eborder-top">
									<a href="#" id="myProfile">
										<i class="icon_profile"></i> My Profile
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="memList.do">
										<i class="icon_profile"></i> 회원관리
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="list.do" id="quick_board">
										<i class="icon_profile"></i> 게시판
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="memberLogout.do">
										<i class="icon_profile"></i> 로그아웃
									</a>
								</li>
								
<!-- 								<li class="eborder-top"> -->
<!-- 									<a href="#" id="memLeave"> -->
<!-- 										<i class="icon_profile"></i> 회원탈퇴 -->
<!-- 									</a> -->
<!-- 								</li> -->
							</ul>
<!-- 						</li> -->
						<form name="memInfoForm">
							<input type="hidden" id="memberId" name="memberId"
								value="${sessionScope.userLoginInfo.memberId}" /> <input
								type="hidden" id="password" name="password"
								value="${sessionScope.userLoginInfo.password}" />
						</form>

					</div>
				</c:when>

				<c:otherwise>

					<div class="pull-right nav signin-dd">
						<a id="quick_sign_in" href="page-signin.html"
							data-toggle="dropdown"><span class="btn btn-success">로그인</span></a>


						<div class="dropdown-menu" role="menu"
							aria-labelledby="quick_sign_in">
							<h4>Sign In</h4>
							<form name="memInfo" role="form" method="post"
								action="memberLogin.do">

								<div class="form-group">
									<!-- email -->
									<input required type="email" id="memberId" name="memberId"
										class="form-control" placeholder="Email">
								</div>

								<div class="input-group">

									<!-- password -->
									<input required type="password" id="password" name="password"
										class="form-control" placeholder="Password">

									<!-- submit button -->
									<span class="input-group-btn"> <!-- <button class="btn btn-primary btn-xs">로그인</button> -->
										<input type="hidden" name="restaurantId" value="0"> <input
										type="hidden" name="moreCount" value="0"> <input
										type="hidden" name="filterName" value="reviewId"> <input
										type="hidden" name="pageName" value="restMainView"> <input
										type="button" id="login" value="로그인"
										class="btn btn-primary pull-right push-bottom">
									</span>
								</div>
								<!-- <div class="checkbox">
									remmember
									<label> <input type="checkbox"> Remember me &bull;
										<h3 id=loginmsg></h3> <table><tr><td id="loginmsg" ></td></tr></table>
									</label>
								</div> -->
							</form>
							<hr />
							<h4>
								<a href="#" data-toggle="modal" id="pwdSearch" style="color:white">암호를 잊어버리셨나요?</a>
							</h4>
							<h5 id="loginmsg">	</h5>
							<hr />

							<!-- <a href="#" class="btn-facebook fullwidth radius3"><i class="fa fa-facebook"></i> Connect With Facebook</a>
   						    <a href="#" class="btn-twitter fullwidth radius3"><i class="fa fa-twitter"></i> Connect With Twitter</a> -->
							<!--<a href="#" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Connect With Google</a>-->

							<p class="bottom-create-account">
								<a href="memberRegister.do"><font color="#86E57F">회원
										가입</font></a>
							</p>
						</div>
					</div>
					<!-- /SIGN IN -->
				</c:otherwise>
			</c:choose>

		</div>
		<div class="containerSearch">
			<form action="restaurantSearch.do" method="get">
				<input type="text" class="input_text" id="topSearchBox"
					name="keyword" autocomplete="off" /> <input type="hidden"
					id="pageNum" name="pageNum" value="1" />
				<!-- view more button -->
				<input type="submit" value="검색"
					class="btn btn-default btn-m view-more pull-right"
					style="margin-top: 10px">
			</form>
			<span class="clearfix"></span>
		</div>

		<!-- 		</div> -->
	</header>

	<!-- <span id="header_shadow"></span> -->
	<!-- /TOP NAV -->

	<!-- <div id="darkLayover"> -->
	<!-- WRAPPER -->
	<div id="wrapper">

		<!-- SLIDER -->
		<section id="slider" class="half-screen" data-autoplay="false"
			data-mouseover-stop="false">
			<!-- data-autoplay = 'fals'e or miliseconds. Eg.: 5s = '5000' ; data-mouseover = stop on mouseover. 'true' or 'false') -->


			<ul class="slides-container">

				<!-- Item 1 -->
				<li>
					<div class="image-caption">
						<div class="inner text-center">
							<!-- text center , text-left or text-right -->

							<div class="mainPhrase">블로그, SNS... 막내야 또 속았구나 하하하</div>
							<div class="block realestate-caption">
								<!-- <p>무엇을 찾고 계신가요?</p> -->
								<span class="price">더이상 속지마세요! 맛집검색은 여기서 <br>

									<form action="restaurantSearch.do" method="get">
										<input type="text" class="input_text" id="searchBox"
											style="color: lightgray" name="keyword"
											value="검색어로 검색: 혼밥/맛집/속초/데이트" /> <input type="hidden"
											id="pageNum" name="pageNum" value="1" />
										<!-- view more button -->
										<input type="submit" value="검색"
											class="btn btn-default btn-m view-more pull-right">
									</form> <span class="clearfix"></span> <!-- /view more button -->
								</span>
							</div>
							
						</div>
						<div class="subbox">
							<button class="popSearButton">인기 검색어</button>
							<button class="relSearButton">최근 검색 기록</button>
							<div class="searchListBox">
								<c:forEach var="relarticle" items="${list}">
									<a
										href="restaurantDetView.do?restaurantId=${relarticle.restaurantID}&moreCount=0&filterName=reviewId">${relarticle.restaurantName}</a>
									<br>

								</c:forEach>
							</div>

						</div>
					</div> <!--<span class="overlay"></span>--> <!-- <div
						style="background-image: url('design/images/demo/realestate/1.jpg');"
						class="fullscreen-img"></div> -->
					<div class="youtubeWrap">
						<iframe width="560" height="315" src="design/videos/video1.mp4"
							frameborder="0" allowfullscreen></iframe>
					</div>
				</li>


			</ul>

		</section>
		<!-- /SLIDER -->


		<section class="container">
			<div class="row">

				<!-- center column -->
				<div class="col-md-9">

					<h3 class="page-header nomargin-top">
						<a href="realestate-list.html" data-toggle="tooltip"
							title="view more"><i class="fa fa-plus-square-o"></i></a> <strong
							class="styleColor">조회수 베스트</strong>맛집
					</h3>

					<div class="row">
						<c:forEach begin="0" end="3" var="article" items="${list}">
							<div class="col-md-6 col-sm-6 col-xs-12">

								<!-- item -->
								<div class="item-box">
									<figure>
										<a class="item-hover"
											href="restaurantDetView.do?restaurantId=${article.restaurantID}&moreCount=0&filterName=reviewId">
											<span class="overlay color2"></span> <span class="inner">
												<span class="block fa fa-plus fsize20"></span> <strong>식당</strong>
												보기
										</span>
										</a>
										<img alt="" class="img-responsive"
											src="${article.representPhoto}" height="271" width="409" />
									</figure>
									<div class="item-box-desc">
										<h3>${article.restaurantName}</h3>
										<h4>${article.phonenumber}</h4>
										<h5>${article.addr}</h5>
										<h2 style="color: #F07057;">평점 ${article.averageScore}</h2>

										<c:choose>
											<c:when test="${article.averagePrice <= 7000}">
												<h4 title="~7000원">$</h4>
											</c:when>
											<c:when test="${article.averagePrice <= 15000}">
												<h4 title="7000~15000원">$$</h4>
											</c:when>
											<c:when test="${article.averagePrice <= 30000}">
												<h4 title="15000~30000원">$$$</h4>
											</c:when>
											<c:otherwise>
												<h4 title="30000원 이상">$$$$</h4>
											</c:otherwise>
										</c:choose>

									</div>
								</div>
								<!-- /item -->
							</div>
						</c:forEach>
					</div>


					<h3 class="page-header">
						<a href="realestate-list.html" data-toggle="tooltip"
							title="view more"><i class="fa fa-plus-square-o"></i></a> <strong
							class="styleColor">최근 등록된</strong> 맛집
					</h3>

					<div class="row">
						<c:forEach var="newarticle" items="${newlist}">
							<div class="col-md-4 col-sm-6 col-xs-12">

								<!-- item -->
								<div class="item-box">
									<figure>
										<a class="item-hover"
											href="restaurantDetView.do?restaurantId=${newarticle.restaurantID}&moreCount=0&filterName=reviewId">
											<span class="overlay color2"></span> <span class="inner">
												<span class="block fa fa-plus fsize20"></span> <strong>식당</strong>
												보기
										</span>
										</a>
										<img alt="" class="img-responsive"
											src="${newarticle.representPhoto }" width="409" height="271" />
									</figure>
									<div class="item-box-desc">
										<h4>${newarticle.restaurantName}</h4>
										<small>평점: ${newarticle.averageScore }</small>
										<p>${newarticle.addr}</p>
									</div>
								</div>
								<!-- /item -->

							</div>

						</c:forEach>
					</div>

				</div>

				<!-- side column -->
				<div class="col-md-3">

					<!-- HOT -->
					<h3 class="page-header nomargin-top margin-bottom40">
						이번 달 <strong class="styleColor">최고의 </strong> 맛집
					</h3>
					<c:forEach var="bestarticle" items="${bestlist}">
						<!-- No #1 Hot -->
						<div class="item-box nomargin-top">
							<figure>
								<a class="item-hover"
									href="restaurantDetView.do?restaurantId=${bestarticle.restaurantID}&moreCount=0&filterName=reviewId">
									<span class="overlay color2"></span> <span class="inner">
										<span class="block fa fa-plus fsize20"></span> <strong>식당</strong>
										보기
								</span>
								</a>
								<img alt="" class="img-responsive"
									src="${bestarticle.representPhoto }" />
							</figure>
							<div class="item-box-desc">
								<h4 class="wrap">
									<a class="styleColor">평점 ${bestarticle.averageScore}의 어마어마한
										맛집</a>
								</h4>
								<small class="font300 text-center block">최고의 맛집은 바로 여기!</small>
							</div>
						</div>
						<!-- /No #1 Hot -->
					</c:forEach>

					<!-- <!-- video -->
					<iframe class="videoCnt"
						src="https://player.vimeo.com/video/190687560?byline=0&portrait=0"
						width="640" height="360" frameborder="0" webkitallowfullscreen
						mozallowfullscreen allowfullscreen></iframe>

					<a href="https://vimeo.com/190687560">주말 맛집 기행 어떠세요?</a>

					<h5 class="font300 padding10">
						<small class="text-center block"></small>
					</h5>
					<!--  video-->

					<!-- small articles -->
					<div class="row">
						<c:forEach begin="4" end="4" var="article" items="${list}">

							<div class="col-xs-6 col-md-6">
								<a
									href="restaurantDetView.do?restaurantId=${article.restaurantID}&moreCount=0&filterName=reviewId">
									<img alt="" class="img-responsive"
									src="${article.representPhoto}" />
									<h6 class="fsize12 font300 padding6 styleSecondColor">오늘은
										뭘 먹어볼까?</h6>
								</a>
							</div>
						</c:forEach>

						<c:forEach begin="5" end="5" var="article" items="${list}">

							<div class="col-xs-6 col-md-6">
								<a
									href="restaurantDetView.do?restaurantId=${article.restaurantID}&moreCount=0&filterName=reviewId">
									<img alt="" class="img-responsive"
									src="${article.representPhoto}" />
									<h6 class="fsize12 font300 padding6 styleSecondColor">오붓한
										데이트 맛집!</h6>
								</a>
							</div>
						</c:forEach>

					</div>
					<!-- /small articles -->



					<!-- TWEETS -->
					<h3 class="page-header">
						<i class="fa fa-twitter"></i> 최신 <strong class="styleColor">트윗</strong>
					</h3>
					<a class="twitter-timeline"
						href="https://twitter.com/hashtag/%EB%A7%9B%EC%A7%91"
						data-widget-id="851638311319855104">#맛집 관련 트윗</a>
					<script>
						!function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
									.test(d.location) ? 'http' : 'https';
							if (!d.getElementById(id)) {
								js = d.createElement(s);
								js.id = id;
								js.src = p
										+ "://platform.twitter.com/widgets.js";
								fjs.parentNode.insertBefore(js, fjs);
							}
						}(document, "script", "twitter-wjs");
					</script>



					<!-- SOCIALS -->
					<h3 class="page-header">
						<i class="fa fa-twitter"></i> <strong class="styleColor">Follow</strong>
						Us
					</h3>

					<a href="#" class="social fa fa-facebook"></a> <a href="#"
						class="social fa fa-twitter"></a> <a href="#"
						class="social fa fa-google-plus"></a> <a href="#"
						class="social fa fa-linkedin"></a> <a href="#"
						class="social fa fa-pinterest"></a> <a href="#"
						class="social fa fa-flickr"></a>

				</div>

			</div>

		</section>


		<section class="container">

			<!-- CALLOUT -->
			<div class="row bs-callout">
				<div class="col-md-8 text-center">
					<h3 class="padding20">
						지금 <strong>이메일 등록</strong>하시고 <strong>최신 업데이트</strong> 를 받아보세요
					</h3>
				</div>
				<div class="col-md-4">

					<p class="nomargin">이메일 주소를 등록하세요.</p>

					<form method="get" action="#" class="input-group">
						<input type="text" class="form-control" name="k" id="k" value=""
							placeholder="E-mail 주소" /> <span class="input-group-btn">
							<button class="btn btn-primary">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</form>

				</div>
			</div>
			<!-- /CALLOUT -->

		</section>

		<section class="container">

			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius responsive-line-bottom">
						<i class="lightgray fa fa-map-marker hidden-xs"></i>
						<h4>지도검색</h4>
						<p>원하는 식당을 지도에서 바로바로 검색하세요!</p>
						<a href="restaurantSearch.do?keyword=서울&pageNum=1"
							class="btn btn-primary btn-xs">검색하기</a>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius line-left responsive-line-bottom">
						<i class="lightgray fa fa-globe hidden-xs"></i>
						<h4>식당 등록</h4>
						<p>식당이 보이지 않다구요? 간편하게 지금 등록하세요.</p>
						<button type="button" class="btn btn-primary btn-xs"
							data-toggle="modal" data-target="#myModal">식당 등록하기</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Modal Header</h4>
									</div>
									<div class="modal-body">
										<!-- <article class="container">

											<div class="col-md-6 col-md-offset-3"> -->
										<form name="restaurantRegi" class="white-row"
											enctype="multipart/form-data" method="post"
											action="restaurantRegi.do">
											<div class="page-header">
												<h1>
													식당 등록 <small>Restaurant Registration</small>
												</h1>
											</div>
											<!-- <div class="form-group">
												<label for="InputID">식당 ID</label> <input type="text"
													class="form-control" id="restaurantId" name="restaurantId"
													placeholder="식당 ">
											</div> -->
											<div class="form-group" style="display: none">
												<label for="InputId">식당 Id</label> <input type="text"
													class="form-control" id="restaurantId" name="restaurantId"
													placeholder="식당 Id" value="${restaurantCount+1}">
											</div>

											<div class="form-group">
												<label for="InputName">상호명</label> <input type="text"
													class="form-control" id="restaurantName"
													name="restaurantName" placeholder="식당 이름">
											</div>
											<div class="form-group">
												<label for="tel">전화번호</label> <input type="tel"
													class="form-control" id="phoneNumber" name="phoneNumber"
													placeholder="전화번호">
											</div>
											<div class="form-group">
												<label for="keyword">키워드</label> <input type="text"
													class="form-control" id="keyword" name="keyword"
													placeholder="식당 키워드">
											</div>
											<div class="form-group">
												<label for="addr">주소</label> <input type="text"
													class="form-control" id="addr" name="addr"
													placeholder="식당 주소">
											</div>
											<div class="form-group">
												<label for="avgPrice">가격대</label> <input type="text"
													class="form-control" id="averagePrice" name="averagePrice"
													placeholder="평균 음식 가격">
											</div>

											<div class="form-group" style="display: none">
												<label for="avgScore">평점</label> <input type="text"
													class="form-control" id="averageScore" name="averageScore"
													placeholder="평점은 0부터 시작합니다." value="0" readonly>
											</div>

											<div class="form-group">
												<label for="filterInfo">필터 정보</label> <input type="text"
													class="form-control" id="filterInfo" name="filterInfo"
													placeholder="예약:가능,주차:가능">
											</div>

											<div class="filebox">
												<label for="mainPhoto">대표 사진</label>
												<div class="filebox">

													<input type="file" id="ex_filename" name="upload"
														class="upload-hidden">
												</div>
											</div>



											<hr>
											<div class="page-header">
												<h1>
													추가 정보 <small>Extra Information</small>
												</h1>
											</div>

											<div class="form-group">
												<label for="shortDesc">한 줄 설명</label> <input type="text"
													class="form-control" id="shortDesc" name="shortDesc"
													placeholder="식당을 맛있게 한줄로 표현해 주세요">
											</div>
											<div class="form-group">
												<label for="openDate">개업일</label> <input type="text"
													class="form-control" id="operStartDate"
													name="operStartDate" placeholder="예: 20170402">
											</div>
											<div class="form-group">
												<label for="inputMenu">대표 메뉴</label> <input type="text"
													class="form-control" id="representMenu"
													name="representMenu" placeholder="대표 음식">
											</div>
											<div class="form-group">
												<label for="inputName">대표자</label> <input type="text"
													class="form-control" id="representative"
													name="representative" placeholder="대표 이름">
											</div>
											<div class="form-group">
												<label for="inputHomepage">홈페이지</label> <input type="text"
													class="form-control" id="homepage" name="homepage"
													placeholder="홈페이지 주소">
											</div>
											<div class="form-group">
												<label for="openHour">영업 시간</label> <input type="text"
													class="form-control" id="operHour" name="operHour"
													placeholder="영업 시간">
											</div>

											<div class="form-group">
												<div class="col-sm-12 text-center">
													<button id="registerRestaurant" class="btn btn-default"
														type="submit">
														등록하기<i class="fa fa-check spaceLeft"></i>
													</button>
													<button class="btn btn-default" data-dismiss="modal">
														등록취소<i class="fa fa-times spaceLeft"></i>
													</button>
												</div>
												<br>
											</div>
										</form>
										<!-- </div>

										</article> -->
									</div>
									<!-- <div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</div> -->
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius line-left">
						<i class="lightgray fa fa-road hidden-xs"></i>
						<h4>자유 게시판</h4>
						<p>질문이나 공지사항을 게시판에서 확인하세요!</p>
						<a href="list.do" class="btn btn-primary btn-xs">질문하기</a>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius line-left">
						<i class="lightgray fa fa-key hidden-xs"></i>
						<h4>About Us</h4>
						<p>프로젝트를 만든 사람들입니다. 한번 들려보세요! </p>
						<a href="page-team.html" class="btn btn-primary btn-xs">자세히
							보기</a>
					</div>
				</div>

			</div>

		</section>


	</div>

	<!-- /WRAPPER -->



	<!-- FOOTER -->
	<footer>

		<!-- copyright , scrollTo Top -->
		<div class="footer-bar">
			<div class="container">
				<span class="copyright">Copyright &copy; git LLC . All Rights
					Reserved.</span> <a class="toTop" href="#topNav">BACK TO TOP <i
					class="fa fa-arrow-circle-up"></i>
				</a>
			</div>
		</div>
		<!-- copyright , scrollTo Top -->


		<!-- footer content -->
		<div class="footer-content">
			<div class="container">

				<div class="row">


					<!-- FOOTER CONTACT INFO -->
					<div class="column col-md-4">
						<h3>CONTACT</h3>

						<p class="contact-desc">더이상 시간을 낭비하지 마시고 원하는 음식을 바로 찾으세요!</p>
						<address class="font-opensans">
							<ul>
								<li class="footer-sprite address">서울시 강남구 테헤란로<br /> 1길 10
									세경빌딩<br />
								</li>
								<li class="footer-sprite phone">Phone: +82)31-8282-8949</li>
								<li class="footer-sprite email"><a
									href="mailto:support@yourname.com">FoodSearch@right.now</a></li>
							</ul>
						</address>

					</div>
					<!-- /FOOTER CONTACT INFO -->


					<!-- FOOTER LOGO -->
					<div class="column logo col-md-4 text-center">
						<div class="logo-content">
							<img class="animate_fade_in" src="design/images/logo_footer.png"
								width="200" alt="" />
							<h4>ATROPOS TEMPLATE</h4>
						</div>
					</div>
					<!-- /FOOTER LOGO -->


					<!-- FOOTER LATEST POSTS -->
					<div class="column col-md-4 text-right">
						<h3>최신 등록글</h3>

						<div class="post-item">
							<small>JANUARY 2, 2014 BY ADMIN</small>
							<h3>
								<a href="blog-post.html">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit</a>
							</h3>
						</div>
						<div class="post-item">
							<small>JANUARY 2, 2014 BY ADMIN</small>
							<h3>
								<a href="blog-post.html">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit</a>
							</h3>
						</div>
						<div class="post-item">
							<small>JANUARY 2, 2014 BY ADMIN</small>
							<h3>
								<a href="blog-post.html">Lorem ipsum dolor sit amet,
									consectetur adipiscing elit</a>
							</h3>
						</div>

						<a href="blog-masonry-sidebar.html" class="view-more pull-right">View
							Blog <i class="fa fa-arrow-right"></i>
						</a>

					</div>
					<!-- /FOOTER LATEST POSTS -->

				</div>

			</div>
		</div>
		<!-- footer content -->

	</footer>
	<!-- /FOOTER -->

	<!-- JAVASCRIPT FILES -->
	<!-- <script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script> -->
	<script type="text/javascript"
		src="design/plugins/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.appear.js"></script>
	<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script>
	<script type="text/javascript" src="design/plugins/masonry.js"></script>

	<script type="text/javascript"
		src="design/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="design/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
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

	<script type="text/javascript"
		src="design/plugins/mediaelement/build/mediaelement-and-player.min.js"></script>

	<script type="text/javascript" src="design/js/scripts.js"></script>
</body>
</html>