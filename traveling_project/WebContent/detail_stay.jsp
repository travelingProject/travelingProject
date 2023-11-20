<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
<style> <!-- 나눔고딕 폰트 -->
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/detail_stay.css">
<!-- js -->
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- 숙소 정보 -->
	<section class="detail-stay-info">
		<div class="stay-info-wrap">
			<div class="stay-info-image">
				<img alt="숙소 이미지" src="images/trash.jpg" width="640px" height="432px">
			</div>
			<div class="stay-info-text">
				<div class="text-stay-name">
					<h1>금문도</h1>
				</div>
				<div class="text-stay-content">
					<p>지구 최악의 중국집</p>
				</div>
				<div class="text-stay-amenity">
					<h3>편의시설</h3>
					<div class="stay-amenity-content">
						<p class="amenity-bath"><b>욕실 : </b><span>욕조, 샤워 용품, 헤어 드라이어</span></p>
						<p class="amenity-bedroom"><b>침실 및 세탁 시설 : </b><span>수건, 침구류, 세탁기, 건조기</span></p>
						<p class="amenity-entertainment"><b>엔터테인먼트 : </b><span>수영장, 오락실 게임, 헬스장, TV, 보드게임</span></p>
						<p class="amenity-aircontrol"><b>냉난방 : </b><span>에어컨, 선풍기, 난방</span></p>
						<p class="amenity-safety"><b>숙소 안전 : </b><span>일산화탄소 경보기, 소화기, 구급상자, 화재 경보기</span></p>
						<p class="amenity-internet"><b>인터넷 및 업무 공간 : </b><span>업무 전용 공간, 무선 인터넷</span></p>
						<p class="amenity-dining"><b>주방 및 식당 : </b><span>바베큐 도구, 기본 조리도구, 식탁, 식기류, 냉장고, 전자레인지, 전기밥솥, 가스레인지 또는 인덕션</span></p>
						<p class="amenity-parking"><b>주차 : </b><span>전기차 충전시설, 주차장</span></p>
						<p class="amenity-service"><b>서비스 : </b><span>아침 식사, 청소 서비스, 짐 보관</span></p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 리뷰 -->
	<section class="detail-stay-review">
		<span>REVIEW</span>
		<div class="stay-review-wrap">
			<div class="stay-review-avg">
				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5.0" disabled />
					<label for="5-stars" class="star">★</label>
					<input type="radio" id="4-stars" name="rating" value="4.0" disabled />
					<label for="4-stars" class="star">★</label>
					<input type="radio" id="3-stars" name="rating" value="3.0" disabled />
					<label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rating" value="2.0" disabled />
					<label for="2-stars" class="star">★</label>
					<input type="radio" id="1-star" name="rating" value="1.0" disabled checked />
					<label for="1-star" class="star">★</label>
				</div>
			</div>
			<div class="stay-review-content-wrap">
				<div class="stay-review-image">
					<img alt="리뷰 이미지" src="images/trash.jpg" width="128px" height="128px">
				</div>
				<div class="stay-review-content">
					<div class="review-writter">
						<h3>yoonsumin</h3>
						<span class="review-writter-star">★ 1.0</span>
					</div>
					<div class="review-content-wrap">
						<div class="review-title">
							<h3>최악의 중국집..</h3>
						</div>
						<div class="review-content">
							<h5>인생의 90%를 손해봤습니다.. 여길 가서요.. 가지 말라고 하고 싶은데 이미 망했더라구요... 꼴이좋아</h5>
						</div>											
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 객실 예약 -->
	<section class="detail-stay-room">
		<span>ACCOMODATION</span>
		<ul class="room-list">
			<li class="room-item" data-room_id="1">
				<div class="room-item-wrap">
					<div class="room-item-image">
						<img alt="객실 이미지" src="images/pop_image2.jpg" height="256px" width="512px">
					</div>
					<div class="room-item-info">
						<div class="room-info-name">
							<h2>루마니아 뷰 룸</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-content">
									<h4>방 소개</h4>
									<span>이 아름다운 루마니아 뷰 룸에서 편안한 휴식을 즐기세요.</span>
								</li>
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>4명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>6명</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 120,000 ~</span>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li class="room-item" data-room_id="2">
				<div class="room-item-wrap">
					<div class="room-item-image">
						<img alt="객실 이미지" src="images/pop_image3.jpg" height="256px" width="512px">
					</div>
					<div class="room-item-info">
						<div class="room-info-name">
							<h2>오션 프론트 스위트</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-content">
									<h4>방 소개</h4>
									<span>오션 전망이 멋지고 아늑한 스위트입니다.</span>
								</li>
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>2명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>4명</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 150,000 ~</span>
							</div>
						</div>
					</div>
				</div>
			</li>
			<li class="room-item" data-room_id="3">
				<div class="room-item-wrap">
					<div class="room-item-image">
						<img alt="객실 이미지" src="images/pop_image4.jpg" height="256px" width="512px">
					</div>
					<div class="room-item-info">
						<div class="room-info-name">
							<h2>산 속 코티지</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-content">
									<h4>방 소개</h4>
									<span>자연 속에서 평온한 휴식을 즐기세요.</span>
								</li>
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>3명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>5명</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 90,000 ~</span>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</section>
	<!-- 숙소 위치 -->
	<section class="detail-stay-location">
		<span>LOCATION</span>
		<div class="stay-location-wrap">
			<div class="stay-location-info">
				<h4>숙소 이름</h4>
				<address>숙소 주소 가져와서 출력</address>
				<span>T. 010-1234-5678</span>
			</div>
			<div>
				<div id="map" style="width:800px;height:500px;"></div>
			</div>
		</div>
	</section>
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />
</body>
</html>