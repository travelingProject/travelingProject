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

var sel_files = [];
var selectedFiles;
var attZone;
/* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
(imageView = function imageView(att_zone, btn) {
  attZone = document.getElementById(att_zone);
  var btnAtt = document.getElementById(btn);
  var errorText = document.getElementById('file_error_text');  

  // 이미지와 체크 박스를 감싸고 있는 div 속성
  var div_style = "display:inline-block;position:relative;" + "width:18%;height:120px;margin:1%;border:1px solid #ccc;z-index:1";
  // 미리보기 이미지 속성
  var img_style = "width:100%;height:100%;z-index:none";
  // 이미지안에 표시되는 체크박스의 속성
  var chk_style =
    "width:20px;height:20px;position:absolute;right:5px;bottom:5px;font-size:20px;line-height:1;border:0;border-radius:100%;" +
    "z-index:999;background-color:rgba(255,255,255,.7);color:#f00";
  
  btnAtt.addEventListener("change",function(e){
	  	var files = e.target.files;
		selectedFiles = e.target.files.length;
		attZone = document.getElementById("att_zone");
		
		if(selectedFiles < 3){						
			attZone.innerText = "이미지는 최소 3장 이상 등록해주세요.";
			attZone.style.color = "red";
		} else if (selectedFiles > 5){				
			attZone.innerText = "이미지는 최대 5장까지 등록할 수 있습니다.";
			attZone.style.color = "red";
		} else{
			attZone.innerText = "";
			var fileArr = Array.prototype.slice.call(files);
		    for (f of fileArr) {
		      imageLoader(f);
		    }		
		}	      
  });

    /* 첨부된 이미리즐을 배열에 넣고 미리보기 */
  imageLoader = function (file) {
    sel_files.push(file);
    var reader = new FileReader();
    reader.onload = function (ee) {
      let img = document.createElement("img");
      img.setAttribute("style", img_style);
      img.src = ee.target.result;
      attZone.appendChild(makeDiv(img, file));
    };

    reader.readAsDataURL(file);
  };

  /* 첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
  makeDiv = function (img, file) {
    var div = document.createElement("div");
    div.setAttribute("style", div_style);

    var btn = document.createElement("input");
    btn.setAttribute("type", "button");
    btn.setAttribute("class", "remove_btn");
    btn.setAttribute("value", "-");
    btn.setAttribute("delFile", file.name);
    btn.setAttribute("style", chk_style);
    btn.onclick = function (ev) {
      selectedFiles--;
      if(selectedFiles == 0){
    	  attZone.innerText = "이미지는 최소 3장 최대 5장까지 선택할 수 있습니다.";
      }
      var ele = ev.srcElement;
      var delFile = ele.getAttribute("delFile");      
      for (var i = 0; i < sel_files.length; i++) {
        if (delFile == sel_files[i].name) {
          sel_files.splice(i, 1);
        }
      }

      dt = new DataTransfer();
      for (f in sel_files) {
        var file = sel_files[f];
        dt.items.add(file);
      }
      btnAtt.files = dt.files;
      var p = ele.parentNode;
      attZone.removeChild(p);
    };
    div.appendChild(img);
    div.appendChild(btn);
    return div;
  };
})("att_zone", "btnAtt");

// "전체 삭제" 버튼을 클릭했을 때 모든 파일 미리보기와 선택된 파일을 삭제하는 함수
function deleteAllFiles() {
  // 모든 파일 미리보기를 포함하는 div 요소들을 가져옵니다.
  var fileDivs = document.querySelectorAll("#att_zone > div");
  attZone = document.getElementById("att_zone");
  attZone.innerText = "이미지는 최소 3장 최대 5장까지 선택할 수 있습니다.";
  attZone.style.color = "#999";

  // 각 파일 미리보기와 선택된 파일을 삭제합니다.
  for (var i = 0; i < fileDivs.length; i++) {
    var fileDiv = fileDivs[i];
    var fileName = fileDiv.querySelector("input[type='button']").getAttribute("delFile");

    // 선택된 파일 목록(sel_files)에서도 삭제합니다.
    for (var j = 0; j < sel_files.length; j++) {
      if (fileName == sel_files[j].name) {
        sel_files.splice(j, 1);
        break; // 파일을 찾았으면 루프 종료
      }
    }

    // HTML에서 해당 div 요소를 삭제합니다.
    fileDiv.parentNode.removeChild(fileDiv);
  }

  // 파일 input 태그를 초기화합니다.
  var dt = new DataTransfer();
  btnAtt.files = dt.files;
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
	    $("#sample5_address").css("border", "1px solid #ccc");
	    $("#addr_text").css("display", "none");
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
	      $("#stay_name").css("border", "2px solid red");
	      $("#stay_name_text").css("display", "block");
	    } else if ($("#sample5_address").val() == "") {
	      e.preventDefault();
	      $("#sample5_address").css("border", "2px solid red");
	      $("#addr_text").css("display", "block");
	    } else if ($("#host_phone").val() == "") {
	      e.preventDefault();
	      $("#host_phone").css("border", "2px solid red");
	      $("#phone_text").css("display", "block");
	    }
	  });
	  $('#file_delete_all').click(function(){
		  $('#btnAtt').val('');
	  })	  
	});

