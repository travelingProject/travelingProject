<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");	
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root", "xhddlf336!");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user_join where user_id='" + id + "';");
		if(rs.next()){			
			String userId = rs.getString("user_id");
			String userPw = rs.getString("pw");
			if(userId.equals(id) && userPw.equals(pw)){
				session.setAttribute("id",id);
				session.setAttribute("pw",pw);
				response.sendRedirect("index.html");
			} else{
				response.sendRedirect("login.html");
			}
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