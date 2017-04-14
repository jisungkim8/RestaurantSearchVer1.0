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

$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden'); 
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name; } 
		else{ // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		}
	// 추출한 파일명 삽입 
			//$(this).siblings('.upload-name').val(filename); 
		if( $('.upload-name').val() != "" ){
			var ext = filename.split('.').pop().toLowerCase();
			      if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
				 alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
				 return;
			      }
			}
		$('.upload-name').val(filename); 
		});
}); 




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
	 
	 $("#nicNameRepCheck").click(function(){
		   alert("닉네임")
		   if($("#nicName").val()==""){
			   //document.getElementById("ducheck")=>$("ducheck")
			   $("#nicNameTxt").html("<font id='idColor' color='red'>먼저 닉네임을 입력하세요.</font>")
			   $("#nicName").focus();//커서입력
			   return;
		   }
		   
			$.ajax({
	    		url:'/RestaurantSearch/dupliNicnameCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
	    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
	    		data:{nicName:$("#nicName").val()},
	    		type : "POST",
	    		//3.success:콜백함수명(매개변수)
	    		success:function(args){
	    			if(args=="create"){
	    				alert("닉네임 가능")
	    				$("#nicNameTxt").html("<font id='idColor' color='red'>사용 가능한 닉네임입니다.</font>")
	     			}else{
	    				alert("닉네임 불가능")
	    				$("#nicNameTxt").html("<font id='idColor' color='red'>사용 불가능한 닉네임입니다.</font>")
	    				$("#memberId").focus();
	    			}
	    		}
	    	})//$.ajax
	 })
 	
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
		
		if (!($("#nicName").val())) {
		      alert("닉네임을 입력해 주세요. 필수 입력사항입니다.")
		      $("#nicName").focus();
		      //history.back();
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
		
		$("#nicName").blur(function(){
			 if (!($("#nicName").val())) {
					$("#nicNameTxt").html("<font id='idColor' color='red'>닉네임을 입력해주세요.</font>")
			 }
		})
		
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

<style>
   #main { height:600px;  background:url("design/images/demo/realestate/딸기.jpg") no-repeat;}
   .filebox input[type="file"]
    { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
     overflow: hidden; clip:rect(0,0,0,0); border: 0; }
     .filebox label { 
     display: inline-block; padding: 0.5em .75em; 
     color: blue; font-size: inherit;
     line-height: normal; vertical-align: -webkit-baseline-middle; background-color: chocolate;
     cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; 
     border-radius: .25em; } /* named upload */ 
     .filebox .upload-name {
      display: inline-block; padding: .5em 13.0em; /* label의 패딩값과 일치 */
      font-size: inherit; font-family: inherit; line-height: normal; vertical-align: middle;
      background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2;
       border-radius: .25em; -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }

</style>

</head>
<body>
	<!-- WRAPPER -->
	<!-- <div id="wrapper"> -->
					   <!-- <div class="row">
							<div class="form-group">
								<div class="col-md-12">
								  			<img class="img-responsive" src="design/images/demo/realestate/딸기.jpg" alt="Chania"> 
								</div>
							</div>
						</div> -->
		   <!--  <div  class="container">
  					<img class="img-responsive" src="design/images/demo/realestate/딸기.jpg" alt="Chania" width="1100" height="300"> 
		    </div>
 -->
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
			<!-- <div	style="background-image: url('design/images/demo/realestate/딸기.jpg');"
						class="fullscreen-img"></div> -->
			<!-- <img width="1100" height="300" src="design/images/demo/realestate/라면.jpg"> -->
		<!-- 	<div class="row"> -->
		     		 
		    	<!-- 	 <div class="col-md-4">
							<div class="container">
  									<img class="img-responsive" src="design/images/demo/realestate/라면.jpg" alt="Chania" width="460" height="345">
		    			 </div>
		     		</div>
		    		 <div class="col-md-4">
		    			 <div  class="container">
  				 				<img class="img-responsive" src="design/images/demo/realestate/빵.jpg" alt="Chania" width="460" height="345"> 
		     				</div>
		    		 </div> -->
		   <!--   </div> -->
	
			<section class="container">

			<div  class="row">

				<!-- REGISTER -->
				<div class="col-md-9">

					<h2>
					 	계정 <strong>생성</strong>
					</h2>

					<form name="registerMem" class="white-row" enctype="multipart/form-data" method="post" action="memberRegister.do">

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
								<div class="col-md-4">
									닉네임<br>
									<input type="text" id="nicName" name="nickname" class="form-control" placeholder="닉네임을 입력하여 주세요.[필수]">
									<table><tr><td id="nicNameTxt" ></td></tr></table>
								</div>
								<div class="col-md-2">
									<br>
									<input type="button" id="nicNameRepCheck" value="중복확인" class="btn btn-success">
									<!-- <button id="repeatCheck" class="btn btn-primary">중복확인</button> -->
								</div>
								<div class="col-md-6">
									전화번호<br> <input type="text" id="phoneNum" name="phoneNum"
										 class="form-control" placeholder="- 없이 전화번호를 입력하여 주세요.[필수]">
									<tr><td id="phoneCheckMessage" class="check" colspan="3"></td></tr>
										<table><tr><td id="phoneNumCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group">
								
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
									<label>대표이미지</label> <!-- <input type="text" name="photoPath" 
																		 class="form-control"  placeholder="대표이미지를 첨부하여 주세요.[선택]"> -->
										 <div class="filebox"> 
											<input class="upload-name" size="50" value="파일선택" disabled="disabled">
								 			<label for="ex_filename">업로드</label> 
								 			<input type="file" id="ex_filename" name="upload"  class="upload-hidden">
										</div>
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
								<input type="button" id="createId" value="계정만들기" class="btn btn-info pull-right push-bottom"
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
	<!-- </div> -->
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