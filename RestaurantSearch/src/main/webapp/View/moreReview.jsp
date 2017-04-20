<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="restaurant.util.StringUtil"%>
	
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

<c:if test="${shopReviewDto.isEmpty()}">
	등록된 리뷰가 없습니다.
</c:if>

<c:if test="${!shopReviewDto.isEmpty()}">
	<c:forEach var="shopReview" items="${shopReviewDto}" varStatus="shopReviewVs">
		<div class="divider"></div>
		<div>
			<div class="row">
				<div class="col-md-12" style="background-color:rgba(255, 255, 0, 0.2);">
					<br>
					<br>
					<div class="col-md-12">
						<div class="col-md-4" style="align:left">
							<c:if test="${sessionScope.userLoginDetInfo.photoPath == null}">
								<img src="images/porfilepic_default.jpg" class="img-circle img-responsive" width="50" height="50">
							</c:if>
							
							<c:if test="${sessionScope.userLoginDetInfo.photoPath != null}">
								<img src="images/${sessionScope.userLoginDetInfo.photoPath}" class="img-circle img-responsive" width="50" height="50"> 
							</c:if> 
							${shopReview.memberId} 
						</div>
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
					
					<div class="col-md-12">
						<div class="col-md-8" style="align:left">
							<ul class="lightbox nomargin-left list-unstyled" data-sort-id="isotope-list" data-plugin-options='{"delegate": "a", "gallery": {"enabled": true}}'>
								<c:forEach var="reviewPhoto" items="${shopReview.reviewPhotoDtoList}" varStatus="reviewPhotoVs">
									<li class="col-sm-3"> <!-- item -->
										<div class="item-box">
											<figure>
												<a href="<c:url value="images/${reviewPhoto.photoPath}" />">
													<c:if test="${reviewPhotoVs.index <= 2 }">
														<img class="img-responsive" src="images/${reviewPhoto.photoPath}" width="100" height="100" alt="">
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
						
						<div class="col-md-4" style="text-align:left">
							<div align="right">
		
								<c:if test="${(sessionScope.userLoginInfo != null) && (sessionScope.userLoginInfo.memberId == shopReview.memberId)}">
									<button id="reviewModifyButton" class="btn btn-primary" data-toggle="modal" data-target="#reviewModifyModal">리뷰 수정</button> <br><br>
									<button class="btn btn-primary" data-toggle="modal" data-target="#reviewDeleteModal">리뷰 삭제</button>
									
									<div id="reviewModifyModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<!-- modal header -->
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">리뷰 수정</h4>
												</div>
												<!-- /modal header -->
												
												<form action="reviewUpdate.do?restaurantId=${shopReview.restaurantId}&moreCount=0&filterName=reviewId" enctype="multipart/form-data" method="post" id="reviewUpdateForm">
													
													<!-- modal body -->
													<div class="modal-body">
														<div class="row">
															<div class="form-group">
																<div class="col-md-12">
																	<label>제목</label>
																	<input type="text" class="form-control" name="title" placeholder="리뷰 제목을 작성해주세요." value="${shopReview.title}">
																	<div id="reviewTitleMsgAtModify"></div>
																	
																	<label>내용</label>
																	<textarea rows="10" class="form-control" name="content" placeholder="리뷰 내용을 작성해주세요.">${StringUtil.reparseBr(shopReview.content)}</textarea>
																	<div id="reviewContentMsgAtModify"></div>
																	
																	<label>방문시간대</label>
																	<select class="form-control pointer" name="visitTime">
																		<option value="" selected="selected">선택</option>
																		<option value="0~1시">0~1시</option>
																		<option value="1~2시">1~2시</option>
																		<option value="2~3시">2~3시</option>
																		<option value="3~4시">3~4시</option>
																		<option value="4~5시">4~5시</option>
																		<option value="5~6시">5~6시</option>
																		<option value="6~7시">6~7시</option>
																		<option value="7~8시">7~8시</option>
																		<option value="8~9시">8~9시</option>
																		<option value="9~10시">9~10시</option>
																		<option value="10~11시">10~11시</option>
																		<option value="11~12시">11~12시</option>
																	</select>
																	
																	<label>Dinner/Lunch</label>
																	<select class="form-control pointer" name="dinnerOrLunch">
																		<option value="" selected="selected">선택</option>
																		<option value="Dinner">Dinner</option>
																		<option value="Lunch">Lunch</option>
																	</select>
																	
																	
																	<label>사진</label>
																	
																	<div id="reviewPhotoFileGroupAtModify">
																		<input type="file" class="form-control" style="height:50px;" name="upload"> asdasd
																	</div>
																	<div align="right">
																		<button id="addReviewPhotoFileAtModify" class="btn btn-default">사진 추가</button>
																		<button id="deleteReviewPhotoFileAtModify" class="btn btn-default">사진 삭제</button>
																	</div>
																	
																	<input type="hidden" name="reviewId" value="${shopReview.reviewId}">
																	<input type="hidden" name="memberId" value="${sessionScope.userLoginInfo.memberId}">
																</div>
															</div>
														</div>
	
													</div>
													<!-- /modal body -->
				
													<!-- modal footer -->
													<div class="modal-footer">
														<button class="btn btn-primary">Submit</button>
														<button class="btn btn-default" data-dismiss="modal">Close</button> 
													</div>
													<!-- /modal footer -->
			
												</form>
											</div>
										</div>
									</div>
									
									<div id="reviewDeleteModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
			
												<div class="modal-header"><!-- modal header -->
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">리뷰 삭제</h4>
												</div><!-- /modal header -->
			
												<!-- modal body -->
												<div class="modal-body">
													리뷰를 삭제하시겠습니까??
												</div>
												<!-- /modal body -->
			
												<div class="modal-footer"><!-- modal footer -->
													<button id="reviewDeleteButton" class="btn btn-primary" value="${shopReviewVs.current.reviewId}">Yes</button> <button class="btn btn-default" data-dismiss="modal">No</button>
												</div><!-- /modal footer -->
			
											</div>
										</div>
									</div>

									
								</c:if>
								
							</div>
						</div>
							
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>
<c:if test="${checkMoreReview == false}">
	<input type="hidden" id="checkMoreReview" value="false">
</c:if>

<script type="text/javascript" src="View/restaurantDetViewScripts2.js"></script>

</body>
</html>