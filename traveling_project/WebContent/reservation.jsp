<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/reservation.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script src="js/reservation.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<!-- 예약 화면 -->
	<!-- 선택한 객실 정보 -->
	<section class="reservation-info">
		<div class="room-info-wrap">
			<div class="room-info-content">
				<div class="room-info-name">
					<h1>금문도</h1>
				</div>
				<div class="room-info-text">
					<h4>지상 최악의 중국집에 오신걸 환영합니다~</h4>
				</div>
			</div>
			<div class="room-info-images">
				<div class="room-info-image">
					<img alt="이미지" src="images/trash.jpg" width="580px" height="480px">
				</div>
				<div class="images-others">
					<div class="others-row">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
					</div>
					<div class="others-row">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
					</div>
					<div class="others-row">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
						<img alt="이미지" src="images/trash.jpg" width="190px">
					</div>
				</div>
			</div>
		</div>	
	</section>
	<section class="reservation-detail">
		<div class="reservation-detail-wrap">
			<div class="reservation-calendar">
				<div class="calendar-container">
				  <div class="calendar-left">
				    <div class="calendar-header">
				      <h3>체크인</h3>
				    </div>
				    <div class="calendar"></div>
				  </div>
				  <div class="calendar-right">
				    <div class="calendar-header">
				      <h3>체크아웃</h3>
				    </div>
				    <div class="calendar"></div>
				  </div>
				</div>
			</div>
			<div class="reservation-price">
				
			</div>
		</div>
	</section>
	
	
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />

</body>
</html>