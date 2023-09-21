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
<link rel="stylesheet" href="css/reservation_acception.css" />
<link rel="stylesheet" href="css/footer.css" />
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap"
	rel="stylesheet" />
<!-- slider -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- script -->
<script src="js/host_header.js"></script>
<title>호스트 페이지</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<%
	
	%>
	<main>
		<aside>
			<ul>
				<li><a href="#">숙소 등록</a></li>
				<li><a href="#">숙소 등록하기</a></li>
				<li><a href="#">객실 등록하기</a></li>
			</ul>
			<ul>
				<li><a href="#">예약 관리</a></li>
				<li><a href="#">예약 정보 조회</a></li>
				<li><a href="#">예약 승인/거부</a></li>
				<li><a href="#">지난 예약 내역</a></li>
			</ul>
			<ul>
				<li><a href="#">매출 현황</a></li>
				<li><a href="#">기간별 매출 조회</a></li>
				<li><a href="#">객실별 매출 조회</a></li>
			</ul>
			<ul>
				<li><a href="#">리뷰 관리</a></li>
				<li><a href="#">리뷰 조회하기</a></li>
				<li><a href="#">리뷰 답글 달기</a></li>
				<li><a href="#">리뷰 신고하기</a></li>
				<li><a href="#">자주 사용된 키워드</a></li>
			</ul>
		</aside>
		<section>
			<h2>예약 승인/거부</h2>
			<div id="reservation_table">
				<table>
					<thead>
						<tr>
							<th>예약 번호</th>
							<th>예약자 성함</th>
							<th>방 정보</th>
							<th>체크인 날짜</th>
							<th>체크 아웃 날짜</th>
							<th>체크인 시간</th>
							<th>체크 아웃 시간</th>
							<th>인원수</th>
							<th>결제 금액</th>
							<th>결제 시간</th>
							<th>예약 상태</th>
							<th>관리</th>
						</tr>
					</thead>
					<tr>
						<td>123</td>
						<td>이준섭</td>
						<td>101호</td>
						<td>2023.09.20</td>
						<td>2023.09.21</td>
						<td>15:00</td>
						<td>11:00</td>
						<td>4</td>
						<td>170,000</td>
						<td>2023.08.15 09:23:37</td>
						<td>예약 대기중</td>
						<td><input type="button" id="accept_btn" value="승인" /> <input
							type="button" id="reject_btn" value="거부" /></td>
					</tr>
					<tr>
						<td>123</td>
						<td>이준섭</td>
						<td>101호</td>
						<td>2023.09.20</td>
						<td>2023.09.21</td>
						<td>15:00</td>
						<td>11:00</td>
						<td>4</td>
						<td>170,000</td>
						<td>2023.08.15 09:23:37</td>
						<td>예약 확정</td>
						<td><input type="button" id="cancel_btn" value="확정 취소" /></td>
					</tr>
				</table>
			</div>
		</section>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>



