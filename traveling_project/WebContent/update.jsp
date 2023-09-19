<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.jslee.traveling.CheckIn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		CheckIn checkIn = new CheckIn();
		String reservationId = request.getParameter("reservationId");
		String checkInId = request.getParameter("checkInId");
		out.println(reservationId);
		checkIn.changeToCheckIn(reservationId);
		checkIn.changeToReservationConfirm(checkInId);
		response.sendRedirect("host_check_in.jsp");
	%>

</body>
</html>