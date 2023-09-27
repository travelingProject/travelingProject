<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;	
	// db 비밀번호
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8",
				"root", "0509");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from host_info where host_id='" + id + "';");
		if (rs.next()) {
			String userId = rs.getString("host_id");
			String userPw = rs.getString("pw");
			String name = rs.getString("name");
			if (id.equals(userId) && pw.equals(userPw)) {
				response.sendRedirect("host_index.jsp");
				session.setAttribute("id",userId);
				session.setAttribute("pw",userPw);
				session.setAttribute("name",name);
			}
			else{
				response.sendRedirect("host_login_fail.html");	
			}
		} else {
			response.sendRedirect("host_login_fail.html");
		}		
	} finally {
		try {
			stmt.close();
		} catch (Exception ignored) {

		}
		try {
			conn.close();
		} catch (Exception ignored) {

		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>