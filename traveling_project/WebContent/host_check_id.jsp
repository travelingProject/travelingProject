<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String host_id = request.getParameter("host_id");
	String result = "false";
	Connection con = null;
	Statement sta = null;
	// db 비밀번호
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "xhddlf336!");
		if (con == null) {
			throw new Exception("데이터베이스에 연결할 수 없습니다.<br>");
		}
		sta = con.createStatement();
		ResultSet rs = sta
				.executeQuery("SELECT host_id FROM project.host_info WHERE host_id = '" + host_id + "';");
		if (rs.next()) {
			result = "true";
		}
	} finally {
		try {
			sta.close();
		} catch (Exception ignored) {

		}
		try {
			con.close();
		} catch (Exception ignored) {

		}
	}
	out.print(result);	
%>
