<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/host_aside.css" />
<link rel="stylesheet" href="css/host_common.css" />
<link rel="stylesheet" href="css/reservation_acception.css" />
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
<script src="js/host_header.js"></script>
<script src="js/reservation_acception.js"></script>
<title>호스트 페이지</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<jsp:useBean id="reservationAcception" class="com.jslee.traveling.ReservationAcception" scope="page" />
	<%
		String hostId = (String) session.getAttribute("host_id");
		// 예약 대기중인 예약 테이블 객체 배열
		ArrayList<ReservationInfo> rwArr = reservationAcception.reservationWaiting(hostId);
		// 예약 확정된 예약 테이블 객체 배열
		ArrayList<ReservationInfo> rcArr = reservationAcception.reservationConfirmed(hostId);
		// 예약 거부된 예약 테이블 객체 배열
		ArrayList<ReservationInfo> rRArr = reservationAcception.reservationRejected(hostId);
		// 예약 취소된 예약 테이블 객체 배열
		ArrayList<ReservationInfo> rCancArr = reservationAcception.reservationCancelled(hostId);
	%>
	<main>
		<%@ include file="host_aside.jsp"%>
		<section>
			<h2>예약 승인/거부</h2>
			<div id="reservation_table">
				<table>
					<thead>
						<tr>
							<th>예약 번호</th>
							<th>예약자 성함</th>
							<th>객실 이름</th>
							<th>체크인 날짜</th>
							<th>체크 아웃 날짜</th>
							<th>체크인 시간</th>
							<th>체크 아웃 시간</th>
							<th>인원수</th>
							<th>결제 금액</th>
							<th>결제 시간</th>
							<th>예약 상태</th>
							<th id="note">비고</th>
						</tr>
					</thead>
					<%
						// 예약 대기
						/* if (rwArr.size() != 0) { */
							for (int i = 0; i < rwArr.size(); i++) {
								out.println("<tr>");
								out.println("<td>" + rwArr.get(i).getReservationId() + "</td>");
								out.println("<td>" + rwArr.get(i).getUserId() + "</td>");
								out.println("<td>" + rwArr.get(i).getRoomName() + "</td>");
								out.println("<td>" + rwArr.get(i).getCheckInDate() + "</td>");
								out.println("<td>" + rwArr.get(i).getCheckOutDate() + "</td>");
								out.println("<td>" + rwArr.get(i).getCheckInTime() + "</td>");
								out.println("<td>" + rwArr.get(i).getCheckOutTime() + "</td>");
								out.println("<td>" + rwArr.get(i).getPeople() + "</td>");
								out.println("<td>" + rwArr.get(i).getPrice() + "</td>");
								out.println("<td>" + rwArr.get(i).getPaymentTime() + "</td>");
								out.println("<td style='color:#999'>" + rwArr.get(i).getStatus() + "</td>");
								out.println("<td>");
								out.println("<input type='button' class='accept_btn' value='승인'>");
								out.println("<input type='button' class='reject_btn' value='거부'>");
								out.println("</td>");
								out.println("</tr>");

								// 예약 승인 
								out.println("<div id='accept_modal' class='modal'>");
								out.println("<div>");
								out.println("<h2>예약 승인</h2>");
								out.println("<p>예약을 확정하시겠습니까?<br />(예약이 확정되면 취소하실 수 없습니다.)</p>");
								out.println("<div id='btn'><a id='accept' class='btn' href='reservationUpdate.jsp?reservationId="
										+ rwArr.get(i).getReservationId() + "'>확인</a>");
								out.println("<input type='button' class='btn' value='취소'/></div>");
								out.println("<span class='ir_pm'>닫기</span>");
								out.println("</div>");
								out.println("</div>");

								// 예약 거부
								out.println("<div id='reject_modal' class='modal'>");
								out.println("<div>");
								out.println("<h2>예약 거부</h2>");
								out.println("<p>예약을 거부하시겠습니까?<br />(예약을 거부하시면 취소하실 수 없습니다.)</p>");
								out.println("<div id='btn'><a id='acccept' class='btn' href='reservationUpdate.jsp?cancelId="
										+ rwArr.get(i).getReservationId() + "'>확인</a>");
								out.println("<input type='button' class='btn' value='취소'/></div>");
								out.println("<span class='ir_pm'>닫기</span>");
								out.println("</div>");
								out.println("</div>");

							}
							// 예약 확정
							for (int i = 0; i < rcArr.size(); i++) {
								out.println("<tr>");
								out.println("<td>" + rcArr.get(i).getReservationId() + "</td>");
								out.println("<td>" + rcArr.get(i).getUserId() + "</td>");
								out.println("<td>" + rcArr.get(i).getRoomName() + "</td>");
								out.println("<td>" + rcArr.get(i).getCheckInDate() + "</td>");
								out.println("<td>" + rcArr.get(i).getCheckOutDate() + "</td>");
								out.println("<td>" + rcArr.get(i).getCheckInTime() + "</td>");
								out.println("<td>" + rcArr.get(i).getCheckOutTime() + "</td>");
								out.println("<td>" + rcArr.get(i).getPeople() + "</td>");
								out.println("<td>" + rcArr.get(i).getPrice() + "</td>");
								out.println("<td>" + rcArr.get(i).getPaymentTime() + "</td>");
								out.println("<td style='color:#1a44ff; font-weight:bold'>" + rcArr.get(i).getStatus() + "</td>");
								out.println("<td>-</td>");
								out.println("</tr>");
							}
							// 예약 거부
							for (int i = 0; i < rRArr.size(); i++) {
								out.println("<tr>");
								out.println("<td>" + rRArr.get(i).getReservationId() + "</td>");
								out.println("<td>" + rRArr.get(i).getUserId() + "</td>");
								out.println("<td>" + rRArr.get(i).getRoomName() + "</td>");
								out.println("<td>" + rRArr.get(i).getCheckInDate() + "</td>");
								out.println("<td>" + rRArr.get(i).getCheckOutDate() + "</td>");
								out.println("<td>" + rRArr.get(i).getCheckInTime() + "</td>");
								out.println("<td>" + rRArr.get(i).getCheckOutTime() + "</td>");
								out.println("<td>" + rRArr.get(i).getPeople() + "</td>");
								out.println("<td>" + rRArr.get(i).getPrice() + "</td>");
								out.println("<td>" + rRArr.get(i).getPaymentTime() + "</td>");
								out.println("<td style='color:red;font-weight:bold'>" + rRArr.get(i).getStatus() + "</td>");
								out.println("<td>-</td>");
								out.println("</tr>");
							}
							// 예약 취소
							for (int i = 0; i < rCancArr.size(); i++) {
								out.println("<tr>");
								out.println("<td>" + rCancArr.get(i).getReservationId() + "</td>");
								out.println("<td>" + rCancArr.get(i).getUserId() + "</td>");
								out.println("<td>" + rCancArr.get(i).getRoomName() + "</td>");
								out.println("<td>" + rCancArr.get(i).getCheckInDate() + "</td>");
								out.println("<td>" + rCancArr.get(i).getCheckOutDate() + "</td>");
								out.println("<td>" + rCancArr.get(i).getCheckInTime() + "</td>");
								out.println("<td>" + rCancArr.get(i).getCheckOutTime() + "</td>");
								out.println("<td>" + rCancArr.get(i).getPeople() + "</td>");
								out.println("<td>" + rCancArr.get(i).getPrice() + "</td>");
								out.println("<td>" + rCancArr.get(i).getPaymentTime() + "</td>");
								out.println("<td style='color:red;font-weight:bold'>" + rCancArr.get(i).getStatus() + "</td>");
								out.println("<td>-</td>");
								out.println("</tr>");
							}
							%>
							</table>
							<%			
						if(rwArr.size() == 0 && rcArr.size() == 0 && rRArr.size() == 0 && rCancArr.size() == 0){							
							out.println("<p style='height:466px; line-height:466px; color:#000; user-select:none;'>예약 정보가 없습니다.</p>");
						}
					%>
			</div>
		</section>		
		<div id="background_overlay"></div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>



