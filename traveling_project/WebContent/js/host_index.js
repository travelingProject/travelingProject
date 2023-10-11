$(document).ready(function() {
    const buttons = $('.btn');
    const checkInBtn = $('#check_in_btn');
    const checkOutBtn = $('#check_out_btn');
    const hostinBtn = $('#hosting_btn');
    const emptyReview = $('#empty_review');

    buttons.click(function() {
        buttons.not(this).css({
            'background': '#fff',
            'color': '#000'
        });
        $(this).css({
            'background': '#1aa3ff',
            'color': '#fff'
        });
    });
    
    checkInBtn.click(function(){    	
    	$.ajax({
    		url:"host_index.condb?comm=hostData",    		
    		dataType:"json",
    		success: function(data){
    			alert('성공');
    		}
    	})
    })
});
