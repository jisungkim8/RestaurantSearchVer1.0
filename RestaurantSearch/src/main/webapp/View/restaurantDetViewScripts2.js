	/* Init */
	jQuery(window).ready(function () {
		Atropos();
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
