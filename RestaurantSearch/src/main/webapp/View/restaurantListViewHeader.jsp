<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<a href="memberLogout.do">
										<i class="icon_profile"></i> 로그아웃
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="#" id="memLeave">
										<i class="icon_profile"></i> 회원탈퇴
									</a>
								</li>
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
									<a href="memberLogout.do">
										<i class="icon_profile"></i> 로그아웃
									</a>
								</li>
								
								<li class="eborder-top">
									<a href="#" id="memLeave">
										<i class="icon_profile"></i> 회원탈퇴
									</a>
								</li>
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