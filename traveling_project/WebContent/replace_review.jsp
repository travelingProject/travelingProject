<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hh.db.ReviewObj"%>
<!DOCTYPE html>
<jsp:useBean id="selReview" class="com.hh.db.ControlDB" />
<%
	String rid = request.getParameter("reservationId");

	ReviewObj riv = selReview.reviewReplace(rid);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p id="riv_title"><%=riv.getRtitle()%></p>
	</div>
	<div>
		<p id="riv_content"><%=riv.getRcontent()%></p>
	</div>
	<div>
		<p id="riv_rating"><%=riv.getRating()%></p>
	</div>

</body>
</html>