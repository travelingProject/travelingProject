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
    <link rel="stylesheet" href="css/host_index.css" />
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
    <title>호스트 페이지</title>
  </head>
  <body>
    <%@ include file="host_header.jsp"%>
    <main>
      <h2>호스트 페이지에 오신 것을 환영합니다!</h2>
      <section id="section1" class="clearfix">
        <div>
          <div>
            <h3>숙소 관리</h3>
            <p>
              호스트님의 숙소와 객실의 정보를 입력하고 숙소를 등록할 수 있습니다.<br />
              숙소와 객실의 정보를 수정/삭제 또한 가능합니다.<br />
            </p>
          </div>
        </div>
      </section>
      <section id="section2" class="clearfix">
        <div>
          <div>
            <h3>예약 관리</h3>
            <p>
              예약 관리 페이지에서는 현재까지 예약한 객실과 숙소의 정보와 <br />
              예약을 신청한 손님들의 정보가 조회 가능합니다.
              <br />
              승인 요청을 한 손님들의 예약을 승인/거부 할 수 있습니다.
            </p>
          </div>
        </div>
      </section>
      <section id="section3" class="clearfix">        
        <div>          
          <div>
            <h3>체크인</h3>
            <p>
              예약 승인이 된 객실을 체크인 상태로 변경할 수 있습니다.
              <br />
            </p>
          </div>
        </div>
      </section>
      <section id="section4" class="clearfix">
        <div>
          <div>
            <h3>체크 아웃</h3>
            <p>
              체크아웃이 완료된 객실을 체크아웃 상태로 변경할 수 있습니다.
              <br />
              체크아웃 상태가 되면 매출 현황에 실시간으로 반영 됩니다.
            </p>
          </div>
        </div>
      </section>
      <section id="section3" class="clearfix">
        <div>
          <div>
            <h3>매출 현황을 실시간으로!</h3>
            <p>
              현재까지 고객님의 매출을 실시간으로 조회가 가능합니다.<br />
              일별,주별,월별,연별의 기간별로도 매출을 확인할 수 있습니다.
            </p>
          </div>
        </div>
      </section>
      <section id="section4" class="clearfix">
        <div>
          <h3>고객들의 리뷰를 한눈에!</h3>
          <p>
            리뷰 페이지에는 숙소와 객실별로 손님들의 리뷰를 조회할 수 있고<br />
            리뷰마다 손님들에게 comment도 달 수 있습니다.<br />
            의도적인 악성 리뷰는 신고를 통해 저희 Traveling 고객센터에서
            <br />
            신속하게 처리해드리도록 노력하고 있습니다.
          </p>
        </div>
      </section>
    </main>
	<%@ include file="footer.jsp"%>
  </body>
</html>
