$( document ).ready(function() {


});

function myFunction(e) {
	e.preventDefault();
    var search_term = $("#k").val(); 
    	$.ajax({
		url:"/api/search/"+search_term,
		contentType:"application/json",
		type:"get",
		async: false,
		success:function(response){
			if (response) {
				alert("order Form")
			} else {
				$('#myModal').modal('show');
			}
		}
	});
}

