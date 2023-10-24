$(document).ready(function() {
	const buttons = $(".btn");
	const checkInBtn = $("#check_in_btn");
	const checkOutBtn = $("#check_out_btn");
	const hostinBtn = $("#hosting_btn");
	const emptyReview = $("#empty_review");
	const addStayBtn = $("#add_accomodation_btn");
	const hostId = $('#host_id').val()

	addStayBtn.click(function(e) {				
		$.ajax({
			type : "POST",
			url : "stay_sel.condb?comm=stay_sel",
			data : {
				hostId : hostId
			},
			success : function(result) {
				const data = result.trim();
				console.log(data);
				if(data == "true"){
					alert("하나의 계정당 한개의 숙소만 등록 가능합니다.");
				} else if (data == "false"){
					window.location.href = "add_stay.jsp";
				}								
			},
		});
	});

	buttons.click(function() {
		buttons.not(this).css({
			background : "#fff",
			color : "#000",
		});
		$(this).css({
			background : "#1aa3ff",
			color : "#fff",
		});
	});
});
