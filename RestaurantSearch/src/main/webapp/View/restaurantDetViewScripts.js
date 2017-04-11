//$(function(){
//	function moreReview(restaurantId){
//		alert("클릭되었음");
//		$.ajax({
//			url:"restaurantDetView.do",
//			data:"restaurantId="+1,
//			datatype:"json",
//			success:function(args) {
//				alert("asd");
//			}
//		})
////		$("#test").append('<c:forEach var="shopReview" items="${shopReviewDto}" begin="1" end="1"><c:set var="count" value="0" /><div><div class="col-md-12"><div class="col-md-4"><ul class="lightbox nomargin-left list-unstyled" data-sort-id="isotope-list" data-plugin-options="{"delegate": "a", "gallery": {"enabled": true}}"><c:forEach var="reviewPhoto" items="${reviewPhotoDto}"><c:if test="${reviewPhoto.reviewId == shopReview.reviewId}"><li> <!-- item --><div class="item-box nomargin-top"><figure><a class="item-hover" href="<c:url value="${reviewPhoto.photoPath}" />"></a><c:if test="${count == 0}"><img alt="" class="img-responsive" src="<c:url value="${reviewPhoto.photoPath}" />" /><c:remove var="count" /></c:if></figure></div></li></c:if></c:forEach></ul></div><div class="col-md-8"><div class="row"><div class="toogle"><div class="toggle active"><label>${shopReview.title}</label><div class="toggle-content"><p>${shopReview.content}</p></div></div></div></div></div></div></div></c:forEach>');
//	}
//})

var begin = 3;

var urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}

$(document).ready(function() {

	var moreCount = urlParam("moreCount");
	var restaurantId = urlParam("restaurantId");
	
	$("#test").load("View/NewFile.jsp");
	
	$("#moreReviewPhotoFile").on("click", function(e) {
		var content = "";
		var number = $("#reviewPhotoFileGroup input").length + 1;
		
		content = "<input type='file' " +
				"class='form-control' " +
				"style='height:50px;' " +
				"name='upload' " +
				"id='reviewPhotoFile" + number + "'>";
		
		$(content).appendTo("#reviewPhotoFileGroup");
		
		return false;
	});
	
	$(document).on("click", "#recommend", function(e) {
		var current = (this).value;
		
		
		if ((this).getAttribute("class") == "btn btn-success") {
			alert("asd");
			return;
		}
		
		(this).setAttribute("class", "btn btn-success");
		
		$.ajax({
			url : "recommend.do",
			method : "POST", 
			data : {restaurantId:restaurantId, current:current, moreCount:moreCount}, 
			success : function(args) {
				alert("moreCount = " + moreCount);
				alert("restaurantId = " + restaurantId);
				alert("current = " + current);
			}
		});
	})
	
	
	$(document).on("click", "#more", function(e) {
		$("body").off();
		
		var start = moreCount*3 + 1;
		var end = start + 2;

		$.ajax({
			url : "moreReview.do", 
			method : "GET", 
			data : {restaurantId:restaurantId, start:start, end:end, moreCount:moreCount}, 
			success : function(args) {
				alert("more Clicked!! moreCount = " + moreCount);
				alert("start = " + start);
				alert("end = " + end);
				$("#test").append(args);
				moreCount = moreCount*1 + 1;
				alert("moreCount After = " + moreCount)
			}
		})

		
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery-2.1.3.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"1");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.easing.1.3.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"2");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.cookie.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"3");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.appear.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"4");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.isotope.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"5");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/masonry.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"6");
//			$.holdReady(false);
//		});
//
//		$.holdReady(true);
//		$.getScript("design/plugins/bootstrap/js/bootstrap.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"7");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/magnific-popup/jquery.magnific-popup.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"8");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/owl-carousel/owl.carousel.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"9");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/stellar/jquery.stellar.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"10");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/knob/js/jquery.knob.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"11");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.backstretch.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"12");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/superslides/dist/jquery.superslides.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"13");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/styleswitcher/styleswitcher.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"14");
//			$.holdReady(false);
//		});
//		$.holdReady(true);
//		$.getScript("design/plugins/mediaelement/build/mediaelement-and-player.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"15");
//			$.holdReady(false);
//		});
//
//		$.holdReady(true);
//		$.getScript("design/js/scripts.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"16");
//			$.holdReady(false);
//		});
		
//
//		$.holdReady(true);
//		moremore();
//		$.holdReady(false);
		
//		getScript1();
//		getScript2();
//		getScript3();
//		getScript4();
//		getScript5();
//		getScript6();
//		getScript7();
//		getScript8();
//		getScript9();
//		getScript10();
//		getScript11();
//		getScript12();
//		getScript13();
//		getScript14();
//		getScript15();
//		getScript16();

//		$.when()
		
	});
	
//	var getScript1 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery-2.1.3.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"1");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript2 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.easing.1.3.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"2");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript3 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.cookie.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"3");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript4 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.appear.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"4");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript5 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.isotope.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"5");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript6 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/masonry.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"6");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript7 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/bootstrap/js/bootstrap.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"7");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript8 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/magnific-popup/jquery.magnific-popup.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"8");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript9 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/owl-carousel/owl.carousel.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"9");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript10 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/stellar/jquery.stellar.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"10");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript11 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/knob/js/jquery.knob.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"11");
//			$.holdReady(false);
//		});
//	};
//
//	var getScript12 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/jquery.backstretch.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"12");
//			$.holdReady(false);
//		});
//		$.ho
//	};
//	
//	var getScript13 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/superslides/dist/jquery.superslides.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"13");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript14 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/styleswitcher/styleswitcher.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"14");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript15 = function() {
//		$.holdReady(true);
//		$.getScript("design/plugins/mediaelement/build/mediaelement-and-player.min.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"15");
//			$.holdReady(false);
//		});
//	};
//	
//	var getScript16 = function() {
//		$.holdReady(true);
//		$.getScript("design/js/scripts.js", function(data, textStatus, jqxhr) {
//			console.log(textStatus+"16");
//			$.holdReady(false);
//		});
//	};
	
	var moremore = function() {
		var restaurantId = urlParam("restaurantId");
//		alert(restaurantId);
//		e.preventDefault();
		
		$.ajax({
			url : "restaurantDetView.do",
			method : "POST",
			data : {restaurantId:restaurantId},
			dataType : "json",
			async: true,
			success : function(args) {
				console.log("moremore");
				var divTag = "";
				var divTagColMd12 = "";
				var divTagColMd4 = "";
				var ulTag = "";
				var liTag = "";
				var divTagItembox = "";
				var figureTag = "";
				var aTag = "";
				var imgTag = "";
				var divTagColMd8 = "";
				var divTagRow = "";
				var divTagToogle = "";
				var divTagToggleActive = "";
				var labelTag = "";
				var divTagToggleContent = "";
				var pTag = "";
				var end = begin + 2;
				var count = 0;
				
				if (end >= args.shopReviewDto.length) { 
					end = args.shopReviewDto.length - 1;
					$("#more").remove();
				}
				
				for (var i=begin; i<=end; i++) {
//					alert(begin);
//					alert(end);
					divTag = document.createElement("div");
					divTagColMd12 = document.createElement("div");
					divTagColMd4 = document.createElement("div");
					ulTag = document.createElement("ul");
//					liTag = document.createElement("li");
//					divTagItembox = document.createElement("div");
//					figureTag = document.createElement("figure");
//					aTag = document.createElement("a");
//					imgTag = document.createElement("img");
					divTagColMd8 = document.createElement("div");
					divTagRow = document.createElement("div");
					divTagToogle = document.createElement("div");
					divTagToggleActive = document.createElement("div");
					labelTag = document.createElement("label");
					divTagToggleContent = document.createElement("div");
					pTag = document.createElement("p");
	
					
					divTagColMd12.setAttribute("class", "col-md-12");
					divTagColMd4.setAttribute("class", "col-md-4");
					ulTag.setAttribute("class", "lightbox nomargin-left list-unstyled");
					ulTag.setAttribute("data-sort-id", "isotope-list");
					ulTag.setAttribute("data-plugin-options", '{"delegate": "a", "gallery": {"enabled": true}}');
//					divTagItembox.setAttribute("class", "item-box nomargin-top");
//					aTag.setAttribute("class","item-hover");
//					imgTag.setAttribute("alt","");
//					imgTag.setAttribute("class", "img-responsive");
					divTagColMd8.setAttribute("class", "col-md-8");
					divTagRow.setAttribute("class", "row");
					divTagToogle.setAttribute("class", "toogle");
					divTagToggleActive.setAttribute("class", "toggle active");
					divTagToggleContent.setAttribute("class", "toggle-content");
					
					for (var j=0; j<args.reviewPhotoDto.length; j++) {
						if (args.reviewPhotoDto[j].reviewId == args.shopReviewDto[i].reviewId) {
	
							liTag = document.createElement("li");
							divTagItembox = document.createElement("div");
							figureTag = document.createElement("figure");
							aTag = document.createElement("a");
							imgTag = document.createElement("img");
							
							divTagItembox.setAttribute("class", "item-box nomargin-top");
							aTag.setAttribute("class","item-hover");
							aTag.setAttribute("href", args.reviewPhotoDto[j].photoPath);
							
							figureTag.appendChild(aTag);
	
//							alert(args.reviewPhotoDto[j].photoPath);
							if (count == 0) {
								imgTag.setAttribute("alt","");
								imgTag.setAttribute("class", "img-responsive");
								imgTag.setAttribute("src", args.reviewPhotoDto[j].photoPath);
								figureTag.appendChild(imgTag);
//								alert("1 = " + args.reviewPhotoDto[j].photoPath);
								count += 1;
							}
							
//							alert("2 = " + args.reviewPhotoDto[j].photoPath);
							
							divTagItembox.appendChild(figureTag);
							
							liTag.appendChild(divTagItembox);
							
							ulTag.appendChild(liTag);
						}
					}
					
						
					divTagColMd4.appendChild(ulTag);
					
					labelTag.innerHTML = args.shopReviewDto[i].title;
					pTag.innerHTML = args.shopReviewDto[i].content;
					
					divTagToggleContent.appendChild(pTag);
					
					divTagToggleActive.appendChild(labelTag);
					divTagToggleActive.appendChild(divTagToggleContent);
					
					divTagToogle.appendChild(divTagToggleActive);
					
					divTagRow.appendChild(divTagToogle);
					
					divTagColMd8.appendChild(divTagRow);
					
	
					divTagColMd12.appendChild(divTagColMd4);
					divTagColMd12.appendChild(divTagColMd8);
					
					divTag.appendChild(divTagColMd12);
					
					count = 0;
					
//					$("#review").append(divTag);
					$(divTag).appendTo("#review");
				}
				begin += 3;
				
//				alert(args.shopReviewDto[0].title)
//				alert(args.reviewPhotoDto)

//				$.getScript("design/plugins/jquery-2.1.3.min.js");
//				$.getScript("design/plugins/jquery.easing.1.3.js");
//				$.getScript("design/plugins/jquery.cookie.js");
//				$.getScript("design/plugins/jquery.appear.js");
//				$.getScript("design/plugins/jquery.isotope.js");
//				$.getScript("design/plugins/masonry.js");
//				
//				$.getScript("design/plugins/bootstrap/js/bootstrap.min.js");
//				$.getScript("design/plugins/magnific-popup/jquery.magnific-popup.min.js");
//				$.getScript("design/plugins/owl-carousel/owl.carousel.min.js");
//				$.getScript("design/plugins/stellar/jquery.stellar.min.js");
//				$.getScript("design/plugins/knob/js/jquery.knob.js");
//				$.getScript("design/plugins/jquery.backstretch.min.js");
//				$.getScript("design/plugins/superslides/dist/jquery.superslides.min.js");
//				$.getScript("design/plugins/styleswitcher/styleswitcher.js");
//				$.getScript("design/plugins/mediaelement/build/mediaelement-and-player.min.js");
//				
//				$.getScript("design/js/scripts.js");
			}
		})
	};
	

})


//function moreReview(restaurantId) {
////	alert(restaurantId)
//	
//	$.ajax({
//		url : "restaurantDetView.do",
//		method : "POST",
//		data : {restaurantId:restaurantId},
//		dataType : "json",
//		async: false,
//		success : function(args) {
//			var divTag = "";
//			var divTagColMd12 = "";
//			var divTagColMd4 = "";
//			var ulTag = "";
//			var liTag = "";
//			var divTagItembox = "";
//			var figureTag = "";
//			var aTag = "";
//			var imgTag = "";
//			var divTagColMd8 = "";
//			var divTagRow = "";
//			var divTagToogle = "";
//			var divTagToggleActive = "";
//			var labelTag = "";
//			var divTagToggleContent = "";
//			var pTag = "";
//			var end = begin + 2;
//			var count = 0;
//			
//			if (end >= args.shopReviewDto.length) { 
//				end = args.shopReviewDto.length - 1;
//				$("#more").remove();
//			}
//			
//			for (var i=begin; i<=end; i++) {
////				alert(begin);
////				alert(end);
//				divTag = document.createElement("div");
//				divTagColMd12 = document.createElement("div");
//				divTagColMd4 = document.createElement("div");
//				ulTag = document.createElement("ul");
////				liTag = document.createElement("li");
////				divTagItembox = document.createElement("div");
////				figureTag = document.createElement("figure");
////				aTag = document.createElement("a");
////				imgTag = document.createElement("img");
//				divTagColMd8 = document.createElement("div");
//				divTagRow = document.createElement("div");
//				divTagToogle = document.createElement("div");
//				divTagToggleActive = document.createElement("div");
//				labelTag = document.createElement("label");
//				divTagToggleContent = document.createElement("div");
//				pTag = document.createElement("p");
//
//				
//				divTagColMd12.setAttribute("class", "col-md-12");
//				divTagColMd4.setAttribute("class", "col-md-4");
//				ulTag.setAttribute("class", "lightbox nomargin-left list-unstyled");
//				ulTag.setAttribute("data-sort-id", "isotope-list");
//				ulTag.setAttribute("data-plugin-options", '{"delegate": "a", "gallery": {"enabled": true}}');
////				divTagItembox.setAttribute("class", "item-box nomargin-top");
////				aTag.setAttribute("class","item-hover");
////				imgTag.setAttribute("alt","");
////				imgTag.setAttribute("class", "img-responsive");
//				divTagColMd8.setAttribute("class", "col-md-8");
//				divTagRow.setAttribute("class", "row");
//				divTagToogle.setAttribute("class", "toogle");
//				divTagToggleActive.setAttribute("class", "toggle active");
//				divTagToggleContent.setAttribute("class", "toggle-content");
//				
//				for (var j=0; j<args.reviewPhotoDto.length; j++) {
//					if (args.reviewPhotoDto[j].reviewId == args.shopReviewDto[i].reviewId) {
//
//						liTag = document.createElement("li");
//						divTagItembox = document.createElement("div");
//						figureTag = document.createElement("figure");
//						aTag = document.createElement("a");
//						imgTag = document.createElement("img");
//						
//						divTagItembox.setAttribute("class", "item-box nomargin-top");
//						aTag.setAttribute("class","item-hover");
//						aTag.setAttribute("href", args.reviewPhotoDto[j].photoPath);
//						
//						figureTag.appendChild(aTag);
//
////						alert(args.reviewPhotoDto[j].photoPath);
//						if (count == 0) {
//							imgTag.setAttribute("alt","");
//							imgTag.setAttribute("class", "img-responsive");
//							imgTag.setAttribute("src", args.reviewPhotoDto[j].photoPath);
//							figureTag.appendChild(imgTag);
////							alert("1 = " + args.reviewPhotoDto[j].photoPath);
//							count += 1;
//						}
//						
////						alert("2 = " + args.reviewPhotoDto[j].photoPath);
//						
//						divTagItembox.appendChild(figureTag);
//						
//						liTag.appendChild(divTagItembox);
//						
//						ulTag.appendChild(liTag);
//					}
//				}
//				
//					
//				divTagColMd4.appendChild(ulTag);
//				
//				labelTag.innerHTML = args.shopReviewDto[i].title;
//				pTag.innerHTML = args.shopReviewDto[i].content;
//				
//				divTagToggleContent.appendChild(pTag);
//				
//				divTagToggleActive.appendChild(labelTag);
//				divTagToggleActive.appendChild(divTagToggleContent);
//				
//				divTagToogle.appendChild(divTagToggleActive);
//				
//				divTagRow.appendChild(divTagToogle);
//				
//				divTagColMd8.appendChild(divTagRow);
//				
//
//				divTagColMd12.appendChild(divTagColMd4);
//				divTagColMd12.appendChild(divTagColMd8);
//				
//				divTag.appendChild(divTagColMd12);
//				
//				count = 0;
//				
//				$("#review").append(divTag).trigger('CSS');
//			}
//			
//			begin += 3;
//			
////			alert(args.shopReviewDto[0].title)
////			alert(args.reviewPhotoDto)
//		}
//	})
//}

function addLikeSessionExists() {
	alert("addLikeSessionExists")
}

function addLikeSessionNotExists() {
	alert("addLikeSessionNotExists")
	$("#login").attr('class', 'pull-right nav signin-dd open');
	$("#quick_sign_in").attr('aria-expanded', true);
}
