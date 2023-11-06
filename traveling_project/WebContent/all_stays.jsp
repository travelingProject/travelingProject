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
		      <div class="price-input">		      	
		        <div class="field">
		          <span>이상</span>		          
		          <span>이하</span>		          
		        </div>		        
		        <div class="field">		          
		          <input type="text" class="input-min" value="0" />
		          <span class="won">₩</span>
		          <div class="separator">-</div>
		          <input type="text" class="input-max" value="500,000" />
		          <span class="won">₩</span>
		        </div>
		      </div>
		      <div class="slider">
		        <div class="progress"></div>
		      </div>
		      <div class="range-input">
		        <input type="range" class="range-min" min="0" max="500000" value="0" step="10000" />
		        <input type="range" class="range-max" min="0" max="500000" value="500000" step="10000" />
		      </div>		      
	      </div>
	      <div id="filter">	      	
	      	<h3>평점</h3>
	      	<input id="rating5" type="checkbox" name="rating"> <label for="rating5">★ 4.5 ~ ★ 5.0</label> <br>
	      	<input id="rating4.5" type="checkbox" name="rating"> <label for="rating4.5">★ 4.0 ~ ★ 4.5</label> <br>
	      	<input id="rating4" type="checkbox" name="rating"> <label for="rating4">★ 3.5 ~ ★ 4.0</label> <br>
	      	<input id="rating3.5" type="checkbox" name="rating"> <label for="rating3.5">★ 3.0 ~ ★ 3.5</label> <br>
	      	<input id="rating3" type="checkbox" name="rating"> <label for="rating3">★ 3.0 이하</label> <br>	      	
	      	<hr>
	      	<h3>무료 서비스</h3>
	      	<input type="checkbox"> 무료 주차 <br>
	      	<input type="checkbox"> 무료 인터넷 <br>
	      	<input type="checkbox"> 무료 취소 <br>
	      	<hr>
	      	<h3>편의 시설</h3>
	      	<input type="checkbox"> 욕조 <br>
	      	<input type="checkbox"> 세탁기 <br>
	      	<input type="checkbox"> 건조기 <br>
	      	<input type="checkbox"> 에어컨 <br>
	      	<input type="checkbox"> 선풍기 <br>
	      	<input type="checkbox"> 난방 <br>
	      	<input type="checkbox"> 수영장 <br>
	      	<input type="checkbox"> 오락실 게임 <br>
	      	<input type="checkbox"> 헬스장 <br>
	      	<input type="checkbox"> 보드게임 <br>
	      	<input type="checkbox"> 바베큐 <br>
	      	<input type="checkbox"> 기본 조리도구 <br>
	      	<hr>
	      	<h3>서비스</h3>
	      	<input type="checkbox"> 아침 식사 <br>
	      	<input type="checkbox"> 청소 서비스 <br>
	      	<input type="checkbox"> 짐 보관 <br>
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
