$(document).ready(function () { 
	
  //모든 공백 체크 정규식
  const empJ = /\s/g;
  //아이디 정규식
  const idJ = /^[a-z0-9]{8,20}$/;
  // 비밀번호 정규식
  const pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
  // 이름 정규식
  const nameJ = /^[가-힣]{2,6}$/;
  // 이메일 검사 정규식
  const emailJ = /^[a-zA-Z0-9]+$/;
  // 휴대폰 번호 정규식
  const phoneJ = /^\d{3}-?\d{3,4}-?\d{4}$/;
  // 사업자 등록번호 정규식
  const businessNumJ1 = /^[0-9]{3}$/;
  const businessNumJ2 = /^[0-9]{2}$/;
  const businessNumJ3 = /^[0-9]{5}$/;

  // 아이디 확인 함수
  function id() {
    const user_id = $("#id").val();
    $("#id").css("border", "2px solid red");
    $.ajax({
      type: "POST",
      url: "check_id.jsp", // 중복 확인을 처리하는 JSP 페이지
      data: {
        user_id: user_id,
      },
      success: function (result) {
        const data = result.trim();
        if (data == "true") {
          $("#id_text").html("중복된 아이디입니다. 다시 입력해주세요.");
          $("#id_text").css("color", "red");
          $("#id").css("border", "2px solid red");
        } else if (data == "false") {
          if (idJ.test(user_id) && !empJ.test(user_id)) {
            $("#id_text").css("color", "#1aa3ff");
            $("#id_text").html("사용가능한 아이디 입니다.");
            $("#id").css("border", "2px solid #1aa3ff");
          } else {
            $("#id_text").html("특수문자를 제외한 8~20자의 영문과 숫자로 입력해주세요.");
            $("#id").css("border", "2px solid red");
            $("#id").css("border", "2px solid red");
          }
        }
      },
    });
  }

  // 비밀번호 함수
  function password() {
    const user_pw = $("#pw").val();
    if (!pwJ.test(user_pw)) {
      $("#pw_text").html("공백을 제외한 8~16자의 영문 대/소문자+숫자+특수문자 조합으로 입력해주세요.");
      $("#pw_text").css("color", "red");
      $("#pw").css("border", "2px solid red");
    } else {
      $("#pw").css("border", "2px solid #1aa3ff");
      $("#pw_text").html("사용 가능한 비밀번호입니다.");
      $("#pw_text").css("color", "#1aa3ff");
    }
  }

  // 비밀번호 확인 함수
  function pwCheck() {
    const pw_check = $("#pw_check").val();
    const user_pw = $("#pw").val();

    if (pw_check == "") {
      $("#pw_check_text").html("비밀번호를 확인해주세요.");
      $("#pw_check").css("border", "2px solid red");
    } else if (pw_check == user_pw) {
      $("#pw_check_text").html("비밀번호가 동일합니다.");
      $("#pw_check_text").css("color", "#1aa3ff");
      $("#pw_check").css("border", "2px solid #1aa3ff");
    } else {
      $("#pw_check_text").html("비밀번호가 일치하지 않습니다.");
      $("#pw_check_text").css("color", "red");
      $("#pw_check").css("border", "2px solid red");
    }
  }

  // 이름 확인 함수
  function nameCheck() {
    const user_name = $("#name").val();
    if (!nameJ.test(user_name)) {
      $("#name_text_td").css("display", "block");
      $("#name_text").html("이름을 올바르게 입력해주세요.");
      $("#name").css("border", "2px solid red");
    } else {
      $("#name_text_td").css("display", "none");
      $("#name").css("border", "2px solid #1aa3ff");
      $("#name_text").hide();
    }
  }

  // 통신사 td 숨기기
  $("#agency_text_td").hide();

  $('#agency_td').click(function(){
    $(this).children().first().css('border','0');
  })

  // 통신사 체크 유무 함수
  function agencyCheck() {
    const checkedAgency = $("input[name='news_agency']:checked");
    if (checkedAgency.length === 0) {
      $("#agency_text").html("통신사를 선택해주세요.");
      $("#agency_text_td").show();
    } else {
      $("#agency_text_td").hide();
    }
  }

  // 전화번호 확인 함수
  function phoneCheck() {
    const phoneValue = $("#phone").val();
    if (!phoneJ.test(phoneValue)) {
      $("#phone").css("border", "2px solid red");
      $("#phone_text").show();
      $("#phone_text").html('" - "를 제외한 전화번호 11자리를 입력해주세요');
    } else {
      $("#phone").css("border", "2px solid #1aa3ff");
      $("#phone_text").hide();
    }
  }

  // 이메일 확인 함수
  function emailCheck() {
    const emailValue = $("#email").val();
    if (!emailJ.test(emailValue)) {
      $("#email").css("border", "2px solid red");
      $("#email_text").show();
      $("#email_text").html("올바른 이메일 형식을 입력해주세요.");
    } else {
      $("#email_text").hide();
      $("#email").css("border", "2px solid #1aa3ff");
    }
  }

  $("#birth_year").blur(function(){
    $(this).css("border","2px solid #1aa3ff");
  })
  $("#birth_month").blur(function(){
    $(this).css("border","2px solid #1aa3ff");
  })
  $("#birth_day").blur(function(){
    $(this).css("border","2px solid #1aa3ff");
  })

  // 생년월일 확인 함수
  function birthCheck() {
    const birthYear = $("#birth_year").val();
    const birthMonth = $("#birth_month").val();
    const birthDay = $("#birth_day").val();
    if (!birthYear || !birthMonth || !birthDay) {
      $("#birth_text").show();
      $("#birth_text").html("생년월일을 선택해주세요.");
    } else {
      $("#birth_text").hide();
    }
  }

  // 주소 확인 함수
  function addrCheck() {
    const postcode = $("#sample4_postcode").val();
    const roadAddr = $("#sample4_roadAddress").val();
    const jibunAddr = $("#sample4_jibunAddress").val();
    const extraAddr = $("#sample4_extraAddress").val();
    if (postcode == "" || roadAddr == "" || jibunAddr == "" || extraAddr == "") {
      $("#addr_text").show();
      $("#addr_text").html("주소를 입력해주세요.");
    } else {
      $("#addr_text").hide();
    }
  }

  // 아이디 중복 처리 & 유효성 검사
  $("#id").blur(function () {
    id();
  });

  // 비밀번호 유효성 검사
  $("#pw").blur(function () {
    password();
  });

  // 비밀번호 확인
  $("#pw_check").blur(function () {
    pwCheck();
  });

  // 이름 유효성 검사
  $("#name").blur(function () {
    nameCheck();
  });

  // 통신사 확인
  $("input[name='news_agency']").on("change", function () {
    $("#agency_text_td").hide();
  });

  // 전화번호 유효성 검사
  $("#phone").blur(function () {
    phoneCheck();
  });

  // 사업자 등록번호 유효성 검사
  $(".business_num").blur(function () {    
    const businessNum1 = $("#business_num1").val();
    const businessNum2 = $("#business_num2").val();
    const businessNum3 = $("#business_num3").val();
    if (!businessNumJ1.test(businessNum1) || !businessNumJ2.test(businessNum2) || !businessNumJ3.test(businessNum3)) {
        $("#business_num_text").show();
        $("#business_num_text").html("사업자 등록번호를 올바르게 입력해주세요.");
    } else {
        $("#business_num_text").hide();
    }    
  });

  // 이메일 유효성 검사
  $("#email").blur(function () {
    emailCheck();
  });

  // 생년월일 경고 메시지
  $("#birth_text").hide();

  $("#email_address").blur(function () {
    var selectedOption = $(this).val();
    if (selectedOption) {
      $(this).css("border", "2px solid #1aa3ff");
    } else {
      $(this).css("border", "");
    }
  });

  $("#addr_text").hide();

  $("#post_search_btn").click(function(){
    $("#addr_text").hide();
    $("#sample4_postcode").css('border','1px solid #999');
      $("#sample4_roadAddress").css('border','1px solid #999');
      $("#sample4_jibunAddress").css('border','1px solid #999');
      $("#sample4_detailAddress").css('border','1px solid #999');
      $("#sample4_extraAddress").css('border','1px solid #999');
  })

  // scrollTop 함수
  function goTop() {
    $(window).scrollTop(280);
  }

  // 회원가입 버튼 클릭
  $("#sign_up_btn").click(function (e) {    
    const user_id = $("#id").val();
    const user_pw = $("#pw").val();
    const pw_check = $("#pw_check").val();
    const user_name = $("#name").val();
    const checkedAgency = $("input[name='news_agency']:checked");
    const phoneValue = $("#phone").val();
    const emailValue = $("#email").val();
    const birthYear = $("#birth_year").val();
    const birthMonth = $("#birth_month").val();
    const birthDay = $("#birth_day").val();
    const postcode = $("#sample4_postcode").val();
    const roadAddr = $("#sample4_roadAddress").val();
    const jibunAddr = $("#sample4_jibunAddress").val();
    const extraAddr = $("#sample4_extraAddress").val();

    // 아이디 체크
    $("#id").css("border", "2px solid red");
    $.ajax({
      type: "POST",
      url: "check_id.jsp", // 중복 확인을 처리하는 JSP 페이지
      data: {
        user_id: user_id,
      },
      success: function (result) {
        const data = result.trim();
        if (data == "true") {
          $("#id_text").html("중복된 아이디입니다. 다시 입력해주세요.");
          $("#id").css("border", "2px solid red");
        } else if (data == "false") {
          if (idJ.test(user_id) && !empJ.test(user_id)) {
            $("#id_text").css("color", "#1aa3ff");
            $("#id_text").html("사용가능한 아이디 입니다.");
            $("#id").css("border", "2px solid #1aa3ff");
          } else {
            $("#id_text").html("특수문자를 제외한 8~20자의 영문과 숫자로 입력해주세요.");
            $("#id").css("border", "2px solid red");
          }
        }
      },
    });

    // 비밀번호 체크
    if (!pwJ.test(user_pw)) {
      $("#pw_text").html("공백을 제외한 8~16자의 영문 대/소문자+숫자+특수문자 조합으로 입력해주세요.");
      $("#pw_text").css("color", "red");
      $("#pw").css("border", "2px solid red");
      e.preventDefault();
    } else {
      $("#pw").css("border", "2px solid #1aa3ff");
      $("#pw_text").html("사용 가능한 비밀번호입니다.");
      $("#pw_text").css("color", "#1aa3ff");
    }

    // 비밀번호 확인 체크
    if (pw_check == "") {
      e.preventDefault();
      goTop();
      $("#pw_check_text").html("비밀번호를 확인해주세요.");
      $("#pw_check").css("border", "2px solid red");
    } else if (pw_check == user_pw) {
      $("#pw_check_text").html("비밀번호가 동일합니다.");
      $("#pw_check_text").css("color", "#1aa3ff");
      $("#pw_check").css("border", "2px solid #1aa3ff");
    } else {
      e.preventDefault();
      goTop();
      $("#pw_check_text").html("비밀번호가 일치하지 않습니다.");
      $("#pw_check_text").css("color", "red");
      $("#pw_check").css("border", "2px solid red");
      e.preventDefault();
    }

    // 이름 체크
    if (!nameJ.test(user_name)) {
      e.preventDefault();
      goTop();
      $("#name_text_td").css("display", "block");
      $("#name_text").html("이름을 올바르게 입력해주세요.");
      $("#name").css("border", "2px solid red");
    } else {
      $("#name_text_td").css("display", "none");
      $("#name").css("border", "2px solid #1aa3ff");
      $("#name_text").hide();
    }

    // 통신사 체크
    if (checkedAgency.length === 0) {
      e.preventDefault();
      goTop();
      $("#agency_text").html("통신사를 선택해주세요.");
      $("#agency_text_td").show();
      $('#agency_td div').css('border','2px solid red');
    } else {
      $("#agency_text_td").hide();      
    }

    // 전화번호 체크
    if (!phoneJ.test(phoneValue)) {
      e.preventDefault();
      goTop();
      $("#phone").css("border", "2px solid red");
      $("#phone_text").show();
      $("#phone_text").html('" - "를 제외한 전화번호 11자리를 입력해주세요');
    } else {
      $("#phone").css("border", "2px solid #1aa3ff");
      $("#phone_text").hide();
    }

    // 이메일 체크
    if (!emailJ.test(emailValue)) {
      e.preventDefault();
      goTop();
      $("#email").css("border", "2px solid red");
      $("#email_text").show();
      $("#email_text").html("올바른 이메일 형식을 입력해주세요.");
    } else {
      $("#email_text").hide();
      $("#email").css("border", "2px solid #1aa3ff");
    }

    // 생년월일 체크
    if (!birthYear || !birthMonth || !birthDay) {
      e.preventDefault();
      goTop();
      $("#birth_text").show();
      $("#birth_text").html("생년월일을 선택해주세요.");      
    } else {
      $("#birth_text").hide();
    }

    // 주소 체크
    if (postcode == "" || roadAddr == "" || jibunAddr == "" || extraAddr == "") {
      e.preventDefault();
      goTop();
      $("#addr_text").show();
      $("#addr_text").html("주소를 입력해주세요.");
      $("#sample4_postcode").css('border','2px solid red');
      $("#sample4_roadAddress").css('border','2px solid red');
      $("#sample4_jibunAddress").css('border','2px solid red');
      $("#sample4_detailAddress").css('border','2px solid red');
      $("#sample4_extraAddress").css('border','2px solid red');
    } else {
      $("#addr_text").hide();
    }
  });
});

// 주소 검색 API
function sample4_execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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

      var guideTextBox = document.getElementById("guide");
      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if (data.autoRoadAddress) {
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        guideTextBox.innerHTML = "(예상 도로명 주소 : " + expRoadAddr + ")";
        guideTextBox.style.display = "block";
      } else if (data.autoJibunAddress) {
        var expJibunAddr = data.autoJibunAddress;
        guideTextBox.innerHTML = "(예상 지번 주소 : " + expJibunAddr + ")";
        guideTextBox.style.display = "block";
      } else {
        guideTextBox.innerHTML = "";
        guideTextBox.style.display = "none";
      }

      
    },
  }).open();
}
