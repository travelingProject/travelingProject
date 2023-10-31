<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />  
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />    
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
    <!-- script -->        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>    
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>   
    <script src="js/header.js"></script>
    <script src="js/main.js"></script>
    <title>Traveling</title>
  </head>
<body>
    <header>
      <nav id="menu_nav">
        <h1 id="logo">
          <a href="index.jsp"><img src="images/logo.png" alt="" /></a>
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