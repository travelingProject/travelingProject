var mapContainer = document.getElementById("map"), // 지도를 표시할 div
  mapOption = {
    center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을
    // 추가하세요
    level: 5, // 지도의 확대 레벨
  };
// 지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, "center_changed", function () {
  // 지도의 레벨을 얻어옵니다
  var level = map.getLevel();
  // 지도의 중심좌표를 얻어옵니다
  var latlng = map.getCenter();
  var latitude = latlng.getLat();
  var longitude = latlng.getLng();
  document.getElementById("latitudeInput").value = latitude;
  document.getElementById("longitudeInput").value = longitude;
});
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();
// 지도 타입 컨트롤을 지도에 표시합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();
// 마커를 미리 생성
var marker = new daum.maps.Marker({
  position: new daum.maps.LatLng(33.450701, 126.570667),
  map: map,
});

function sample5_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      var addr = data.address; // 최종 주소 변수
      // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var roadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ""; // 참고 항목 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if (data.buildingName !== "" && data.apartment === "Y") {
        extraRoadAddr += extraRoadAddr !== "" ? ", " + data.buildingName : data.buildingName;
      }
      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if (extraRoadAddr !== "") {
        extraRoadAddr = " (" + extraRoadAddr + ")";
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("sample4_postcode").value = data.zonecode;
      document.getElementById("sample4_roadAddress").value = roadAddr;
      document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

      // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
      if (roadAddr !== "") {
        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
      } else {
        document.getElementById("sample4_extraAddress").value = "";
      }
      // 주소로 상세 정보를 검색
      geocoder.addressSearch(data.address, function (results, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === daum.maps.services.Status.OK) {
          var result = results[0]; // 첫번째 결과의 값을 활용

          // 해당 주소에 대한 좌표를 받아서
          var coords = new daum.maps.LatLng(result.y, result.x);
          // 지도를 보여준다.
          mapContainer.style.display = "block";
          map.relayout();
          // 지도 중심을 변경한다.
          map.setCenter(coords);
          // 마커를 결과값으로 받은 위치로 옮긴다.
          marker.setPosition(coords);
        }
      });
    },
  }).open();
}

// 유효성 검사 jquery
$(document).ready(function () {
  $("#stay_name").blur(function () {
    if ($("#stay_name").val() == "") {
      $("#stay_name").css("border", "2px solid red");
      $("#stay_name_text").css("display", "block");
    } else {
      $("#stay_name").css("border", "1px solid #ccc");
      $("#stay_name_text").css("display", "none");
    }
  });

  $("#addr_search").click(function () {
	  $("#sample4_postcode").css("border", "1px solid #ccc");
      $("#sample4_roadAddress").css("border", "1px solid #ccc");
      $("#sample4_jibunAddress").css("border", "1px solid #ccc");
      $("#sample4_detailAddress").css("border", "1px solid #ccc");
      $("#sample4_extraAddress").css("border", "1px solid #ccc");
    $("#addr_text").hide();
  });

  $("#host_phone").blur(function () {
    const phoneJ = /^01[016789]\d{3,4}\d{5}$/;
    const phoneValue = $("#host_phone").val();
    if (!phoneJ.test(phoneValue)) {
      $("#host_phone").css("border", "2px solid red");
      $("#phone_text").css("display", "block");
    } else {
      $("#host_phone").css("border", "1px solid #ccc");
      $("#phone_text").css("display", "none");
    }
  });

  $("#add_btn").click(function (e) {
    if ($("#stay_name").val() == "") {
      e.preventDefault();
      $('html, body').animate({ scrollTop: 0 }, 'fast');
      $("#stay_name").css("border", "2px solid red");
      $("#stay_name_text").css("display", "block");
    } else if ($("#sample4_postcode").val() == "") {
      e.preventDefault();
      $('html, body').animate({ scrollTop: 222 }, 'fast');
      $("#sample4_postcode").css("border", "2px solid red");
      $("#sample4_roadAddress").css("border", "2px solid red");
      $("#sample4_jibunAddress").css("border", "2px solid red");
      $("#sample4_detailAddress").css("border", "2px solid red");
      $("#sample4_extraAddress").css("border", "2px solid red");
      $("#addr_text").css("display", "block");
    } else if ($("#host_phone").val() == "") {
      e.preventDefault();
      $("#host_phone").css("border", "2px solid red");
      $("#phone_text").css("display", "block");
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

  // Function to handle image removal
  function handleImageRemoval(input, label, removeBtn) {
    input.val(''); // Clear the file input
    label.css('background', 'url(http://localhost:8080/traveling_project/images/image.png) no-repeat center/60px'); // Reset the label background
    label.text('이미지를 선택해주세요.');
    removeBtn.hide(); // Hide the "Remove Image" button
  }

  // Attach event handlers for all images and remove buttons
  for (let i = 1; i <= 5; i++) {
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


