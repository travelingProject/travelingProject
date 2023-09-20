<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="getInfo" class="com.hh.db.ControlDB"/>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.hh.db.MyPageObj"%>

<%
	String id = (String)session.getAttribute("id");

	ArrayList<MyPageObj> rinfoList = getInfo.getReservInfo(id);
%>
<html>
<head>
<title>Reservation Info</title>
</head>
<body>
	<%
		for (int i = 0; i < rinfoList.size(); i++) {
			String rid = rinfoList.get(i).getReservation_id();
			String chkIn = rinfoList.get(i).getCheckInDate();
			String chkOut = rinfoList.get(i).getCheckOutDate();
			int people = rinfoList.get(i).getPeople();
			String stayName = rinfoList.get(i).getStayName();
			String location = rinfoList.get(i).getLocation();
	%>
	<ul class='index_list'>
		<li><a href='#'>
			<span class='r_location'><%=location%></span>
			<h6 class='r_stay_name'><%=stayName%></h6>
		</a></li>
		<li class='r_chk_date'><%=chkIn%> ~ <%=chkOut%></li>
		<li class='r_people'><%=people%></li>
		<li><a href='#'>상세보기</a></li>
		<li><button class='review_modal' onclick="modal(event)" data-reservation_id="<%=rid%>">작성하기</button></li>
	</ul>
	<%
		}
	%>
</body>
</html>