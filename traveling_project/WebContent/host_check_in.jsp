<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.jslee.traveling.ReservationInfo"%>
<!DOCTYPE html>
<html>
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
<title>체크인</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<jsp:useBean id="reservationAcception" class="com.jslee.traveling.ReservationAcception" scope="page" />
	<%
		// 예약 확정된 예약 테이블 객체 배열
		ArrayList<ReservationInfo> rcArr = reservationAcception.reservationConfirmed();
		// 체크인된 예약 테이블 객체 배열
		ArrayList<ReservationInfo> cirArr = reservationAcception.CheckInReservation();		
	%>
	<main>
		<span class="line1"></span>
		<h2>체크인 전</h2>
		<span class="line2"></span>
		<div class="reservation_info">
			<table>
				<thead>
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
				</thead>
				<tbody>
				<%
  					for (int i = 0; i < rcArr.size(); i++) {
						out.println("<tr>");
						out.println("<td>" + rcArr.get(i).getReservationId() + "</td>");
						out.println("<td>" + rcArr.get(i).getUserId() + "</td>");
						out.println("<td>" + rcArr.get(i).getRoomId() + "</td>");
						out.println("<td>" + rcArr.get(i).getCheckInDate() + "</td>");
						out.println("<td>" + rcArr.get(i).getCheckOutDate() + "</td>");
						out.println("<td>" + rcArr.get(i).getCheckInTime() + "</td>");
						out.println("<td>" + rcArr.get(i).getCheckOutTime() + "</td>");
						out.println("<td>" + rcArr.get(i).getPeople() + "</td>");
						out.println("<td>" + rcArr.get(i).getPrice() + "</td>");
						out.println("<td>" + rcArr.get(i).getPaymentTime() + "</td>");						
						out.println("<td><a class='btn' href='update.jsp?reservationId=" + rcArr.get(i).getReservationId() + "'>체크인</a></td>");
						out.println("</tr>");
					}
				%>
				</tbody>
			</table>
		</div>
		<span class="line1"></span>
		<h2>체크인 후</h2>
		<span class="line2"></span> <span class="line"></span>
		<div class="reservation_info">
			<table>
				<thead>
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
				</thead>
				<tbody>
				<%
 					for (int i = 0; i < cirArr.size(); i++) {
						out.println("<tr>");
						out.println("<td>" + cirArr.get(i).getReservationId() + "</td>");
						out.println("<td>" + cirArr.get(i).getUserId() + "</td>");
						out.println("<td>" + cirArr.get(i).getRoomId() + "</td>");
						out.println("<td>" + cirArr.get(i).getCheckInDate() + "</td>");
						out.println("<td>" + cirArr.get(i).getCheckOutDate() + "</td>");
						out.println("<td>" + cirArr.get(i).getCheckInTime() + "</td>");
						out.println("<td>" + cirArr.get(i).getCheckOutTime() + "</td>");
						out.println("<td>" + cirArr.get(i).getPeople() + "</td>");
						out.println("<td>" + cirArr.get(i).getPrice() + "</td>");
						out.println("<td>" + cirArr.get(i).getPaymentTime() + "</td>");						
						out.println("<td><a class='btn' href='update.jsp?checkInId=" + cirArr.get(i).getReservationId() + "'>체크인 취소</a></td>");
						out.println("</tr>");
					} 
				%>
				</tbody>
			</table>
		</div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>