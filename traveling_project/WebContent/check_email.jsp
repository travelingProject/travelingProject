<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String result = "false";	
	Connection con = null;
	Statement sta = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "0509");
		if (con == null) {
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.<br>");
		}
		sta = con.createStatement();
		ResultSet rs = sta.executeQuery("SELECT email FROM project.user_join WHERE email = '" + email + "';");
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