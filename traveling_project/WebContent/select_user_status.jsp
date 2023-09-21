<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="sumPrice" class="com.hh.db.ControlDB"/>
<%
	String id = (String)session.getAttribute("id");
	int sum = sumPrice.statusPrice(id);
	
	String grade = sumPrice.userGrade(sum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div><p id="ugrade"><%=grade %></p></div>

</body>
</html>