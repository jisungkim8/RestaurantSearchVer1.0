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

</head>
<body>

<c:forEach var="shopReview" items="${shopReviewDto}" varStatus="shopReviewVs">
	<div class="divider"></div>
	<div>
		<div class="row">
			<div class="col-md-12" style="background-color:rgba(255, 255, 0, 0.2);">
				<br>
				<br>
				<div class="col-md-12">
					<div class="col-md-4" style="align:left"> ${shopReview.memberId} </div>
					<div class="col-md-8" style="text-align:left">
						<div align="right">

							<c:if test="${sessionScope.userLoginInfo == null}">
								<button class="btn btn-default" data-toggle="modal" data-target="#loginFirst">추천</button>
							</c:if>
							
							<c:if test="${sessionScope.userLoginInfo != null}">
								<button id="recommend" class="btn btn-default" value="${shopReviewVs.current.reviewId}" data-toggle="modal" data-target="#recommendAdd">추천</button>
							</c:if>
							
						</div>
						<div align="right"><fmt:formatDate value="${shopReview.writeDate}" type="both" dateStyle="short" timeStyle="short"/></div>
					</div>
					
				</div>
				
				<hr>
				
				<div class="col-md-12">
					<div class="col-md-4" style="align:left"> 제목 </div> 
					<div class="col-md-8" style="text-align:left"> ${shopReview.title} </div> 
				</div>
				
				<div class="col-md-12">
					<div class="col-md-4" style="align:left"> 추천수 </div>
					<div class="col-md-8" style="text-align:left"> ${shopReview.recommendCnt} </div>
				</div>
				
				<div class="col-md-12">
					<div class="col-md-4" style="align:left"> 방문시간대 </div>
					<div class="col-md-8" style="text-align:left"> ${shopReview.visitTime} </div>
				</div>
				
				<div class="col-md-12">
					<div class="col-md-4" style="align:left"> Dinner/Lunch </div>
					<div class="col-md-8" style="text-align:left"> ${shopReview.dinnerOrLunch} </div>
				</div>
				
				<div class="col-md-12"> 
					<div class="col-md-4" style="align:left"> 본문 </div> 
					<div class="col-md-8" style="text-align:left"> ${shopReview.content} </div>
				</div>
		
				<ul class="lightbox nomargin-left list-unstyled" data-sort-id="isotope-list" data-plugin-options='{"delegate": "a", "gallery": {"enabled": true}}'>
					<c:forEach var="reviewPhoto" items="${shopReview.reviewPhotoDtoList}" varStatus="reviewPhotoVs">
							<li class="col-sm-3"> <!-- item -->
								<div class="item-box">
									<figure>
										<a href="<c:url value="${reviewPhoto.photoPath}" />">
											<c:if test="${reviewPhotoVs.index <= 2 }">
												<img class="img-responsive" src="<c:url value="${reviewPhoto.photoPath}" />" width="100" height="100" alt="">
											</c:if>
											
											<c:if test="${shopReview.reviewPhotoDtoList.size()-3 > 0}">
												<c:if test="${reviewPhotoVs.index == 2 }">
													<div style="position:absolute; top:0; left:0; width:100%; height:100%; background-color:rgba(0, 0, 0, 0.6)">
														<span class="inner" style="position:absolute; top:44%; right:40%; color:white; font-size:2rem">
															+ ${shopReview.reviewPhotoDtoList.size()-3}
														</span>
													</div>
												</c:if>
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
</c:forEach>
<c:if test="${checkMoreReview == false}">
	<input type="hidden" id="checkMoreReview" value="false">
</c:if>

<script type="text/javascript" src="View/restaurantDetViewScripts2.js"></script>

</body>
</html>