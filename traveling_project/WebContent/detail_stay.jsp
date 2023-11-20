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
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- 숙소 정보 -->
	<section class="detail-stay-info">
		<div class="stay-info-wrap">
			<div class="stay-info-image">
				<img alt="숙소 이미지" src="images/accomodation_near_me_image3.jpg">
			</div>
			<div class="stay-info-text">
				<div class="text-stay-name">
					<h1>숙소 이름</h1>
				</div>
				<div class="text-stay-content">
					<p>stay_info 테이블에서 content 컬럼 값 가져오면 좋을 거 같아요</p>
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
							<h2>객실 이름</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>2명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>4명</span>
								</li>
								<li class="room-amenity">
									<h4>편의시설</h4>
									<span>여기에, 편의시설, yes, 인거, 가져올, 까요?</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 360,000 ~</span>
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
							<h2>객실 이름</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>2명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>4명</span>
								</li>
								<li class="room-amenity">
									<h4>편의시설</h4>
									<span>여기에, 편의시설, yes, 인거, 가져올, 까요?</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 360,000 ~</span>
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
							<h2>객실 이름</h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span>2명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span>4명</span>
								</li>
								<li class="room-amenity">
									<h4>편의시설</h4>
									<span>여기에, 편의시설, yes, 인거, 가져올, 까요?</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">RESERVATION</a>
								<span class="room-price">₩ 360,000 ~</span>
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