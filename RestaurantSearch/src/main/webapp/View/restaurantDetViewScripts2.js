	/* Init */
	jQuery(window).ready(function () {
		Atropos();
		
		var moreCount = urlParam("moreCount");
		var restaurantId = urlParam("restaurantId");
		var filterName = urlParam("filterName");
		
		$("#addReviewPhotoFileAtModify").on("click", function(e) {
			alert("addReviewPhotoFileAtModify");
			
			var content = "";
			var number = $("#reviewPhotoFileGroupAtModify input").length + 1;
			
			
			content = "<input type='file' " +
					"class='form-control' " +
					"style='height:50px;' " +
					"name='upload' " +
					"id='reviewPhotoFileAtModify" + number + "'>";
			
			$(content).appendTo("#reviewPhotoFileGroupAtModify");
			
			return false;
		});
		
		$("#deleteReviewPhotoFileAtModify").on("click", function(e) {
			var number = $("#reviewPhotoFileGroupAtModify input").length;
			var imgFileId = "reviewPhotoFileAtModify" + number;
			
			alert("deleteReviewPhotoFileAtModify");
			
			$("#" + imgFileId).remove();
			
			return false;
		});
		
		$(document).on("submit", "#reviewUpdateForm", function(e) {
			
			alert("reviewUpdateForm")
			
			if (this.title.value == "") {
				alert("title");
				$("#reviewTitleMsgAtModify").html("<font style='color:red'> 제목을 입력해주세요 </font>");
			}
			
			if (this.content.value == "") {
				alert("content");
				$("#reviewContentMsgAtModify").html("<font style='color:red'> 본문을 입력해주세요 </font>");
			}
			
			if (this.title.value != "" && this.content.value != "") {
				return true;
			}
			
			return false;
		});
		
		$(document).on("click", "#reviewDeleteButton", function(e) {
			var current = (this)
			alert("current = " + current)
			
			location.href="reviewDelete.do?restaurantId=" + restaurantId + "&current=" + current.value + "&moreCount=0&filterName=reviewId"
//			$.ajax({
//				url : "reviewDelete.do",
//				method : "POST", 
//				data : {restaurantId:restaurantId, current:current.value, moreCount:moreCount, filterName:filterName}, 
//				success : function(args) {
//					location.href=""
//				}
//			});
		})
	});


/** Core
 **************************************************************** **/
	function Atropos() {
		_topNav();
		_animate();
		_superslide();
		_owl_carousel();
		_popover();
		_lightbox();
		_scrollTo();
		_parallax();
		_masonry();
		_toggle();
		_bgimage();
		_globalSearch();
		_quickCart();
		_placeholder();
		_htmlEditor();

		/** Bootstrap Tooltip **/ 
		jQuery("a[data-toggle=tooltip]").tooltip();
		
		/** Fitvids [Youtube|Vimeo] **/
		if(jQuery(".fullwidthbanner iframe").length < 1 && jQuery(".fullscreenbanner iframe").length < 1 && jQuery(".fullscreenvideo").length < 1) { // disable fitvids if revolution slider video is present!
			jQuery("body").fitVids(); 
		}

		/** 
			price slider 

			<script type="text/javascript" charset="utf-8">
				var slider_config = { from: 10, to: 500, heterogeneity: ['50/100', '75/250'], step: 10, dimension: '&nbsp;$', skin: 'round_plastic' };
			</script>
		**/
		if(jQuery().slider && jQuery(".price-slider").length > 0) {
			jQuery("#Slider2").slider(slider_config);
		}

		/** mobile - hide on click! **/
		jQuery(document).bind("click", function() {
			if(jQuery("div.navbar-collapse").hasClass('in')) {
				jQuery("button.btn-mobile").trigger('click');
			}
		});

	}
	/** 06. LightBox
	 **************************************************************** **/
	function _lightbox() {

		if(typeof(jQuery.magnificPopup) == "undefined") {
			return false;
		}

		jQuery.extend(true, jQuery.magnificPopup.defaults, {
			tClose: 		'Close',
			tLoading: 		'Loading...',

			gallery: {
				tPrev: 		'Previous',
				tNext: 		'Next',
				tCounter: 	'%curr% / %total%'
			},

			image: 	{ 
				tError: 	'Image not loaded!' 
			},

			ajax: 	{ 
				tError: 	'Content not loaded!' 
			}
		});

		jQuery(".lightbox").each(function() {

			var _t 			= jQuery(this),
				options 	= _t.attr('data-plugin-options'),
				config		= {},
				defaults 	= {
					type: 				'image',
					fixedContentPos: 	false,
					fixedBgPos: 		false,
					mainClass: 			'mfp-no-margins mfp-with-zoom',
					image: {
						verticalFit: 	true
					},

					zoom: {
						enabled: 		false,
						duration: 		300
					},

					gallery: {
						enabled: false,
						navigateByImgClick: true,
						preload: 			[0,1],
						arrowMarkup: 		'<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
						tPrev: 				'Previou',
						tNext: 				'Next',
						tCounter: 			'<span class="mfp-counter">%curr% / %total%</span>'
					},
				};

			if(_t.data("plugin-options")) {
				config = jQuery.extend({}, defaults, options, _t.data("plugin-options"));
			}

			jQuery(this).magnificPopup(config);

		});
	}
