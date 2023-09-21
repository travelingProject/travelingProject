$(document).ready(function() {
    $.ajax({
        url : "select_user_status.jsp",
        dataType : "html",
        success : function(data) {
            var ugrade = $(data).find("#ugrade").text();
            var uper = $(data).find("#uper").text();
            $('#grade_text').html(ugrade);
            $('#discount_percent').html(uper + "%");
        }
    });
});