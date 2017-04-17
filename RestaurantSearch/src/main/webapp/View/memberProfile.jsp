<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    				alert("가능");
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 가능한 이메일입니다.</font>")
     			}else{
    				alert("불가능")
    				$("#memberIdTxt").html("<font id='idColor' color='red'>사용 불가능한 이메일입니다.</font>")
    				$("#memberId").focus();
    			}
    		}
    	})//$.ajax
    	
}


function trueForm() 
{ 
	//$("#memberId").attr("disabled",false).attr("readonly",false); 
	
	if($('#profileMod').val()=='수정'){
		$("#birthDate").attr("disabled",false).attr("readonly",false); 
		$("#phoneNum").attr("disabled",false).attr("readonly",false); 
		$("#gender").attr("disabled",false).attr("readonly",false); 
		$("#photoPath").attr("disabled",false).attr("readonly",false); 
		$("#interestFood").attr("disabled",false).attr("readonly",false); 
		$("#nicName").attr("disabled",false).attr("readonly",false); 
		$("#selfIntro").attr("disabled",false).attr("readonly",false); 
		$("#emailCheck").attr("disabled",false).attr("onclick",false);
		$("#nicNameRepCheck").attr("disabled",false).attr("onclick",false);
		//$("#emailCheck").attr("disabled",false).attr("readonly",false); 
		$('#ex_filenameBtn').attr('disabled',false);  //업로드 버튼 활성화 
		$('#uploadBtn').show();
		$('#profileMod').val('수정완료')
	}else{
		$("#birthDate").attr("disabled",false).attr("readonly",true); 
		$("#phoneNum").attr("disabled",false).attr("readonly",true); 
		$("#gender").attr("disabled",false).attr("readonly",true); 
		$("#photoPath").attr("disabled",false).attr("readonly",true); 
		$("#interestFood").attr("disabled",false).attr("readonly",true); 
		$("#nicName").attr("disabled",false).attr("readonly",true);
		$("#selfIntro").attr("disabled",false).attr("readonly",true);
		$("#emailCheck").attr("disabled",true).attr("onclick",false);
		$("#nicNameRepCheck").attr("disabled",true).attr("onclick",false);
		//$("#emailCheck").attr("disabled",false).attr("readonly",false); 
		$('#ex_filenameBtn').attr('disabled',false).attr("readonly",true);  //업로드 버튼 활성화 
		$('#uploadBtn').hide();
		$('#profileMod').val('수정')
	}
} 

$(function(){
	
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
	
	 //2.중복  id를 입력했을때 호출하는 함수   
	$("#profileSave").click(function(){
		
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var params=$("#registerMem").serialize();

		if($('#profileMod').val()=='수정완료'){
			alert("수정완료 버튼을 클릭 하십시오.");
			return
		}
		
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
		
		/*  $.ajax({
    		url:'memberInfoUpdate.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
    		//2.data:{매개변수명:값,매개변수명2:값2,,,,}
    		dataType:'json',
    		data:  params, 
    		type : "POST",
    		async:false,
    		contentType : false,
    		//3.success:콜백함수명(매개변수)
    		success:function(args){
    		 	
    				if(args){
    					self.close();
    				}
    		}
    	})  */
    	
    	var formData = new FormData($("#registerMem")[0]);

        $.ajax({
            type : 'post',
            url : 'memberInfoUpdate.do',
            data : formData,
            processData : false,
            contentType : false,
            success : function(html) {
            	self.close();
            },

            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    	
    	//document.registerMem.submit();
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
			//alert("birthDateCheck[number]=>"+birthDateCheck["number"] )
			
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
		
		$("#emailCheck").click(function(){
			var emailChecked=$("input:checkbox[id='emailCheck']").is(":checked");
			var emailStr
			if(emailChecked){
				alert("수신")
				emailStr="수신"
				$("#emailCheck").val(emailStr);
			}else{
				alert("미수신")
				emailStr="미수신"
				$("#emailCheck").val(emailStr);
			}
			
			alert("check=>"+$("#emailCheck").val())		
		})
	
		
})
	
					
</script>
<style>
   #main { height:600px;  background:url("design/images/demo/realestate/딸기.jpg") no-repeat;}
   .filebox input[type="file"]
    { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
       overflow: hidden; clip:rect(0,0,0,0); border: 0; }
      .filebox label { 
      display: inline-block; padding: 0.7em .75em; 
      color: blue; font-size: inherit;
      line-height: normal; vertical-align: -webkit-baseline-middle; background-color: chocolate;
      cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; 
      border-radius: .25em; } /* named upload */ 
     .filebox .upload-name {
      display: inline-block; padding: 0.7em 9.8em; /* label의 패딩값과 일치 */
      font-size: inherit; font-family: inherit; line-height: normal; vertical-align: middle;
      background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2;
      border-radius: .25em; -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
	 #uploadBtn { display: none;}
</style>
</head>
<body>
	<!-- Available classes for body: boxed , pattern1...pattern10 . Background Image - example add: data-background="design/images/boxed_background/1.jpg"  -->

	<!-- Top Bar -->

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
	<!-- <div id="wrapper" style="background-color: #FF00DD"> -->

		<div id="shop" style="background-color: #6799FF">

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

			<div class="row" style="background-color: #6799FF">

				<!-- REGISTER -->
				<div class="col-md-9" style="background-color: #6799FF">

				<h2>
					<c:if test="${memDetInfo.photoPath!='images/null'}">
					<label>&nbsp;My Profile</label>
						<div class="row">
								<div class="col-md-6">
									  <img src="${memDetInfo.photoPath}" id="profileImg" class="img-rounded" alt="Cinque Terre" width="200" height="150"> 
								</div>
						</div>
					</c:if>

					<c:if test="${memDetInfo.photoPath=='images/null'}">
					 <label>&nbsp;My Profile</label>
					 	<div class="row">
								<div class="col-md-6">
  									<img src="images/porfilepic_default.jpg" id="profileImg" class="img-rounded" alt="Cinque Terre" width="200" height="150"> 
								</div>
						</div>
					</c:if>
				</h2>

				<form name="registerMem" id="registerMem" enctype="multipart/form-data" class="white-row" method="post" action="memberInfoUpdate.do">
						<!-- alert failed -->
						<!-- <div class="alert alert-danger">
							<i class="fa fa-frown-o"></i> <strong>Password</strong> do not
							match!
						</div> -->

						<div class="row"  style="background-color: #FFE400">
							<div class="form-group">
								<div class="col-md-6">
									이메일<br>
									<input type="text" id="memberId" name="memberId" value="${memDetInfo.memberId}"
										class="form-control"  placeholder="이메일을 입력하세요.[필수]"  readonly>
										<table><tr><td id="memberIdTxt" ></td></tr></table>
								</div>
								<!-- <div class="col-md-6">
									<br>
									<input type="button" id="repeatCheck" value="중복확인" class="btn btn-primary" onclick="memberReg(this.form.memberId.value)">
									<button id="repeatCheck" class="btn btn-primary">중복확인</button>
								</div> -->
							</div>
						</div>
						<!-- <div class="row">
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
						</div> -->
						
						<div class="row" style="background-color: #FFE400">
							<div class="form-group">
								<div class="col-md-12">
									<label>생년월일</label> <input type="text" id="birthDate" name="birthDate"  value="${memDetInfo.birthDate}"
										 class="form-control" placeholder="생년월일 숫자8자리를 입력하세요. ex) 20010101 [필수]" readonly>
									<table><tr style="background-color:#FFE400"><td id="birthCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						<div class="row" style="background-color: #FFE400">
							<div class="form-group">
								<div class="col-md-12">
									<label>전화번호</label> <input type="text" id="phoneNum" name="phoneNum"  value="${memDetInfo.phoneNum}"
										 class="form-control" placeholder="- 없이 전화번호를 입력하여 주세요.[필수]" readonly>
									<tr><td id="phoneCheckMessage" class="check" colspan="3"></td></tr>
										<table><tr style="background-color:#FFE400"><td id="phoneNumCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						
						<div class="row" style="background-color: #FFE400">
							<div class="form-group">
								<div class="col-md-12">
									<label>성별</label> <input type="text" id="gender" name="gender"
										value="${memDetInfo.gender}" class="form-control" readonly> 
									<!-- <select class="form-control" id="gender" name="gender" readonly>
										<option>선택</option>
										<option>남자</option>
										<option>여자</option>
									</select> -->
								</div>
							</div>
						</div>
												
						<div class="row" style="background-color: #FFE400">
							<div class="form-group">
								<div class="col-md-12">
										<label>이미지</label> 
								 		<div class="filebox">
								 		<c:if test="${memDetInfo.photoPath!='images/null'}">
											<input class="upload-name" size="50" value="${memDetInfo.photoPath}" disabled="disabled">
								 		</c:if>
								 		<c:if test="${memDetInfo.photoPath=='images/null'}">
								 		    <!-- <input type="text" id="photoPath" name="photoPath" value=""
									          class="form-control" placeholder="대표이미지를 첨부하여 주세요.[선택]" readonly> -->
									          <input class="upload-name" size="50" value="" placeholder="대표이미지를 첨부하여 주세요.[선택]" disabled="disabled">
								 		</c:if>
								 			<label id=uploadBtn for="ex_filenameBtn">업로드</label> 
								 			<input type="file" id="ex_filenameBtn" name="upload"  class="upload-hidden" disabled="disabled" >
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

					<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-2">
									<label>닉네임</label> <input type="text" size="10" id="nicName"  class="form-control" name="nickname" value="${memDetInfo.nickname}"
										  placeholder="닉네임을 입력하여 주세요.[선택]" readonly>
									<table><tr style="background-color:#86E57F"><td id="nicNameTxt" ></td></tr></table>
								</div>
								<div class="col-md-10">
									<input type="button" id="nicNameRepCheck" value="중복확인" style="margin-top: 10px;" class="btn btn-success" disabled="disabled">
								</div>
								<!-- <div class="col-md-7">
									<br>
									<input type="button" id="nicNameRepCheck" value="중복확인" class="btn btn-success">
									<button id="repeatCheck" class="btn btn-primary">중복확인</button>
								</div> -->
							</div>
						</div>
						
						<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-12">
									<label>관심음식</label> <input type="text" id="interestFood" name="interestFood" value="${memDetInfo.interestFood}"
										 class="form-control" placeholder="좋아하거나 관심있는 음식을 입력하여 주세요.[선택]" readonly>
								</div>
							</div>
						</div>

						<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-12">
									<label>자기소개</label> <%-- <input type="textArea" name="selfIntro"
										value="${memDetInfoDto.selfIntro}" class="form-control"> --%>
										<textarea id="selfIntro" name="selfIntro" value="${memDetInfo.selfIntro}" rows="5" class="form-control" placeholder="자기소개를 입력하여 주세요.[선택]" readonly>${memDetInfo.selfIntro}</textarea>
								</div>
							</div>
						</div>
						
						<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-12">
									<label>회원등급</label> <input type="text" name="memberGrade" value="${memSimInfo.memberGrade}"
										 class="form-control" readonly>
								</div>
							</div>
						</div>
						
						<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-6">
									<label>누적포인트</label><input type="text" id="accuPoint" name="accuPoint"  value="${memSimInfo.accuPoint}"
										 class="form-control" readonly>
									<table><tr><td id="birthCheckMessage" ></td></tr></table>
								</div>
								<div class="col-md-6">
									<label>현재포인트</label><input type="text" id="currPoint" name="currPoint"  value="${memSimInfo.currPoint}"
										 class="form-control" readonly>
									<table><tr><td id="birthCheckMessage" ></td></tr></table>
								</div>
							</div>
						</div>
						
						<div class="row" style="background-color: #86E57F">
							<div class="form-group">
								<div class="col-md-12">
									<!-- <label>이메일 수신여부</label> -->
									<c:if test="${memDetInfo.emailCheck=='수신'}">
										<div class="checkbox">
  											<label><input type="checkbox" id="emailCheck" name="emailCheck" value="" class="form-control" checked="checked" onclick="return false;" >이메일 수신여부</label>
										</div>
									</c:if>
									<c:if test="${memDetInfo.emailCheck=='미수신'}">
											<div class="checkbox">
  											<label><input type="checkbox" id="emailCheck" name="emailCheck" value="" class="form-control" onclick="return false;" >이메일 수신여부</label>
										</div>
									</c:if>
									<%-- <input type="text" name="emailCheck"  value="${memDetInfoDto.emailCheck}" class="form-control"> --%>
								</div>
							</div>
						</div>

						<div class="row" style="text-align:right; background-color: #86E57F">   
								<input type="button" id="profileMod" value="수정" style="margin-bottom: 17px; margin-right: 17px;" class="btn btn-primary"  OnClick="trueForm()">
								<input type="button" id="profileSave" value="저장"  style="margin-bottom: 17px; margin-right: 17px;"  class="btn btn-success" >
						</div>
					</form>
				</div>
				<!-- /REGISTER -->

				<!-- WHY? -->
		
			</div>

			</section>

		</div>
	<!-- </div> -->
	<!-- /WRAPPER -->

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