$(document).ready(function() {
    let stdNumber = 1;
    let maxNumber = 1;
    let stdPeopleNum = $('#std_people_number');
    let maxPeopleNum = $('#max_people_number');
    $('#std_decrease_btn').click(function() {
        if (stdNumber > 1) {
            stdNumber--;
            $('#std_people_input').val(stdNumber);
            stdPeopleNum.text(stdNumber);
        }
    });

    $('#std_increase_btn').click(function() {
        if (stdNumber < 15) {
            stdNumber++;
            $('#std_people_input').val(stdNumber);
            stdPeopleNum.text(stdNumber);
        }
    });

    $('#max_decrease_btn').click(function() {
        if (maxNumber > 1) {
            maxNumber--;
            $('#max_people_input').val(maxNumber);
            maxPeopleNum.text(maxNumber);
        }
    });

    $('#max_increase_btn').click(function() {
        if (maxNumber < 15) {
            maxNumber++;
            $('#max_people_input').val(maxNumber);
            maxPeopleNum.text(maxNumber);
        }
    });

    function handleImageChange(input, label, removeBtn) {
        const file = input.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                label.css('background-image', `url(${e.target.result})`);
                label.css('background-size', 'contain');
                label.text('');
                removeBtn.show();
            };
            reader.readAsDataURL(file);
        } else {
            label.css('background', 'url(http://localhost:8080/traveling_project/images/image.png) no-repeat center/60px');
            label.text('이미지를 선택해주세요.');
            removeBtn.hide();
        }
    }

<<<<<<< HEAD
    function handleImageRemoval(input, label, removeBtn) {
        input.val('');
=======
      function handleImageRemoval(input, label, removeBtn) {
        input.val(''); // Clear the file input
>>>>>>> branch 'master' of https://github.com/travelingProject/travelingProject.git
        label.css('background', 'url(http://localhost:8080/traveling_project/images/image.png) no-repeat center/60px');
        label.text('이미지를 선택해주세요.');
        removeBtn.hide();
    }

    for (let i = 1; i <= 10; i++) {
        const fileInput = $(`#image${i}`);
        const fileLabel = $(`#image_label${i}`);
        const removeBtn = $(`#remove_btn${i}`);

        fileInput.change(function() {
            handleImageChange(fileInput[0], fileLabel, removeBtn);
        });

        removeBtn.click(function() {
            handleImageRemoval(fileInput, fileLabel, removeBtn);
        });
    }

    $(window).on("scroll", function() {
        // console.log("Scroll Top:", $(window).scrollTop());
    });

    $('#add_room_btn').click(function(e) {        
        const roomNameVal = $('#room_name').val();
        const contentVal = $('#content').val();
        const priceVal = $('#price').val();
        const stdPeopleVal = $('#std_people_input').val();
        const maxPeopleVal = $('#max_people_input').val();
        var emptyFields = 0;
        console.log(emptyFields);
        $('input[type="file"]').each(function() {
            if ($(this).val() === '') {
                emptyFields++;
            }
        });
        if (roomNameVal == '') {
            e.preventDefault();
            $('#room_name_error_text').show();
            $('html, body').animate({
                scrollTop : 0
            }, 'fast');
            $('#room_name').css('border', '2px solid red');
        } else if (contentVal == '') {
            e.preventDefault();
            $('html, body').animate({
                scrollTop : 0
            }, 'fast');
            $('#content_error_text').show();
            $('#content').css('border', '2px solid red');
            console.log(emptyFields);
        } else if (priceVal == '') {
            e.preventDefault();
            $('html, body').animate({
                scrollTop : 400
            }, 'fast');
            $('#price_error_text').show();
            $('#price').css('border', '2px solid red');
        } else if (emptyFields >= 6) {
            e.preventDefault();
            $("html, body").animate({
                scrollTop : 400
            }, "fast");
            $("#image_text").css("color", "red");
            $("#image_text").css("font-weight", "bold");
            $("#image_th").css("border-right", "2px solid red");
            $("#image_td").css("border", "2px solid red");
            $("#max_people_th").css("border-bottomt", "2px solid red");
        }
    });
    
    $('#room_name').focus(function() {
        $(this).css('border', '2px solid #1aa3ff');
        $('#room_name_error_text').hide();
    });
    
    $('#room_name').blur(function() {
        $(this).css('border', '1px solid #ccc');
        $('#room_name_error_text').hide();
    });

    $('#content').focus(function() {
        $('#content_error_text').hide();
        $(this).css('border', '2px solid #1aa3ff');
    });
    
    $('#content').blur(function() {
        $('#content_error_text').hide();
        $(this).css('border', '1px solid #ccc');
    });
    
    $('#content').focus(function() {
        $('#content_error_text').hide();
        $(this).css('border', '2px solid #1aa3ff');
    });
    
    $('#content').blur(function() {
        $('#content_error_text').hide();
        $(this).css('border', '1px solid #cc');
    });
    
    $('#price').focus(function(){
        $('#price_error_text').hide();
        $(this).css('border','2px solid #1aa3ff');
    });
    
    $('#price').blur(function(){
        $('#price_error_text').hide();
        $(this).css('border','1px solid #ccc');
    });

    $('.image_label').click(function() {
        $('#image_text').css('color', '#1aa3ff');
        $('#image_text').css('font-weight', 'normal');
        $("#image_th").css("border-right", "1px solid #ccc");
        $("#image_td").css("border", "1px solid #ccc");
        $("#max_people_th").css("border-bottom", "1px solid #ccc");        
    });    
});
