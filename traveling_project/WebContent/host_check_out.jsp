<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/host_header.css" />
    <link rel="stylesheet" href="css/host_check_in.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <!-- favicon -->
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
    <!-- slider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- script -->
    <title>체크 아웃</title>
  </head>
  <body>
	<%@ include file="host_header.jsp"%>
    <main>
      <span class="line1"></span>
      <h2>체크 아웃 전</h2>
      <span class="line2"></span>
      <div class="reservation_info">
        <table>
          <thead>
            <th>예약 번호</th>
            <th>예약자 성함</th>
            <th>숙소 정보</th>
            <th>방 정보</th>
            <th>체크인 날짜</th>
            <th>체크 아웃 날짜</th>
            <th>인원수</th>
            <th>결제 금액</th>
            <th>결제 시간</th>
            <th>예약 상태</th>
          </thead>
          <tr>
            <td>2017163</td>
            <td>이준섭</td>
            <td>레드 펜션</td>
            <td>201호</td>
            <td>2023-08-15</td>
            <td>2023-08-16</td>
            <td>3명</td>
            <td>210,000</td>
            <td>2023-08-10 17:32:27</td>
            <td><input type="button" value="체크인 등록" id="check_in_btn" class="btn"/></td>
          </tr>
        </table>
      </div>
      <span class="line1"></span>
      <h2>체크 아웃 후</h2>
      <span class="line2"></span>
      <span class="line"></span>
      <div class="reservation_info">
        <table>
          <thead>
            <th>예약 번호</th>
            <th>예약자 성함</th>
            <th>숙소 정보</th>
            <th>방 정보</th>
            <th>체크인 날짜</th>
            <th>체크 아웃 날짜</th>
            <th>인원수</th>
            <th>결제 금액</th>
            <th>결제 시간</th>
            <th>예약 상태</th>
          </thead>
          <tr>
            <td>2017163</td>
            <td>이준섭</td>
            <td>레드 펜션</td>
            <td>201호</td>
            <td>2023-08-15</td>
            <td>2023-08-16</td>
            <td>3명</td>
            <td>210,000</td>
            <td>2023-08-10 17:32:27</td>
            <td><input type="button" value="체크인 취소" id="check_out_btn" class="btn"/></td>
          </tr>
        </table>
      </div>
    </main>
    <%@ include file="footer.jsp"%>
  </body>
</html>
