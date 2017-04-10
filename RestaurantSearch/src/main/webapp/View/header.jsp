<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>맛집검색 - 헤헤</title>

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

<!-- styleswitcher - demo only -->
<link href="design/css/color_scheme/orange.css"
	rel="alternate stylesheet" type="text/css" title="orange" />
<link href="design/css/color_scheme/red.css" rel="alternate stylesheet"
	type="text/css" title="red" />
<link href="design/css/color_scheme/pink.css" rel="alternate stylesheet"
	type="text/css" title="pink" />
<link href="design/css/color_scheme/yellow.css"
	rel="alternate stylesheet" type="text/css" title="yellow" />
<link href="design/css/color_scheme/darkgreen.css"
	rel="alternate stylesheet" type="text/css" title="darkgreen" />
<link href="design/css/color_scheme/green.css"
	rel="alternate stylesheet" type="text/css" title="green" />
<link href="design/css/color_scheme/darkblue.css"
	rel="alternate stylesheet" type="text/css" title="darkblue" />
<link href="design/css/color_scheme/blue.css" rel="alternate stylesheet"
	type="text/css" title="blue" />
<link href="design/css/color_scheme/brown.css"
	rel="alternate stylesheet" type="text/css" title="brown" />
<link href="design/css/color_scheme/lightgrey.css"
	rel="alternate stylesheet" type="text/css" title="lightgrey" />
<!-- /styleswitcher - demo only -->

<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->
<!-- <link href="design/plugins/styleswitcher/styleswitcher.css" rel="stylesheet" type="text/css" />		 -->

<!-- Morenizr -->
<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$("#searchBox").click(function() {
			$(".subbox").toggle();
			/* $("#wrapper").css('background-color','black'); */
		});

		$(".popSearButton").click(function() {
			$(".popSearButton").css('border-bottom', 'thick solid brown');
			$(".relSearButton").css('border-bottom', 'thick solid grey');
		})

		$(".relSearButton").click(function() {
			$(".popSearButton").css('border-bottom', 'thick solid grey');
			$(".relSearButton").css('border-bottom', 'thick solid brown');
		})

	});
</script>

</head>
<body>
	<!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="design/images/boxed_background/1.jpg"  -->

	<!-- TOP NAV -->
	<header id="topHead">
		<div class="container">

			<!-- Mobile Menu Button -->
			<button class="btn btn-mobile" data-toggle="collapse"
				data-target=".nav-main-collapse">
				<i class="fa fa-bars"></i>
			</button>

			<!-- Logo text or image -->
			<a class="logo" href="index.html"> <img
				src="design/images/logo.png" alt="Atropos" />
			</a>

			<!-- Top Nav -->
			<!-- <div class="navbar-collapse nav-main-collapse collapse pull-right">
				<button type="button" class="btn btn-danger">회원가입</button>
				<button type="button" class="btn btn-success">로그인</button> -->
			<!-- SIGN IN -->
			<div class="navbar-collapse nav-main-collapse collapse pull-right">
				<a class="dropdown-toggle" href="boardList.do"> 게시판 <i
					class="fa fa-angle-down"></i>
				</a>
			</div>
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
								placeholder="Username or email">
						</div>

						<div class="input-group">

							<!-- password -->
							<input required type="password" class="form-control"
								placeholder="Password">

							<!-- submit button -->
							<span class="input-group-btn">
								<button class="btn btn-primary btn-xs">로그인</button>
							</span>

						</div>

						<div class="checkbox">
							<!-- remmember -->
							<label> <input type="checkbox"> Remember me
								&bull; <a href="page-signin.html">Forgot password?</a>
							</label>
						</div>

					</form>

					<hr />

					<!-- <a href="#" class="btn-facebook fullwidth radius3"><i class="fa fa-facebook"></i> Connect With Facebook</a>
						<a href="#" class="btn-twitter fullwidth radius3"><i class="fa fa-twitter"></i> Connect With Twitter</a> -->
					<!--<a href="#" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Connect With Google</a>-->

					<p class="bottom-create-account">
						<a href="memberRegister.do">회원 가입</a>
					</p>
				</div>
			</div>
			<!-- /SIGN IN -->
		</div>

		<!-- 		</div> -->
	</header>

	<span id="header_shadow"></span>
	<!-- /TOP NAV -->