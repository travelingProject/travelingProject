<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="db" class="com.hh.db.ControlDB" />
	<jsp:useBean id="obj" class="com.hh.db.ReviewObj" />
<%
	request.setCharacterEncoding("UTF-8");
	obj.setReservation_id(Integer.parseInt(request.getParameter("rid")));
    obj.setRtitle(request.getParameter("rtitle"));
    obj.setRcontent(request.getParameter("rcontent"));
    obj.setRating(Double.parseDouble(request.getParameter("rating")));
    
    db.insertReview(obj);
    response.sendRedirect("my_info.jsp");
%>