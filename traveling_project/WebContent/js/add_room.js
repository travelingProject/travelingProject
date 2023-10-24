    $(document).ready(function () {
      var stdNumber = 1;
      var maxNumber = 1;
      var stdPeopleNum = $("#std_people_number");
      var maxPeopleNum = $("#max_people_number");
      $("#std_decrease_btn").click(function () {
        if (stdNumber > 1) {
          stdNumber--;
          $("#std_people_input").val(stdNumber);
          stdPeopleNum.text(stdNumber);
        }
      });

      $("#std_increase_btn").click(function () {
        if (stdNumber < 15) {
          stdNumber++;
          $("#std_people_input").val(stdNumber);
          stdPeopleNum.text(stdNumber);
        }
      });

      $("#max_decrease_btn").click(function () {
        if (maxNumber > 1) {
        	maxNumber--;
          $("#max_people_input").val(maxNumber);
          maxPeopleNum.text(maxNumber);
        }
      });

      $("#max_increase_btn").click(function () {
        if (maxNumber < 15) {
        	maxNumber++;
          $("#max_people_input").val(maxNumber);
          maxPeopleNum.text(maxNumber);
        }
      });
      
    //Function to handle image input change
      function handleImageChange(input, label, removeBtn) {
        const file = input.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            label.css('background-image', `url(${e.target.result})`);
            label.css('background-size', 'contain');
            label.text('');
            removeBtn.show();
          };
          reader.readAsDataURL(file);
        } else {
          label.css('background', 'url(http://localhost:8080/traveling_project/images/image.png) no-repeat center/60px'); // Reset the label background
          label.text('이미지를 선택해주세요.');
          removeBtn.hide(); // Hide the "Remove Image" button
        }
      }

      function handleImageRemoval(input, label, removeBtn) {
        input.val(''); // Clear the file input
        label.css('background', 'url(http://localhost:8080/traveling_project/images/image.png) no-repeat center/60px');
        label.text('이미지를 선택해주세요.');
        removeBtn.hide(); // Hide the "Remove Image" button
      }

      // Attach event handlers for all images and remove buttons
      for (let i = 1; i <= 10; i++) {
        const fileInput = $(`#image${i}`);
        const fileLabel = $(`#image_label${i}`);
        const removeBtn = $(`#remove_btn${i}`);

        fileInput.change(function () {
          handleImageChange(fileInput[0], fileLabel, removeBtn);
        });

        removeBtn.click(function () {
          handleImageRemoval(fileInput, fileLabel, removeBtn);
        });
      };      
    });           