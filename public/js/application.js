$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // logoutListener();
  submitListener();
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
	$('#creation').on('click', function(event){
		event.preventDefault();
		// debugger;
	});
};