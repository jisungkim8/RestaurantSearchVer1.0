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
	var filterName = urlParam("filterName");
	
	var moreReview = function() {
		var start = moreCount*3 + 1;
		var end = start + 2;
		
		$.ajax({
			url : "moreReview.do", 
			method : "GET", 
			data : {restaurantId:restaurantId, start:start, end:end, moreCount:moreCount, filterName:filterName}, 
			success : function(args) {
//				alert("more Clicked!! moreCount = " + moreCount);
//				alert("start = " + start);
//				alert("end = " + end);
				$("#getReview").append(args);
				moreCount = moreCount*1 + 1;
//				alert("moreCount After = " + moreCount)
//				alert("test = " + $("#checkMoreReview").val());
//				alert("filterName = " + filterName);
				
				if ($("#checkMoreReview").val() == "false") $("#more").remove();
			}
		});
	};
	
	moreReview();

	
	$(document).on("click", "#filtering", function(e) {
		filterName = (this).value;
		moreCount = 0;
		var start = moreCount*3 + 1;
		var end = start + 2;
		
		$.ajax({
			url : "orderByRecommendCnt.do",
			method : "GET", 
			data : {restaurantId:restaurantId, start:start, end:end, moreCount:moreCount, filterName:filterName}, 
			success : function(args) {
//				alert("moreCount = " + moreCount);
//				alert("restaurantId = " + restaurantId);
//				alert("current = " + current);
//				alert(args);
//				alert("filterName = " + filterName);
				$("#getReview").children().remove();
				moreReview();

				$("#more").remove();
				var content = "<h4 align='center'><button id='more' class='btn btn-default'>더보기..</button></h4>";
				$(content).appendTo("#moreLocation");
			}
		});
	});
	
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
//				alert("moreCount = " + moreCount);
//				alert("restaurantId = " + restaurantId);
				alert("current = " + current);
//				alert(args);
			}
		});
	});
	
	
	$(document).on("click", "#more", function(e) {
		moreReview();
	});
})



function addLikeSessionExists() {
	alert("addLikeSessionExists")
}

function addLikeSessionNotExists() {
	alert("addLikeSessionNotExists")
	$("#login").attr('class', 'pull-right nav signin-dd open');
	$("#quick_sign_in").attr('aria-expanded', true);
}
