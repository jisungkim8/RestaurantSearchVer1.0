<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="filter_info_window"
		style="position: fixed; background-color: gray; width: 450px; min-height: 525px; top: 40px; left: 15px; z-index: 999; border: solid black 2px; border-radius: 5px; display: none;">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1">장소</a>
					</h5>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
						<section class="panel"> <header
							class="panel-heading tab-bg-primary ">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#gangnam">강남</a>
							</li>
							<li class=""><a data-toggle="tab" href="#gangbook">강북</a></li>
							<li class=""><a data-toggle="tab" href="#incheon">인천</a></li>
							<li class=""><a data-toggle="tab" href="#gyeonggi">경기</a></li>
							<li class=""><a data-toggle="tab" href="#busan">부산</a></li>
							<li class=""><a data-toggle="tab" href="#gwangju">광주</a></li>
							<li class="">
							<!-- <a data-toggle="tab" href="#profile2">. . .</a> -->
								<div class="btn-group">
									<button id="btnGroupVerticalDrop1" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width: 49px;">
										...<span class="caret"></span>
									</button>
									<ul class="dropdown-menu" aria-labelledby="btnGroupVerticalDrop1"> 
										<li>
											<a data-toggle="tab" href="#">대구</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">울산</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">대전</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">세종</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">충북</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">충남</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">강원</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">경북</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">경남</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">전북</a>
										</li>
										<li>
											<a data-toggle="tab" href="#">전남</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
						</header>

						<div class="panel-body">
							<div class="tab-content">
								<div id="gangnam" class="tab-pane active">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="강남역">
													강남역 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="가로수길">
													가로수길 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="신사/압구정">
													신사/압구정 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="청담동">
													청담동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="신천/잠실">
													신천/잠실 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="여의도">
													여의도 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="역삼/선릉">
													역삼/선릉 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="교대/서초">
													교대/서초 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="삼성동">
													삼성동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="논현동">
													논현동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="서래마을">
													서래마을 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="동작/사당">
													동작/사당 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="방배/반포/잠원">
													방배/반포/잠원 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="관악구">
													관악구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="영등포구">
													영등포구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="송파/가락">
													송파/가락 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="대치동">
													대치동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="강남기타">
													강남 기타 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="도곡동">
													도곡동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="양재동">
													양재동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="구로구">
													구로구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="목동">
													목동/양천 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="방이동">
													방이동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="강동구">
													강동구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="개포/수서/일원">
													개포/수서/일원 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="등촌/강서">
													등촌/강서 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="금천구">
													금천구 </label>
										</div>
									</div>
								</div>
								<div id="gangbook" class="tab-pane">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="홍대">
													홍대 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="이태원/한남동">
													이태원/한남동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광화문">
													광화문 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="신촌/이대">
													신촌/이대 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="마포">
													마포 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="종로">
													종로 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="대학로/혜화">
													대학로/혜화 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="건대/군자/광진">
													건대/군자/광진 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="명동/남산">
													명동/남산 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="삼청/인사">
													삼청/인사 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="중구">
													중구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value=" 시청/남대문">
													시청/남대문 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="왕십리/성동">
													왕십리/성동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="용산/숙대">
													용산/숙대 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="노원/중랑">
													노원/중랑 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value=" 성북구">
													성북구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="동부이촌동">
													동부이촌동 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="수유/도봉/강북">
													수유/도봉/강북 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="동대문구">
													동대문구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="은평구">
													은평구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="강북 기타">
													강북 기타 </label>
										</div>
									</div>
								</div>
								<div id="incheon" class="tab-pane">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천연수구">
													인천연수구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천부평구">
													인천부평구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천남동구">
													인천남동구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천남구">
													인천남구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천서구">
													인천서구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천동구">
													인천동구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천계양구">
													인천계양구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천중구">
													인천중구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천강화군">
													인천강화군 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="인천웅진군">
													인천웅진군 </label>
										</div>
									</div>
								</div>
								<div id="gyeonggi" class="tab-pane">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="성남시">
													성남시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="고양시">
													고양시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="수원시">
													수원시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="용인시">
													용인시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="안양시">
													안양시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부천시">
													부천시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광명시">
													광명시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="화성시">
													화성시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="구리시">
													구리시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="파주시">
													파주시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="평택시">
													평택시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="하남시">
													하남시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주시">
													광주시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="가평군">
													가평군 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="의정부시">
													의정부시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="시흥시">
													시흥시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="양평군">
													양평군 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="과천시">
													과천시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="김포시">
													김포시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="이천시">
													이천시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="의왕시">
													의왕시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="포천시">
													포천시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="여주시">
													여주시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="오산시">
													오산시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="동두천시">
													동두천시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="안성시">
													안성시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="양주시">
													양주시 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="연천군">
													연천군 </label>
										</div>
									</div>
								</div>
								<div id="busan" class="tab-pane">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산해운대구">
													부산해운대구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산진구">
													부산진구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산중구">
													부산중구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산금정구">
													부산금정구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산동래구">
													부산동래구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산남구">
													부산남구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산수영구">
													부산수영구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산사하구">
													부산사하구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산기장군">
													부산기장군 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산연제구">
													부산연제구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산사상구">
													부산사상구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산북구">
													부산북구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산동구">
													부산동구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산영도구">
													부산영도구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산강서구">
													부산강서구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="부산서구">
													부산서구 </label>
										</div>
									</div>
								</div>
								
								<div id="gwangju" class="tab-pane">
									<div class="btn-row">
										<div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주광산구">
													광주광산구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주서구">
													광주서구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주북구">
													광주북구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주동구">
													광주동구 </label> <label class="btn btn-primary"> <input
												type="checkbox" name="location_checkbox" value="광주남구">
													광주남구 </label> 
										</div>
									</div>
								</div>
							</div>
						</div>
						</section>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2">음식</a>
					</h5>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="btn-row">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary"> <input type="checkbox"
									id="food_checkbox_korean" name="food_checkbox" value="한식">
										한식 </label> <label class="btn btn-primary"> <input
									type="checkbox" id="food_checkbox_japanese"
									name="food_checkbox" value="중식"> 중식 </label> <label
									class="btn btn-primary"> <input type="checkbox"
									id="food_checkbox_chinese" name="food_checkbox" value="일식">
										일식 </label> <label class="btn btn-primary"> <input
									type="checkbox" id="food_checkbox_ws_asia" name="food_checkbox"
									value="서남아시아"> 서남아 </label> <label class="btn btn-primary">
									<input type="checkbox" id="food_checkbox_es_asia"
									name="food_checkbox" value="동남아시아"> 동남아 
								</label> <br /> <label class="btn btn-primary"> <input
									type="checkbox" id="food_checkbox_western" name="food_checkbox"
									value="양식"> 양식 </label> <label class="btn btn-primary">
									<input type="checkbox" id="food_checkbox_ms_america"
									name="food_checkbox" value="중남미"> 중남미 
								</label> <label class="btn btn-primary"> <input type="checkbox"
									id="food_checkbox_afreeca" name="food_checkbox" value="아프리카">
										아프리카 </label> <label class="btn btn-primary"> <input
									type="checkbox" id="food_checkbox_others" name="food_checkbox"
									value="기타"> 기타 </label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">가격대</a>
					</h5>
				</div>
				<div id="collapse3" class="panel">
					<div class="panel-body" style="text-align: center;">
						<div class="btn-row">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default" style="width: 80px;"> <input
									type="radio" name="price_radio" id="price_radio_under_10k"
									style="margin: 0 auto;" value="10000--"> 만원미만 </label> <label
									class="btn btn-default" style="width: 80px;"> <input
									type="radio" name="price_radio" id="price_radio_over_10k"
									value="10000++"> 만원대 </label> <label class="btn btn-default"
									style="width: 80px;"> <input type="radio"
									name="price_radio" id="price_radio_over_20k" value="20000++">
										2만원대 </label> <label class="btn btn-default" style="width: 80px;">
									<input type="radio" name="price_radio"
									id="price_radio_over_30k" value="30000++"> 3만원++ 
								</label> <label class="btn btn-default active" style="width: 80px;">
									<input type="radio" name="price_radio"
									id="price_radio_over_40k" value="가격:무관" checked="checked">
										무관 
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">예약</a>
					</h5>
				</div>
				<div id="collapse4" class="panel">
					<div class="panel-body" style="text-align: center;">
						<div class="btn-row">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-info"> <input type="radio"
									name="booking_radio" id="booking_radio_able_to_book"
									value="예약:가능"> 가능 </label> <label class="btn btn-info active">
									<input type="radio" name="booking_radio"
									id="booking_radio_unable_to_book_" value="예약:무관"
									checked="checked"> 무관 
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">
						<a href="#collapse3">주차장</a>
					</h5>
				</div>
				<div id="collapse5" class="panel">
					<div class="panel-body" style="text-align: center;">
						<!-- <input type="radio" name="parking" id="parking_radio_parkable" value="주차:가능">가능</input> 
						<input type="radio" name="parking" id="parking_radio_unparkable" checked="checked" value="주차:무관">무관</input> -->
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-info"> <input type="radio"
								name="parking_radio" id="parking_radio_parkable" value="주차:가능">
									가능 </label> <label class="btn btn-info active"> <input
								type="radio" name="parking_radio" id="parking_radio_unparkable"
								value="주차:무관" checked="checked"> 무관 </label>
						</div>
					</div>
				</div>
			</div>

		</div>

		<div style="margin-bottom: 20px; text-align: center;">
			<a class="btn btn-default btn-lg" style="width: 128px;"
				href="javascript:close_filter_window();"
				title="Bootstrap 3 themes generator">닫기</a> <a
				class="btn btn-info btn-lg" style="width: 128px;"
				href="javascript:get_restaurant_data_by_keyword_and_filter_info('',1);"
				title="Bootstrap 3 themes generator">적용</a>
		</div>

	</div>
	<aside>
	<div id="sidebar" class="nav" style="z-index: 2;">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li class="sub-menu"><a href="javascript:;" class=""
				style="min-height: 55px;"> <i class="icon_house_alt"
					style="float: left;"></i> <span
					style="float: left; margin-right: 10px;">키워드</span> <input
					id="keyword_input" type="text" class="col-sm-8" value="${keyword}"
					style="color: #1A1A1A;" placeholder="장소" />
			</a></li>

			<li class="sub-menu"><a href="javascript:open_filter_window();"
				class=""> <i class="icon_genius"></i> <span>상세검색</span>
			</a></li>

			<li id="cuisine" class="sub-menu" style="clear: left; height: 500px;">
				<ul id="cuisine_list" style="padding-left: 0px;">
				</ul>
			</li>
		</ul>
		<!-- sidebar menu end-->
		<div id="paging_html" class=""
			style="width: 480px; height: 40px; margin-top: 20px; text-align: center; background-color: white;">
		</div>
	</div>
	</aside>

	<!--sidebar end-->
	<div id="map" style="width: 100%; height: 1200px; z-index: 1;"></div>