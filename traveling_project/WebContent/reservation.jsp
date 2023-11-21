<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Traveling</title>
<link rel="stylesheet" href="css/reservation.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css">

<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<!-- 토스페이먼츠 -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>
<script src="js/tosspay.js"></script>

<script src="js/reservation.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- 예약 화면 -->
	<!-- 선택한 객실 정보 -->
	<section class="reservation-info">
		<div class="room-info-wrap">
			<div class="room-info-content">
				<div class="room-info-name">
					<h1>루마니아 뷰 룸</h1>
				</div>
				<div class="room-info-text">
					<h3>이 아름다운 루마니아 뷰 룸에서 편안한 휴식을 즐기세요.</h3>
				</div>
			</div>
			<div class="room-info-images">
				<div class="room-info-image">
					<img alt="이미지" src="images/pop_image1.jpg" width="580px" height="480px">
				</div>
				<div class="images-others">
					<div class="others-row">
						<img alt="이미지" src="images/pop_image2.jpg" width="190px">
						<img alt="이미지" src="images/pop_image3.jpg" width="190px">
						<img alt="이미지" src="images/pop_image4.jpg" width="190px">
					</div>
					<div class="others-row">
						<img alt="이미지" src="images/pop_image5.jpg" width="190px">
						<img alt="이미지" src="images/pop_image6.jpg" width="190px">
						<img alt="이미지" src="images/pop_image7.jpg" width="190px">
					</div>
					<div class="others-row">
						<img alt="이미지" src="images/pop_image8.jpg" width="190px">
						<img alt="이미지" src="images/pop_image9.jpg" width="190px">
						<img alt="이미지" src="images/pop_image10.jpg" width="190px">
					</div>
				</div>
			</div>
		</div>	
	</section>
	<section class="reservation-detail">
		<div class="reservation-detail-wrap">
			<div class="reservation-calendar">
				<div class="detail-title">
					<h3>체크인/체크아웃</h3>
					<h3>예약정보</h3>
				</div>
				<div class="calendar-container">
					<table class="calendar calendar-left">
			            <thead>
			                <tr>
			                    <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
			                    <td colspan="5" class="year-month">
			                        <span id="calYearLeft"></span>년
			                        <span id="calMonthLeft"></span>월
			                    </td>
			                    <td></td>
			                </tr>
			                <tr>
			                    <td>일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td>토</td>
			                </tr>
			            </thead>
			            <tbody>
			            </tbody>
			        </table>
			        <table class="calendar calendar-right">
			            <thead>
			                <tr>
			                    <td></td>
			                    <td colspan="5" class="year-month">
			                        <span id="calYearRight"></span>년
			                        <span id="calMonthRight"></span>월
			                    </td>
			                    <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
			                </tr>
			                <tr>
			                    <td>일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td>토</td>
			                </tr>
			            </thead>
			            <tbody>
			            </tbody>
			        </table>
			        <div class="reservation-option">
						<ul class="detail-option">
							<li class="option-days">
								<strong>숙박기간</strong>
								<div class="option-txt" id="travel-days">
									<span id="leave-stay"><b id="leave-stay-txt"></b>박</span>
									<div id="date-display">
										<span id="check-in-date">체크인</span> ~ <span id="check-out-date">체크아웃</span>
									</div>
								</div>
							</li>
							<li class="option-people">
								<strong>이용인원</strong>
								<div class="option-txt">
									<button type="button" class="people-change" id="people-minus">-</button>
									<span id="guest"><b id="guest-txt">2</b>명</span>
									<button type="button" class="people-change" id="people-plus">+</button>
								</div>
							</li>
							<li class="option-result">
								<strong>요금안내</strong>
								<table border="1" id="total-price-table">
									<tbody>
										<tr id="default-price">
											<th>객실 요금</th>
											<td id="total_room_price">￦0</td>
										</tr>
										<tr id="add-people-price">
											<th>인원추가 요금</th>
											<td id="total_pers_price">￦0</td>
										</tr>
										<tr id="total-price">
											<th>총 요금</th>
											<td class="total" id="final-price">￦0</td>
										</tr>
									</tbody>
								</table>
							</li>
							<li>
								<button type="button" id="reservation-next" onclick="payModal()">예약하기</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="toss-modal">
		<div id="toss-modal-wrap">
			<div id="toss-window"></div>
			<div id="toss-window-btn">
				<button type="button" id="payment-btn">결제</button>
				<button type="button" id="payment-cancel">취소</button>				
			</div>			
		</div>
	</section>
	
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />
</body>
</html>