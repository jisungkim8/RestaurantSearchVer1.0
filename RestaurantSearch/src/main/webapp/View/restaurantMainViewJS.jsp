<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- JAVASCRIPT FILES -->
	<!-- <script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script> -->
	<!-- Morenizr -->
<script type="text/javascript" src="design/plugins/modernizr.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript" src="design/plugins/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="design/plugins/jquery.appear.js"></script>
<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script>
<script type="text/javascript" src="design/plugins/masonry.js"></script>

<script type="text/javascript" src="design/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="design/plugins/magnific-popup/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="design/plugins/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="design/plugins/stellar/jquery.stellar.min.js"></script>
<script type="text/javascript" src="design/plugins/knob/js/jquery.knob.js"></script>
<script type="text/javascript" src="design/plugins/jquery.backstretch.min.js"></script>
<script type="text/javascript" src="design/plugins/superslides/dist/jquery.superslides.min.js"></script>

<script type="text/javascript" src="design/plugins/mediaelement/build/mediaelement-and-player.min.js"></script>

<script type="text/javascript" src="design/js/scripts.js"></script>
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

						$("#login")
								.click(
										function() {
											var registerCheck, passwd;

											alert("memberId==>"
													+ $("#memberId").val());
											alert("password==>"
													+ $("#password").val());

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

											$
													.ajax({
														url : 'memberRegiCheck.do', //요청문서를 지정할때 사용하는 키명(url):요청문서명
														//2.data:{매개변수명:값,매개변수명2:값2,,,,}
														data : {
															id : $("#memberId")
																	.val()
														},
														type : "POST",
														//3.success:콜백함수명(매개변수)
														success : function(args) {
															alert(args);
															if (args == "register") {
																alert("회원등록이 되었습니다.")
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
																				alert(args)
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
											alert("id=>" + $('#memberId').val())
											alert("pwd=>"
													+ $("#password").val())

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