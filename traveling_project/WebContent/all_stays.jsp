<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/all_stays.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- script -->    
    <script src="js/all_stays.js"></script>
    <title>예약하기</title>
  </head>
  <body>
    <%@ include file="header.jsp"%>
    <main class="clearfix">
      <aside>
      	<div id="map">
      		<span></span>
      		<p>지도에서 숙소 보기</p>
      	</div>
      	<div id="fee">
      		<h3>1박당 요금</h3>
      		<div>
      			<input type="range" id="input_left" min="1" max="101" value="1" step="10"/>
      			<input type="range" id="input_right" min="1" max="101" value="101" step="10"/>
      			<div class="track">
      				<div class="range"></div>      			
      				<div id="left_thumb" class="thumb"></div>      			
      				<div id="right_thumb" class="thumb"></div>
      			</div>      			
      		</div>
      	</div>      	
      </aside>
      <section id="accomodation_info" class="clearfix">
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image1.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image2.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image3.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image4.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image5.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image6.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image7.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image8.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image9.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image10.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image11.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <div class="accomodation">
          <a href="#">
            <div>
              <img src="images/accomodation_near_me_image12.jpg" alt="" />
            </div>
            <h2>야외풀 노천스파 오션뷰</h2>
            <span>4.78(32)</span>
            <p>경기/가평</p>
            <p>₩ 320,000 ~</p>
            <p>숙소 이름</p>
          </a>
        </div>
        <span>더보기</span>
      </section>      
    </main>
    <div class="go_top"></div>
    <%@ include file="footer.jsp"%>    
  </body>
</html>
