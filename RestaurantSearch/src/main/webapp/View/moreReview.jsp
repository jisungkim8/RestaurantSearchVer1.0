<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="keywords" content="HTML5,CSS3,Template" />
		<meta name="description" content="" />
		<meta name="Author" content="Dorin Grigoras [www.stepofweb.com]" />

		<!-- mobile settings -->
<!-- 		<meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0" /> -->

		<!-- WEB FONTS -->
<!-- 		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800" rel="stylesheet" type="text/css" /> -->
		
		<!-- CORE CSS -->
<!-- 		<link href="design/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/font-awesome.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/plugins/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/plugins/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/animate.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/superslides.css" rel="stylesheet" type="text/css" /> -->

		<!-- REALESTATE -->
<!-- 		<link href="design/css/realestate.css" rel="stylesheet" type="text/css" /> -->

		<!-- THEME CSS -->
<!-- 		<link href="design/css/essentials.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/layout.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/layout-responsive.css" rel="stylesheet" type="text/css" /> -->
<!-- 		<link href="design/css/color_scheme/orange.css" rel="stylesheet" type="text/css" />orange: default style -->
		<!--<link id="css_dark_skin" href="<c:url value="design/css/layout-dark.css" />" rel="stylesheet" type="text/css" />--><!-- DARK SKIN -->

		<!-- styleswitcher - demo only -->
<!-- 		<link href="design/css/color_scheme/orange.css" rel="alternate stylesheet" type="text/css" title="orange" /> -->
<!-- 		<link href="design/css/color_scheme/red.css" rel="alternate stylesheet" type="text/css" title="red" /> -->
<!-- 		<link href="design/css/color_scheme/pink.css" rel="alternate stylesheet" type="text/css" title="pink" /> -->
<!-- 		<link href="design/css/color_scheme/yellow.css" rel="alternate stylesheet" type="text/css" title="yellow" /> -->
<!-- 		<link href="design/css/color_scheme/darkgreen.css" rel="alternate stylesheet" type="text/css" title="darkgreen" /> -->
<!-- 		<link href="design/css/color_scheme/green.css" rel="alternate stylesheet" type="text/css" title="green" /> -->
<!-- 		<link href="design/css/color_scheme/darkblue.css" rel="alternate stylesheet" type="text/css" title="darkblue" /> -->
<!-- 		<link href="design/css/color_scheme/blue.css" rel="alternate stylesheet" type="text/css" title="blue" /> -->
<!-- 		<link href="design/css/color_scheme/brown.css" rel="alternate stylesheet" type="text/css" title="brown" /> -->
<!-- 		<link href="design/css/color_scheme/lightgrey.css" rel="alternate stylesheet" type="text/css" title="lightgrey" /> -->
		<!-- /styleswitcher - demo only -->
		
		<!-- STYLESWITCHER - REMOVE ON PRODUCTION/DEVELOPMENT -->
<!-- 		<link href="design/plugins/styleswitcher/styleswitcher.css" rel="stylesheet" type="text/css" />		 -->

		<!-- Morenizr -->
<!-- 		<script type="text/javascript" src="design/plugins/modernizr.min.js"></script> -->
		
</head>
<body>

<c:forEach var="shopReview" items="${shopReviewDto}" varStatus="shopReviewVs">
	<div>
		<div class="col-md-12">
			
			<div class="col-md-11">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-3">
							${shopReview.memberId} <br>
							<fmt:formatDate value="${shopReview.writeDate}" type="both" dateStyle="short" timeStyle="short"/> <br>
							${shopReview.recommendCnt}
						</div>
					
						<div class="col-md-9">
							<div class="col-md-12" style="border:1px solid black"> ${shopReview.title} </div>
							<div class="col-md-12" style="border:1px solid black"> ${shopReview.content} </div>
							<div class="col-md-12" style="border:1px solid black">
								<div class="col-md-6" style="align:left"> 방문시간대 </div>
								<div class="col-md-6"> ${shopReview.visitTime} </div>
							</div>
							<div class="col-md-12" style="border:1px solid black">
								<div class="col-md-6" style="align:left"> Dinner/Lunch </div>
								<div class="col-md-6"> ${shopReview.dinnerOrLunch} </div>
							</div>
						</div>
					</div>
					
					<div class="col-md-12">
						<ul class="lightbox nomargin-left list-unstyled" data-sort-id="isotope-list" data-plugin-options='{"delegate": "a", "gallery": {"enabled": true}}'>
							<c:forEach var="reviewPhoto" items="${shopReview.reviewPhotoDtoList}" varStatus="reviewPhotoVs">
									<li class="col-sm-2"> <!-- item -->
										<div class="item-box">
											<figure>
												<a href="<c:url value="${reviewPhoto.photoPath}" />">
													<c:if test="${reviewPhotoVs.index <= 2 }">
														<img class="img-responsive" src="<c:url value="${reviewPhoto.photoPath}" />" width="100" height="100" alt="">
													</c:if>
													
													<c:if test="${reviewPhotoVs.index == 2 }">
														<div style="position:absolute; top:0; left:0; width:100%; height:100%; background-color:rgba(0, 0, 0, 0.6)">
															<span class="inner" style="position:absolute; top:44%; right:40%; color:white; font-size:3rem">
																+ ${shopReview.reviewPhotoDtoList.size()-3}
															</span>
														</div>
													</c:if>
												</a>
											</figure>
										</div>
									</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="col-md-1" align="right">
				<button id="recommend" class="btn btn-default" value="${vs.current.reviewId}">추천</button>
			</div>
		</div>
	</div>
</c:forEach>
<c:if test="${checkMoreReview == false}">
	<input type="hidden" id="checkMoreReview" value="false">
</c:if>



<!-- JAVASCRIPT FILES -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery-2.1.3.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery.easing.1.3.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery.cookie.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery.appear.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery.isotope.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/masonry.js"></script> -->
                               
<!-- 		<script type="text/javascript" src="design/plugins/bootstrap/js/bootstrap.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/magnific-popup/jquery.magnific-popup.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/owl-carousel/owl.carousel.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/stellar/jquery.stellar.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/knob/js/jquery.knob.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/jquery.backstretch.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/superslides/dist/jquery.superslides.min.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/styleswitcher/styleswitcher.js"></script> -->
<!-- 		<script type="text/javascript" src="design/plugins/mediaelement/build/mediaelement-and-player.min.js"></script> -->
		                                    
                                            
<!-- 		<script type="text/javascript" src="design/js/scripts.js"></script> -->
		<script type="text/javascript" src="View/restaurantDetViewScripts2.js"></script>
</body>
</html>