<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="del" class="com.hh.db.ControlDB" />
<%
	String rid = request.getParameter("reservationId");
	del.reviewDelete(rid);
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>