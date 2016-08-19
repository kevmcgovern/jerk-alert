$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // logoutListener();
  submitListener();
  newListener();
  queryExplanationListener();
});

var logoutListener = function(){
	$('#logout').on('click', function(event){
		event.preventDefault();
		var address = $(this).attr('href');
		var verb = "Post";
		var method = "Delete";
		var that = $(this);
		// debugger;
		var request = $.ajax({
			url: address, 
			type: method
		});
		request.done(function(responseData){
			console.log(responseData);
			alert("It worked... now what?");
		});
		request.fail(function(responseData){
			console.log(responseData);
			alert("Something went horribly wrong");
		});
	});
};

var submitListener = function (){
	$('.prepend').on('submit', '.creation', function(event){
		event.preventDefault();
		var that = $(this);
		var address = $(this).attr('action');
		var verb = $(this).attr('method');
		var postData = $(this).serialize();
		var request = $.ajax({
			url: address,
			type: verb, 
			data: postData
		});
		// debugger;
		request.done(function(responseData){
			// console.log("I can't believe that worked");
			// console.log(responseData);
			// debugger;
			$('.prepend').prepend(responseData);
		});
		request.fail(function(responseData){
			// console.log(responseData);
			// debugger;
			alert("Something went terribly wrong");
		});
	});
};

var newListener = function(){
	$('.ajax-form').on('click', function(event){
		event.preventDefault();
		that = $(this);
		// debugger;
		var address = $(this).attr('href');
		var verb = 'GET';
		var request = $.ajax({
			url: address, 
			type: verb
		});
		request.done(function(responseData){
			$('#form-container').html(responseData);
		});
		request.fail(function(responseData){
			alert("There was an error processing your request");
			// console.log(responseData);
		});
	});
};

var queryExplanationListener = function(){
	$('.prepend').on('click', '.sub-header', function(event){
		event.preventDefault();
		// debugger;
		var that = $(this);
		var address = that.find('a').attr('href');
		var verb = "GET";
		var request = $.ajax({
			url: address,
			type: verb
		});
		request.done(function(responseData){
			console.log(responseData);
			// debugger;
			if ($('.explanation-container').html() !== "" && $('.explanation-container').css('display') === 'block') {
				$('.explanation-container').css('display', 'none');
			} else if ($('.explanation-container').html() !== "" && $('.explanation-container').css('display') === 'none') {
				$('.explanation-container').css('display', 'block');
			} else {
				$('.explanation-container').html(responseData);
			}
		});
		request.fail(function(responseData){
			alert("There was an error processing your request");
		});
	});
};