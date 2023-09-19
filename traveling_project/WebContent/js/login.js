$(document).ready(function () {
  $("#login_btn").click(function (e) {
    const idVal = $('#id').val();
    const pwVal = $('#pw').val();
    if (idVal == '') {
      e.preventDefault();
      $('#match_text_tr').css('display', 'block');
      $('#match_text').html('아이디를 입력해주세요.');
    } else if (pwVal == '') {
      e.preventDefault();      
      $('#match_text').html('비밀번호를 입력해주세요.');
    }
  });
});
