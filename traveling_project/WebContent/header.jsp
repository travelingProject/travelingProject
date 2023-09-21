<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />    
    <!-- favicon -->
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />    
    <!-- script -->    
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="js/header.js"></script>
    <title>Traveling</title>
  </head>
<body>
    <header>
      <nav id="menu_nav">
        <h1 id="logo">
          <a href="user_index.jsp"><img src="images/logo.png" alt="" /></a>
        </h1>
        <form action="reservation.jsp" id="accomodation_search">
          <input type="text" name="region" id="region" required placeholder="어디로 떠나시나요?" />
          <input type="date" name="check_in_date" id="check_in_date" data-placeholder="체크인" required aria-required="true" />
          <input type="date" name="check_out_date" id="check_out_date" data-placeholder="체크 아웃" required aria-required="true" />
          <input type="number" name="people_num" id="people_num" required placeholder="인원 수를 입력해주세요." max="32" min="1" />
          <input id="search_btn" type="submit" value="검색하기" />
        </form>
        <div class="right_menu">
          <a href="#" class="ir_pm">내 정보</a>
          <a href="#" class="ir_pm">언어 선택</a>
          <a href="#" class="ir_pm">고객 센터</a>
        </div>
        <ul id="my_info">
          <li><a href="login_select.jsp">로그인</a></li>
          <li><a href="signup_select.jsp">회원 가입</a></li>
        </ul>
      </nav>
    </header>
</body>
</html>