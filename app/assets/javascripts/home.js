$( document ).ready(function() {
//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches

//Bootstrap Datepicker in Order form
var current_date = new Date();
$('#example1').datepicker({
    format: "dd/mm/yyyy",
	startDate: current_date,
	autoclose:true
});

var val = $('#msform').validate({
    onkeyup: false,
    errorClass: "req_mess",
    ignore: ":hidden",
    rules: {
    	fname: {
    		required: true,
    		maxlength: 25,
    		nowhitespace: true
    	},
    	lname: {
    		required: true,
    		maxlength: 25,
    		nowhitespace: true
    	},
    	address1: {
    		maxlength: 75
    	},
    	address2: {
    		maxlength: 75
    	},
        phone: {
            required: true,
            minlength: 10,
            phoneUS: true
        },
        zip: {
        	required: true,
        	minlength: 6,
        	number: true
        }
    },
    messages: {
        phone: {
            required: "Please enter your phone number",
            phoneUS: "Please enter a valid phone number: (e.g. 8888888888 or 9999999999)"
        },
        zip: {
        	number: "Please enter valid zip code"
        }
    }
});
$(".btn-pref .btn").click(function () {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(this).removeClass("btn-default").addClass("btn-primary");   
});

$(".next").click(function(){
if($("#msform").valid()){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	next_fs = $(this).parent().next();
	
	//activate next step on progressbar using the index of next_fs
	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
	
	//show the next fieldset
	next_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale current_fs down to 80%
			scale = 1 - (1 - now) * 0.2;
			//2. bring next_fs from the right(50%)
			left = (now * 50)+"%";
			//3. increase opacity of next_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'transform': 'scale('+scale+')'});
			next_fs.css({'left': left, 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
}
});


$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(event){
	if($("#msform").valid()){
		saveOrder(event);
	}
	
});

function saveOrder(e){
		    e.preventDefault(); // prevent default submit behaviour
            var fname = $('#fname').val();
            var lname = $('#lname').val();
            var phone = $('#phone').val();
            var email = $('#email').val();
            var address1 = $('#address1').val();
            var address2 = $('#address2').val();
            var city = $('#city').val();
            var zip = $('#zip').val();
            var date = $('#example1').val();
            var iron = $('#region_id1').val();
            var wash = $('#region_id2').val();
            var customer = $('#customer').val();
            var object = { 
                            order: 
                                { 'firstname': fname,
                                    'lastname': lname,
                                    'phone': phone,
                                    'pickup_date': date,
                                    'iron' : iron,
                                    'wash_iron' : wash,
                                    'customer_id' : customer,
                                    'status': 'In Progress',
                                    'address_attributes': {
		                                    'address1' :address1,
		                                    'address2' :address2,
		                                    'city' : city,
		                                    'zipcode' : zip
                						}

                                    } 
                                }
            $.ajax({
                type: "POST",
                url:"/api/orders",
                data: object,
                cache: false,
                success: function() {
                    // //clear all fields
                    //$('#msform').trigger("reset");
                	toastr.success('Order Place Succesfully!')
                	window.setTimeout(function(){
                 		window.location.href = '/'  
                  }, 1000);
                    
                },
                error: function() {
                    $('#msform').trigger("reset");
                    $('#myModal').modal('show');
                },

		})
	}
});
function myFunction(e) {
    var search_term = $("#k").val();
    	$.ajax({
		url:"/api/search/"+search_term,
		contentType:"application/json",
		type:"get",
		async: false,
		success:function(response){
			if (response) {
				$('#myModalLabel').empty();
				$('#modal-body').empty();
				
				$('#myModalLabel').append("Available!!");
				$('#modal-body').append("Your area is covered under free Pickup & Delievery Services! Click on Order Now");
				$('#myModal').modal('show');
				$('#search').trigger("reset");
				// $( "#orderNow" ).append("<a class='page-scroll btn btn-primary' href='/orders/new'>Order Now</a>");
			} else {
				$('#myModalLabel').empty();
				$('#modal-body').empty();
				$('#search').trigger("reset");
				$('#myModalLabel').append("Sorry!")
				$('#modal-body').append("Currently we are not Available in this Area. For more details Call Us @ 7276012266");
				$('#myModal').modal('show');
			}
		}
	});
}
function emailUpdate(e) {
	e.preventDefault();
	var id = $("#customer").attr("data-id");
	var email = $("#exampleInputEmail1").val();
	var object = 	{
					    user:
					    { 
					        "email": email
					    }
					}
            $.ajax({
                type: "PUT",
                url:"/api/registrations/"+id,
                data: object,
                cache: false,
                success: function() {
                	$('#customer_name').html(email);
                	toastr.success('Email Updated Succesfully!')
                },
                error: function() {
                	toastr.success('Unable to Update Email!')
                },

		})
}

function addressUpdate(e) {
	e.preventDefault();
	var id = $("#customer").attr("data-id");
	var address1= $("#exampleInputAddress").val();
	var address2= $("#exampleInputAddress2").val();
	var zipcode = $("#zipcode").val();
	var object = {
				    address:
				    { 
				        "address1": address1,
				        "address2": address2,
				        "zipcode": zipcode,
				        "customer_id": id
				    }
	}

			$.ajax({
				type: "PUT",
				url: "/api/addresses/"+id,
				data: object,
				cache: false,
				success: function() {
					toastr.success("Address Updated Succesfully")
				},
				error: function() {
					toastr.success('Unable to Update address!')
				}

			})
}