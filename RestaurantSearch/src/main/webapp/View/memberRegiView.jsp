<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Atropos - Responsive Multipurpose</title>
<meta name="keywords" content="HTML5,CSS3,Template" />
<meta name="description" content="" />
<meta name="Author" content="Dorin Grigoras [www.stepofweb.com]" />

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

<!-- SHOP CSS -->
<!-- <link href="design/css/shop.css" rel="stylesheet" type="text/css" /> -->

<!-- THEME CSS -->
<link href="design/css/essentials.css" rel="stylesheet" type="text/css" />
<link href="design/css/layout.css" rel="stylesheet" type="text/css" />
<link href="design/css/layout-responsive.css" rel="stylesheet"
	type="text/css" />
<link href="design/css/color_scheme/orange.css" rel="stylesheet"
	type="text/css" />
<!-- orange: default style -->
<!--<link id="css_dark_skin" href="design/css/layout-dark.css" rel="stylesheet" type="text/css" />-->
<!-- DARK SKIN -->

<!-- styleswitcher - demo only -->
<!-- <link href="design/css/color_scheme/orange.css"
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
	rel="alternate stylesheet" type="text/css" title="lightgrey" /> -->
<!-- /styleswitcher - demo only -->

<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->
<!-- <link href="design/plugins/styleswitcher/styleswitcher.css"
	rel="stylesheet" type="text/css" /> -->

<!-- Morenizr -->
<!-- <script type="text/javascript" src="design/plugins/modernizr.min.js"></script> -->
<script src="/RestaurantSearch/lib/jquery-1.11.0.min.js"></script>
<script>



function memberReg(id){  //서버에 요청하는 문서이름을 매개변수 2)
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;	
		
   if(id==""){
	   //document.getElementById("ducheck")=>$("ducheck")
	   $("#memberIdTxt").innerHTML="<font color='red'>"+ "먼저 이메일를 입력하세요</font>";
	   $("#memberId").focus();//커서입력
	   return;
	   
   }else if(!regEmail.test(id)) {
    	  $("#memberIdTxt").innerHTML="<font color='red'>"+  "이메일 주소가 유효하지 않습니다.</font>";
	      $("#memberId").focus();
	      //history.back();
	      return;
	}
      
	$.ajax({
    		url:'/RestaurantSearch/dupliMemberCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
    		data:{id:id},
    		type : "POST",
    		//3.success:콜백함수명(매개변수)
    		success:function(args){
    			if(args=="create"){
    				alert("가능")
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 가능한 이메일입니다.</font>")
     			}else{
    				alert("불가능")
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 불가능한 이메일입니다.</font>")
    				$("#memberId").focus();
    			}
    		}
    	})//$.ajax
    	
}

$(function(){
	
	 //2.중복  id를 입력했을때 호출하는 함수   
	var validationCheck = {emailVali:false, passwdVali:false};
	  
	
 	
	$("#createId").click(function(){
		
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		alert("클릭되었음");
		if (!($("#memberId").val())) {
		      alert("이메일을 입력해 주세요. 필수 입력사항입니다.")
		      $("#memberId").focus();
		   //   history.back();
		      return;
		}else if(!regEmail.test($("#memberId").val())) {
			  //$("#memberIdTxt").html("<font id='idColor' color='red'>이메일주소가 유효하지 않습니다.</font>")
			  alert("이메일주소가 유효하지 않습니다.")
		      $("#memberId").focus();
		      //history.back();
		      return;
		}		
		
		
		if (!($("#password").val())) {
		      alert("패스워드를 입력하여 주세요. 필수 입력사항입니다.")
		      $("#password").focus();
		   //   history.back();
		      return;
			} 
		
		if (!($("#rePassword").val())) {
		      alert("중복패스워드를 입력하여 주세요. 필수 입력사항입니다.")
		      $("#rePassword").focus();
		   //   history.back();
		      return;
		} 
		
		if (!($("#birthDate").val())) {
		      alert("생년월일을 입력해 주세요. 필수 입력사항입니다.")
		      $("#birthDate").focus();
		   //   history.back();
		      return;
		} 
		
		if (!($("#phoneNum").val())) {
		      alert("전화번호를 입력해 주세요. 필수 입력사항입니다.")
		      $("#phoneNum").focus();
		   //   history.back();
		      return;
			}
		
		if ($("#password").val() != $("#rePassword").val()) {
			alert("패스워드가 일치하지 않습니다.정확하게 입력하여 주세요.");
			$("#password").focus();
			return;
		}
		
		$.ajax({
    		url:'/RestaurantSearch/dupliMemberCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
    		data:{id:$("#memberId").val()},
    		type : "POST",
    		//3.success:콜백함수명(매개변수)
    		success:function(args){
    			if(args=="create"){
    				alert("가능")
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 가능한 이메일입니다.</font>")
    		    	document.registerMem.submit();
     			}else{
    				alert("불가능")
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 불가능한 이메일입니다.</font>")
    				$("#memberId").focus();
    				return;
    			}
    		}
    	})
	})
	
	
	
	$("#memberId").blur(function(){
		//이메일 유효성 검사
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		 if (!($("#memberId").val())) {
			$("#memberIdTxt").html("<font id='idColor' color='red'>이메일을 입력해주세요.</font>")
		}else if(!regEmail.test($("#memberId").val())) {
			$("#memberIdTxt").html("<font id='idColor' color='red'>이메일주소가 유효하지 않습니다.</font>")
        }
	}) // phone(blur)
	
	$("#password").blur(function() {
			var password = $("#password").val();
			var passwordCheck = {number:false, special:false, upper:false, lower:false};
			
			for (i=0; i<password.length; i++) {
				if (password.charAt(i)>=0 && password.charAt(i)<=9) {
// 					alert("숫자");
					passwordCheck["number"]=true;
				}
				if ((password.charAt(i)>="!" && password.charAt(i)<="/") ||
						(password.charAt(i)>=":" && password.charAt(i)<="@") ||
						(password.charAt(i)>="[" && password.charAt(i)<="`") ||
						(password.charAt(i)>="{" && password.charAt(i)<="}")) {
// 					alert("특수문자")
					passwordCheck["special"]=true;
				}
				//if (password.charAt(i)>="A" && password.charAt(i)<="Z") {
// 					alert("대문자")
				//	passwordCheck["upper"]=true;
				//}
				if (password.charAt(i)>="a" && password.charAt(i)<="z") {
// 					alert("소문자")
					passwordCheck["lower"]=true;
				}
			} // for
			if (passwordCheck["number"] && 
					passwordCheck["special"] && 
					//passwordCheck["upper"] && 
					passwordCheck["lower"] &&
					password.length >= 6) {
				$("#passwordCheckMessage").html("");
			} else {
				$("#passwordCheckMessage").html("<font id='idColor' color='red'>6자리 이상의 특수기호, 숫자, 문자가 포함되어야 합니다.</font>");
				passwordCheck = {number:false, special:false, upper:false, lower:false};
			}
		}) // password(blur)
		
		$("#rePassword").blur(function(){
			if ($("#password").val() != $("#rePassword").val()) {
				$("#passwordReCheckMessage").html("<font id='idColor' color='red'>패스워드가 일치하지 않습니다</font>");
				return;
			}
		})
		
		$("#birthDate").blur(function(){
			//alert("asdf");
			var birthDateVal = $("#birthDate").val();
			//alert($("#birthDate").val().substring(0,4)+"월"+$("#birthDate").val().substring(4,6)+"일"+$('#birthDate').val().substring(6,8));
			var birthDateCheck = {number:false }
			
			var birthLength=parseInt(birthDateVal.length);
			//alert("생일길이=>"+birthLength);
			
			var year=parseInt($("#birthDate").val().substring(0,4))
			var month=parseInt($("#birthDate").val().substring(4,6))
			var day=parseInt($("#birthDate").val().substring(6,8))
			
			//alert("birthLength"+birthLength+"birthLength="+birthLength+"year"+year+"month"+month+"day"+day);
			alert("birthDateCheck[number]=>"+birthDateCheck["number"] )
			
			 if (!($("#birthDate").val())) {
				// alert("1")
					$("#birthCheckMessage").html("<font id='idColor' color='red'>생년월일을 입력해주세요.</font>")
			 }else if( birthLength!=8 || year<1920 || year>2017 || month>12 || day > 31){
				 //alert("2")
					$("#birthCheckMessage").html("<font id='idColor' color='red'>생년월일이 정확하지 않습니다.</font>")
			 }else{
				 //alert("3")
					$("#birthCheckMessage").html("")
			 }
			
			for (i=0; i< birthDateVal.length; i++) {
				//alert("birthDateVal.charAt(i)==> "+birthDateVal.charAt(i))
				if (!(birthDateVal.charAt(i)>=0 && birthDateVal.charAt(i)<=9)) {
					//alert("생년월일에 문자가 들어감")
					$("#birthCheckMessage").html("<font id='idColor' color='red'>생년월일이 정확하지 않습니다.</font>")
				}
			}
			 
		}) // passwordCheck(blur)
		
		$("#phoneNum").blur(function(){
			var phoneNumVal=$("#phoneNum").val();
			
			if (!(phoneNumVal)) {
					$("#phoneNumCheckMessage").html("<font id='idColor' color='red'>전화번호를 입력해주세요.</font>")
			}else {
					$("#phoneNumCheckMessage").html("");
			} 
			
			
			for (i=0; i< phoneNumVal.length; i++) {
				//alert("birthDateVal.charAt(i)==> "+birthDateVal.charAt(i))
				if (!(phoneNumVal.charAt(i)>=0 && phoneNumVal.charAt(i)<=9)) {
					alert("전화번호에 문자가 들어감")
					$("#phoneNumCheckMessage").html("<font id='idColor' color='red'>전화번호가 정확 하지 않습니다.</font>")
				}
			}
		})
		
})
		
					
</script>
</head>
<body>
	<!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="design/images/boxed_background/1.jpg"  -->

	<!-- Top Bar -->
	<!-- <header id="topHead">
	<div class="container">

		PHONE/EMAIL
		<span class="quick-contact pull-left"> <i class="fa fa-phone"></i>
			1800-555-1234 &bull; <a class="hidden-xs"
			href="mailto:mail@yourdomain.com">mail@domain.com</a>
		</span>
		/PHONE/EMAIL

		LANGUAGE
		<div class="btn-group pull-right hidden-xs">
			<button class="dropdown-toggle language" type="button"
				data-toggle="dropdown">
				<img src="design/images/flags/us.png" width="16" height="11"
					alt="EN Language" /> English <span class="caret"></span>
			</button>

			<ul class="dropdown-menu">
				<li><a href="#"> <img src="design/images/flags/us.png"
						width="16" height="11" alt="EN Language" /> [US] English
				</a></li>
				<li><a href="#"> <img src="design/images/flags/de.png"
						width="16" height="11" alt="DE Language" /> [DE] German
				</a></li>
				<li><a href="#"> <img src="design/images/flags/fr.png"
						width="16" height="11" alt="FR Language" /> [FR] French
				</a></li>
				<li><a href="#"> <img src="design/images/flags/ru.png"
						width="16" height="11" alt="RU Language" /> [RU] Russian
				</a></li>
			</ul>
		</div>
		/LANGUAGE


		SIGN IN
		<div class="pull-right nav signin-dd">
			<a id="quick_sign_in" href="page-signin.html" data-toggle="dropdown"><i
				class="fa fa-users"></i><span class="hidden-xs"> Sign In</span></a>
			<div class="dropdown-menu" role="menu"
				aria-labelledby="quick_sign_in">

				<h4>Sign In</h4>
				<form action="page-signin.html" method="post" role="form">

					<div class="form-group">
						email
						<input required type="email" class="form-control"
							placeholder="Username or email">
					</div>

					<div class="input-group">

						password
						<input required type="password" class="form-control"
							placeholder="Password">

						submit button
						<span class="input-group-btn">
							<button class="btn btn-primary">Sign In</button>
						</span>

					</div>

					<div class="checkbox">
						remmember
						<label> <input type="checkbox"> Remember me &bull;
							<a href="page-signin.html">Forgot password?</a>
						</label>
					</div>

				</form>

				<hr />

				<a href="#" class="btn-facebook fullwidth radius3"><i
					class="fa fa-facebook"></i> Connect With Facebook</a> <a href="#"
					class="btn-twitter fullwidth radius3"><i class="fa fa-twitter"></i>
					Connect With Twitter</a>
				<a href="#" class="btn-google-plus fullwidth radius3"><i class="fa fa-google-plus"></i> Connect With Google</a>

				<p class="bottom-create-account">
					<a href="page-signup.html">Manual create account</a>
				</p>
			</div>
		</div>
		/SIGN IN

		CART MOBILE BUTTON
		<a class="pull-right" id="btn-mobile-quick-cart" href="shop-cart.html"><i
			class="fa fa-shopping-cart"></i></a>
		CART MOBILE BUTTON

		LINKS
		<div class="pull-right nav hidden-xs">
			<a href="page-about-us.html"><i class="fa fa-angle-right"></i>
				About</a> <a href="contact-us.html"><i class="fa fa-angle-right"></i>
				Contact</a>
		</div>
		/LINKS
	</div>
	</header> -->
	<!-- /Top Bar -->

	<!-- TOP NAV -->
	<!-- <header id="topNav" class="topHead">remove class="topHead" if no topHead used!
	<div class="container">

		Mobile Menu Button
		<button class="btn btn-mobile" data-toggle="collapse"
			data-target=".nav-main-collapse">
			<i class="fa fa-bars"></i>
		</button>

		Logo text or image
		<a class="logo" href="index.html"> <img
			src="design/images/logo.png" alt="Atropos" />
		</a>

		Top Nav
		<div class="navbar-collapse nav-main-collapse collapse pull-right">
			<nav class="nav-main mega-menu">
			<ul class="nav nav-pills nav-main scroll-menu" id="topMain">
				<li class="dropdown"><a class="dropdown-toggle" href="#">
						Home <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li class="dropdown-submenu"><a href="#">Revolution
								Slider</a>
							<ul class="dropdown-menu">
								<li><a href="revolution-half-slider.html">Half Slider</a></li>
								<li><a href="revolution-full-slider.html">Full Slider</a></li>
								<li><a href="revolution-video.html">Full Video</a></li>
								<li><a href="revolution-ken-burns.html">Ken Burns</a></li>
								<li><a href="revolution-official-1.html">More Examples</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">Superslides
								Slider</a>
							<ul class="dropdown-menu">
								<li><a href="superslides-slider-half.html">Half Slider</a></li>
								<li><a href="superslides-slider-full.html">Full Slider</a></li>
								<li><a href="superslides-video.html">Half Video</a></li>
								<li><a href="superslides-video-full.html">Full Video</a></li>
							</ul></li>
						<li class="divider"></li>
						<li><a href="index-extended.html">Extended</a></li>
						<li><a href="portfolio-home.html">Portfolio</a></li>
						<li><a href="shop-home.html">Shop</a></li>
						<li><a href="realestate-home.html">Real Estate</a></li>
						<li><a href="church-home.html">Church</a></li>
						<li><a href="medical-home.html">Medical</a></li>
						<li><a href="college-home.html">College</a></li>
						<li><a href="onepage-superslides.html" target="_blank">Onepage
								- Superslides</a></li>
						<li><a href="onepage-revolution.html" target="_blank">Onepage
								- Revolution</a></li>
						<li><a href="index-more.html">More...</a></li>
					</ul></li>
				<li class="dropdown mega-menu-item mega-menu-two-columns active">
					<a class="dropdown-toggle" href="#"> Pages <i
						class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li>
							<div class="mega-menu-content">
								<div class="row">

									<div class="col-md-6">
										<ul class="sub-menu">
											<li>
												<ul class="sub-menu">

													<li><a href="shortcodes-rows.html"><i
															class="fa fa-star-o"></i> Shortcodes</a></li>
													<li><a href="page-about-us.html"><i
															class="fa fa-check-square-o"></i> About Us</a></li>
													<li><a href="page-about-me.html"><i
															class="fa fa-check-square-o"></i> About Me</a></li>
													<li><a href="page-team.html"><i
															class="fa fa-check-square-o"></i> Team</a></li>
													<li><a href="page-services.html"><i
															class="fa fa-check-square-o"></i> Services</a></li>
													<li><a href="page-faq.html"><i
															class="fa fa-check-square-o"></i> FAQ</a></li>
													<li><a href="page-support.html"><i
															class="fa fa-check-square-o"></i> Support</a></li>
													<li><a href="page-privacy-policy.html"><i
															class="fa fa-check-square-o"></i> Privacy Policy</a></li>
													<li><a href="page-terms-and-conditions.html"><i
															class="fa fa-check-square-o"></i> Terms Page</a></li>
													<li><a href="page-invoice.html"><i
															class="fa fa-check-square-o"></i> Invoice</a></li>
													<li class="dropdown-submenu"><a href="#"><i
															class="fa fa-check-square-o"></i> Contact</a>
														<ul class="dropdown-menu">
															<li><a href="contact-us.html">Version 1</a></li>
															<li><a href="contact-us-2.html">Version 2</a></li>
															<li><a href="contact-us-3.html">Version 3</a></li>
															<li><a href="contact-us-4.html">Version 4</a></li>
														</ul></li>
													<li><a href="page-sitemap.html"><i
															class="fa fa-sitemap"></i> Sitemap</a></li>
												</ul>
											</li>
										</ul>
									</div>

									<div class="col-md-6">
										<ul class="sub-menu">
											<li>
												<ul class="sub-menu">
													<li><a href="page-testimonials.html"><i
															class="fa fa-check-square-o"></i> Testimonials</a></li>
													<li><a href="page-pricing.html"><i
															class="fa fa-check-square-o"></i> Pricing</a></li>
													<li><a href="page-signin.html"><i
															class="fa fa-check-square-o"></i> Login</a></li>
													<li><a href="page-signup.html"><i
															class="fa fa-check-square-o"></i> Register</a></li>
													<li><a href="page-404.html"><i
															class="fa fa-check-square"></i> 404 Error</a></li>
													<li><a href="page-maintenance.html"><i
															class="fa fa-check-square"></i> Maintenance</a></li>
													<li class="dropdown-submenu"><a href="#"><i
															class="fa fa-check-square"></i> Coming Soon</a>
														<ul class="dropdown-menu">
															<li><a href="page-coming-soon-image.html">Coming
																	Soon - Image</a></li>
															<li><a href="page-coming-soon-video.html">Coming
																	Soon - Video</a></li>
														</ul></li>
													<li class="dropdown-submenu"><a href="#"><i
															class="fa fa-check-square"></i> Custom Header</a>
														<ul class="dropdown-menu">
															<li><a href="page-header-basic.html">Basic</a></li>
															<li><a href="page-header-image.html">Image</a></li>
															<li><a href="page-header-overlay1.html">Overlay
																	1</a></li>
															<li><a href="page-header-overlay2.html">Overlay
																	2</a></li>
															<li><a href="page-header-overlay3.html">Overlay
																	3</a></li>
															<li><a href="page-header-delayed-parallax.html">Delayed
																	Parallax</a></li>
															<li><a href="page-header-standard-parallax.html">Standard
																	Parallax</a></li>
														</ul></li>
													<li><a href="page-full-width.html"><i
															class="fa fa-check-square-o"></i> Full width</a></li>
													<li><a href="page-left-sidebar.html"><i
															class="fa fa-check-square-o"></i> Left Sidebar</a></li>
													<li><a href="page-right-sidebar.html"><i
															class="fa fa-check-square-o"></i> Right Sidebar</a></li>
													<li><a href="email-template.html"><i
															class="fa fa-envelope"></i>Email Template</a></li>
												</ul>
											</li>
										</ul>
									</div>

								</div>
							</div>
						</li>
					</ul>
				</li>
				<li class="dropdown mega-menu-item mega-menu-fullwidth"><a
					class="dropdown-toggle" href="#"> Features <i
						class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li>
							<div class="mega-menu-content">
								<div class="row">
									<div class="col-md-3">
										<ul class="sub-menu">
											<li><span class="mega-menu-sub-title">General
													Features</span>
												<ul class="sub-menu">
													<li><a href="feature-grid-system.html">Grid System</a></li>
													<li><a href="feature-icons.html">Icons</a></li>
													<li><a href="feature-pricing-tables.html"><em>Pricing
																Tables</em></a></li>
													<li><a href="feature-testimonials.html"><em>Testimonials</em></a></li>
													<li><a href="email-template.html"><em>Email
																Template</em></a></li>
													<li><a href="shortcodes-rows.html"><em>Shortcodes</em></a></li>
													<li><a href="feature-animations.html">Animations</a></li>
													<li><a href="feature-typograpy.html">Typograpy</a></li>
												</ul></li>
										</ul>
									</div>
									<div class="col-md-3">
										<ul class="sub-menu">
											<li><span class="mega-menu-sub-title">Sliders</span>
												<ul class="sub-menu">
													<li><a href="feature-content-carousel.html">Content
															Carousel</a></li>
													<li><a href="revolution-official-1.html">(17)
															Premium Revolution Slider</a></li>
												</ul></li>
										</ul>
									</div>
									<div class="col-md-3">
										<ul class="sub-menu">
											<li><span class="mega-menu-sub-title">Headers</span>
												<ul class="sub-menu">
													<li><a href="header-1.html">Header Version 1</a></li>
													<li><a href="header-2.html">Header Version 2</a></li>
													<li><a href="header-3.html">Header Version 3</a></li>
													<li><a href="header-4.html">Header Version 4</a></li>
												</ul></li>
										</ul>
									</div>
									<div class="col-md-3">
										<ul class="sub-menu">
											<li><span class="mega-menu-sub-title">Unique
													Bonuses</span>
												<ul class="sub-menu">
													<li><a href="onepage-superslides.html" target="_blank">Onepage
															- Superslides</a></li>
													<li><a href="onepage-revolution.html" target="_blank">Onepage
															- Revolution</a></li>
													<li><a href="email-template.html">Email Template</a></li>
												</ul></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" href="#"> <b>Special</b>
						<i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="magazine-home.html">Magazine - Home</a></li>
						<li><a href="magazine-category.html">Magazine - Category</a></li>
						<li><a href="magazine-single.html">Magazine - Single</a></li>
						<li class="divider"></li>
						<li><a href="realestate-home.html">Real Estate - Home</a></li>
						<li><a href="realestate-list.html">Real Estate - List</a></li>
						<li><a href="realestate-single.html">Real Estate - Single</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" href="#">
						Shop <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="shop-home.html">Shop - Home</a></li>
						<li class="divider"></li>
						<li><a href="shop-full-width.html">Shop Full Width</a></li>
						<li><a href="shop-product-full-width.html">Shop Product
								Full Width</a></li>
						<li class="divider"></li>
						<li><a href="shop-sidebar.html">Shop Sidebar</a></li>
						<li><a href="shop-product-sidebar.html">Shop Product
								Sidebar</a></li>
						<li class="divider"></li>
						<li><a href="shop-cart.html">Shop Cart</a></li>
						<li><a href="shop-cc-pay.html">Shop Credit Card</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" href="#">
						Blog <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="blog-full-width.html">Blog Without Sidebar</a></li>
						<li><a href="blog-left-sidebar.html">Blog With Sidebar
								Left</a></li>
						<li><a href="blog-right-sidebar.html">Blog With Sidebar
								Right</a></li>
						<li><a href="blog-timeline.html">Blog Timeline</a></li>
						<li><a href="blog-masonry.html">Blog Masonry</a></li>
						<li><a href="blog-masonry-full-width.html">Blog Masonry -
								Full Width</a></li>
						<li><a href="blog-masonry-sidebar.html">Blog Masonry -
								Sidebar</a></li>
						<li class="divider"></li>
						<li><a href="blog-post.html">Single Post</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle" href="#">
						Portfolio <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="portfolio-2-columns.html">2 Columns</a></li>
						<li><a href="portfolio-3-columns.html">3 Columns</a></li>
						<li><a href="portfolio-4-columns.html">4 Columns</a></li>
						<li><a href="portfolio-lightbox.html">Portfolio - Gallery</a></li>
						<li><a href="portfolio-full-width.html">Portfolio Full
								Width</a></li>
						<li><a href="portfolio-full-center.html">Portfolio Full
								Center</a></li>
						<li class="divider"></li>
						<li><a href="portfolio-single.html">Single - Basic</a></li>
						<li><a href="portfolio-single-extended.html">Single -
								Extended</a></li>
						<li><a href="portfolio-single-full-slider.html">Single -
								Full Slider</a></li>
					</ul></li>

				GLOBAL SEARCH
				<li class="search">
					search form
					<form method="get" action="#" class="input-group pull-right">
						<input type="text" class="form-control" name="k" id="k" value=""
							placeholder="Search"> <span class="input-group-btn">
							<button class="btn btn-primary notransition">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</form> /search form
				</li>
				/GLOBAL SEARCH

				QUICK SHOP CART
				<li class="quick-cart"><span class="badge pull-right">3</span>

					<div class="quick-cart-content">

						<p>
							<i class="fa fa-warning"></i> You have 3 products on your cart
						</p>

						<a class="item" href="shop-product-full-width.html">
							item 1 <img class="pull-left"
							src="design/images/demo/shop/thumb/1.jpg" width="40"
							alt="quick cart" />
							<div class="inline-block">
								<span class="title">Man shirt XL</span> <span class="price">2
									&times; $44.00</span>
							</div>
						</a>
						/item 1

						<a class="item" href="shop-product-full-width.html">
							item 2 <img class="pull-left"
							src="design/images/demo/shop/thumb/2.jpg" width="40"
							alt="quick cart" />
							<div class="inline-block">
								<span class="title">Great Black Shoes For Man and Only
									Man...</span> <span class="price">2 &times; $44.00</span>
							</div>
						</a>
						/item 2

						<a class="item" href="shop-product-full-width.html">
							item 3 <img class="pull-left"
							src="design/images/demo/shop/thumb/4.jpg" width="40"
							alt="quick cart" />
							<div class="inline-block">
								<span class="title">Pink Lady Perfect Shoes</span> <span
									class="price">1 &times; $67.32</span>
							</div>
						</a>
						/item 3

						QUICK CART BUTTONS
						<div class="row cart-footer">
							<div class="col-md-6 nopadding-right">
								<a href="shop-cart.html"
									class="btn btn-primary btn-xs fullwidth">VIEW CART</a>
							</div>
							<div class="col-md-6 nopadding-left">
								<a href="shop-cc-pay.html" class="btn btn-info btn-xs fullwidth">CHECKOUT</a>
							</div>
						</div>
						/QUICK CART BUTTONS

					</div></li>
				/QUICK SHOP CART

			</ul>
			</nav>
		</div>
		/Top Nav

	</div>
	</header> -->

	<span id="header_shadow"></span>
	<!-- /TOP NAV -->



	<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->
	<!-- <div id="switcher">
			<div class="content-switcher" >        
				<h4>STYLE OPTIONS</h4>

				<p>10 Predefined Color Schemes</p>
				<ul>            
					<li><a href="#" onclick="setActiveStyleSheet('orange'); return false;" title="orange" class="color"><img src="design/images/demo/color_schemes/1.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('red'); return false;" title="red" class="color"><img src="design/images/demo/color_schemes/2.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('pink'); return false;" title="pink" class="color"><img src="design/images/demo/color_schemes/3.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('yellow'); return false;" title="yellow" class="color"><img src="design/images/demo/color_schemes/4.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('darkgreen'); return false;" title="darkgreen" class="color"><img src="design/images/demo/color_schemes/5.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('green'); return false;" title="green" class="color"><img src="design/images/demo/color_schemes/6.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('darkblue'); return false;" title="darkblue" class="color"><img src="design/images/demo/color_schemes/7.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('blue'); return false;" title="blue" class="color"><img src="design/images/demo/color_schemes/8.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('brown'); return false;" title="brown" class="color"><img src="design/images/demo/color_schemes/9.png" alt="" width="30" height="30" /></a></li>
					<li><a href="#" onclick="setActiveStyleSheet('lightgrey'); return false;" title="lightgrey" class="color"><img src="design/images/demo/color_schemes/10.png" alt="" width="30" height="30" /></a></li>
				</ul>        

				<p>CHOOSE YOUR COLOR SKIN</p>
				<label><input class="dark_switch" type="radio" name="color_skin" id="is_light" value="light" checked="checked" /> Light</label>
				<label><input class="dark_switch" type="radio" name="color_skin" id="is_dark" value="dark" /> Dark</label>

				<hr />

				<p>CHOOSE YOUR LAYOUT STYLE</p>
				<label><input class="boxed_switch" type="radio" name="layout_style" id="is_wide" value="wide" checked="checked" /> Wide</label>
				<label><input class="boxed_switch" type="radio" name="layout_style" id="is_boxed" value="boxed" /> Boxed</label>


				<p>Patterns for Boxed Version</p>
				<div>
					<button onclick="pattern_switch('none');" class="pointer switcher_thumb"><img src="design/images/patterns/none.jpg" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern2');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern2.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern3');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern3.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern4');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern4.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern5');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern5.png" width="27" height="27" alt="" /></button>
				</div>

				<div>
					<button onclick="pattern_switch('pattern6');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern6.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern7');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern7.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern8');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern8.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern9');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern9.png" width="27" height="27" alt="" /></button>
					<button onclick="pattern_switch('pattern10');" class="pointer switcher_thumb"><img src="design/images/patterns/pattern10.png" width="27" height="27" alt="" /></button>
				</div>

				<p>Images for Boxed Version</p>
				<button onclick="background_switch('none');" class="pointer switcher_thumb"><img src="design/images/boxed_background/none.jpg" width="27" height="27" alt="" /></button>
				<button onclick="background_switch('design/images/boxed_background/1.jpg');" class="pointer switcher_thumb"><img src="design/images/boxed_background/1_thumb.jpg" width="27" height="27" alt="" /></button>
				<button onclick="background_switch('design/images/boxed_background/2.jpg');" class="pointer switcher_thumb"><img src="design/images/boxed_background/2_thumb.jpg" width="27" height="27" alt="" /></button>
				<button onclick="background_switch('design/images/boxed_background/3.jpg');" class="pointer switcher_thumb"><img src="design/images/boxed_background/3_thumb.jpg" width="27" height="27" alt="" /></button>
				<button onclick="background_switch('design/images/boxed_background/4.jpg');" class="pointer switcher_thumb"><img src="design/images/boxed_background/4_thumb.jpg" width="27" height="27" alt="" /></button>

				<hr />

				<div class="text-center">
					<button onclick="resetSwitcher();" class="btn btn-primary btn-xs">Reset Styles</button>
				</div>

				<div id="hideSwitcher">&times;</div>
			</div>
		</div>

		<div id="showSwitcher" class="styleSecondColor"><i class="fa fa-angle-double-right"></i></div>  -->
	<!-- /STYLESWITCHER -->



	<!-- WRAPPER -->
	<div id="wrapper">

		<div id="shop">

			<!-- PAGE TITLE -->
			<!-- <header id="page-title">
			<div class="container">
				<h1>Sign UP</h1>

				<ul class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Sign UP</li>
				</ul>
			</div>
			</header> -->


			<section class="container">

			<div class="row">

				<!-- REGISTER -->
				<div class="col-md-9">

					<h2>
					 	계정 <strong>생성</strong>
					</h2>

					<form name="registerMem" class="white-row" method="post" action="memberRegister.do">

						<!-- alert failed -->
						<!-- <div class="alert alert-danger">
							<i class="fa fa-frown-o"></i> <strong>Password</strong> do not
							match!
						</div> -->

						<div class="row">
							<div class="form-group">
								<div class="col-md-6">
									이메일<br>
									<input type="text" id="memberId" name="memberId"
										class="form-control" placeholder="이메일을 입력하세요.[필수]">
										<table><tr><td id="memberIdTxt" ></td></tr></table>
								</div>
								<div class="col-md-6">
									<br>
									<input type="button" id="repeatCheck" value="중복확인" class="btn btn-primary" onclick="memberReg(this.form.memberId.value)">
									<!-- <button id="repeatCheck" class="btn btn-primary">중복확인</button> -->
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-md-6">
									<label>패스워드</label> <input type="password" id="password" name="password"
										class="form-control" placeholder="6자리 이상의 숫자,문자,특수기호를 포함하세요.[필수]">
										<table><tr><td id="passwordCheckMessage" ></td></tr></table>
								</div>
								<div class="col-md-6">
									<label>패스워드 확인</label> <input type="password" id="rePassword" name="rePassword"
										class="form-control" placeholder="확인 패스워드를 입력하세요.[필수]">
										<table><tr><td id="passwordReCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label>생년월일</label> <input type="text" id="birthDate" name="birthDate"
										 class="form-control" placeholder="생년월일 숫자8자리를 입력하세요. ex) 20010101 [필수]">
									<table><tr><td id="birthCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<div class="col-md-8">
									<label>전화번호</label> <input type="text" id="phoneNum" name="phoneNum"
										 class="form-control" placeholder="- 없이 전화번호를 입력하여 주세요.[필수]">
									<tr><td id="phoneCheckMessage" class="check" colspan="3"></td></tr>
										<table><tr><td id="phoneNumCheckMessage" ></td></tr></table>
								</div>
								<div class="col-md-4">
									<label>성별</label> <%-- <input type="text" name="gender"
										value="${memDetInfoDto.gender}" class="form-control"> --%>
									<select class="form-control" id="gender" name="gender">
										<option>선택</option>
										<option>남자</option>
										<option>여자</option>
									</select>
								</div>
							</div>
						</div>
												
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label>대표이미지</label> <input type="text" name="photoPath" 
																		 class="form-control"  placeholder="대표이미지를 첨부하여 주세요.[선택]">
								</div>
							</div>
						</div>
						
						<!-- <div class="form-group">
							<label for="InputSubject1">대표이미지</label>
							<input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" 
							data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" 
							style="position: absolute; clip: rect(0px 0px 0px 0px);">
							<div class="bootstrap-filestyle input-group">
								<input type="text" id="userfile" class="form-control" name="userfile" disabled="">
								<span class="group-span-filestyle input-group-btn" tabindex="0">
								<label for="fileInput" class="btn btn-default ">
								<span class="glyphicon fa fa-upload"></span>
								</label>
							</span>
							</div>
						</div> -->
						
						<%-- <div class="row">
									<div class="form-group">
										<div class="col-md-12">
											<label>회원종류</label>
											<input type="text" name="memberType" value="${memDetInfoDto.memberType}" class="form-control">
										</div>
									</div>
								</div> --%>

						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label>관심음식</label> <input type="text" name="interestFood"
										 class="form-control" placeholder="좋아하거나 관심있는 음식을 입력하여 주세요.[선택]">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label>닉네임</label> <input type="text" name="nickname"
										 class="form-control" placeholder="닉네임을 입력하여 주세요.[선택]">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<label>자기소개</label> <%-- <input type="textArea" name="selfIntro"
										value="${memDetInfoDto.selfIntro}" class="form-control"> --%>
										<textarea id="selfIntro" name="selfIntro" rows="5" class="form-control" placeholder="자기소개를 입력하여 주세요.[선택]"></textarea>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								<div class="col-md-12">
									<!-- <label>이메일 수신여부</label> -->
										<div class="checkbox">
  											<label><input type="checkbox" name="emailCheck" value="수신" class="form-control">이메일 수신여부</label>
										</div>
									<%-- <input type="text" name="emailCheck"  value="${memDetInfoDto.emailCheck}" class="form-control"> --%>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<input type="button" id="createId" value="계정만들기" class="btn btn-primary pull-right push-bottom"
									data-loading-text="Loading...">
							</div>
						</div>
					</form>
				</div>
				<!-- /REGISTER -->

				<!-- WHY? -->
				<div class="col-md-3">

					<h2>Why to register?</h2>

					<div class="white-row">

						<h4>Registration is fast, easy, and free.</h4>

						<p>Once you're registered, you can:</p>
						<ul class="list-icon check">
							<li>Buy, sell, and interact with other members.</li>
							<li>Save your favorite searches and get notified.</li>
							<li>Watch the status of up to 200 items.</li>
							<li>View your Atropos information from any computer in the
								world.</li>
							<li>Connect with the Atropos community.</li>
						</ul>

						<hr class="half-margins" />

						<p>
							Already have an account? <a href="page-signin.html">Click to
								Sign In</a>
						</p>
					</div>

					<div class="white-row">
						<h4>Contact Customer Support</h4>
						<p>
							If you're looking for more help or have a question to ask, please
							<a href="contact-us.html">contact us</a>.
						</p>
					</div>

				</div>
				<!-- /WHY? -->

			</div>

			</section>

		</div>
	</div>
	<!-- /WRAPPER -->



<!-- FOOTER -->
	<footer>

		<!-- copyright , scrollTo Top -->
		<div class="footer-bar">
			<div class="container">
				<span class="copyright">Copyright &copy; git 짜증나요..., LLC .
					All Rights Reserved.</span> <a class="toTop" href="#topNav">BACK TO
					TOP <i class="fa fa-arrow-circle-up"></i>
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
	<script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script>
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
	<!-- <script type="text/javascript"
		src="design/plugins/styleswitcher/styleswitcher.js"></script> -->
	<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->


	<script type="text/javascript" src="design/plugins/holder.js"></script>
	<!-- remove on production -->
	<script type="text/javascript" src="design/js/scripts.js"></script>


	<!-- Google Analytics: Change UA-XXXXX-X to be your site's ID. Go to http://www.google.com/analytics/ for more information. -->
	<!--<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

			ga('create', 'UA-XXXXX-X', 'domainname.com');
			ga('send', 'pageview');
		</script>
		-->

</body>
</html>