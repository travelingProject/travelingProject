<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String news_agency = request.getParameter("news_agency");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String email_addr = request.getParameter("email_address");
	String birth_year = request.getParameter("birth_year");
	String birth_month = request.getParameter("birth_month");
	String birth_day = request.getParameter("birth_day");
	String gender = request.getParameter("gender");
	String post_code = request.getParameter("post_code");
	String road_addr = request.getParameter("road_addr");
	String jibun_addr = request.getParameter("jibun_addr");
	String detail_addr = request.getParameter("detail_addr");
	String reference_addr = request.getParameter("reference_addr");
	String mail = email + "@" + email_addr;
	String birth = birth_year + "-" + birth_month + "-" + birth_day;
	Connection conn = null;
	Statement stmt = null;	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root", "xhddlf336!");
		stmt = conn.createStatement();
 		stmt.executeUpdate("insert into user_join values ('"
		        + id + "', '"
		        + pw + "', '"
		        + name + "', '"
		        + news_agency + "', '"
		        + phone + "', '"
		        + mail + "', '"
		        + birth + "', '"
		        + gender + "', '"
		        + post_code + "', '"
		        + road_addr + "', '"
		        + jibun_addr + "', '"
		        + detail_addr + "', '"
		        + reference_addr + "', "
		        + "date_format(now(), '%Y%m%d%H%i%s'));");
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
	response.sendRedirect("signup_complete.html");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원가입이 완료되었습니다!
</body>
</html>