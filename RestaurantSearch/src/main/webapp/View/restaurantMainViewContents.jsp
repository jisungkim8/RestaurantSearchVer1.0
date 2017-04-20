<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
											style="color: lightgray" name="keyword" value="검색어로 검색: 혼밥/맛집/속초/데이트" />
										<input type="hidden" id="pageNum" name="pageNum" value="1" />
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
											src="${article.representPhoto}" width="409" height="271" />
									</figure>
									<div class="item-box-desc">
										<h3>${article.restaurantName}</h3>
										<h4>${article.addr}</h4>
										<h5>${article.phonenumber}</h5>
										<small>평점 ${article.averageScore}</small>
										<p>
											<!-- 한줄 설명 -->
										</p>

										<p>
											<span class="fsize12 pull-right"> <i class="bed-ico"
												title="beds"></i> 3 , <i class="garage-ico" title="garage"></i>
												1 , <i class="furnished-ico" title="furnished"></i>
											</span> <i class="home-ico"></i> 300m<sup>2</sup>
										</p>
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
						<a href="shoplist.do" class="btn btn-primary btn-xs">식당 등록하기</a>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius line-left">
						<i class="lightgray fa fa-road hidden-xs"></i>
						<h4>FAQ</h4>
						<p>질문은 언제나 환영입니다! FAQ 게시판과 이메일, 전화로 연락주세요.</p>
						<a href="page-right-sidebar.html" class="btn btn-primary btn-xs">질문하기</a>
					</div>
				</div>

				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="featured-box noradius line-left">
						<i class="lightgray fa fa-key hidden-xs"></i>
						<h4>서비스는 무료입니다.</h4>
						<p>현재 광고없는 무제한 무료 서비스를 지원중입니다.</p>
						<a href="page-full-width.html" class="btn btn-primary btn-xs">자세히
							보기</a>
					</div>
				</div>

			</div>

		</section>


	</div>

	<!-- /WRAPPER -->