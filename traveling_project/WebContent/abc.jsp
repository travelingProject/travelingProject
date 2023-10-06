<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String postCode = request.getParameter("post_code");
	String lat = request.getParameter("latitude");
	String lngt = request.getParameter("longitude");
	String roadAddr = request.getParameter("road_addr");
	String JibunAddr = request.getParameter("jibun_addr");
	String detailAddr = request.getParameter("detail_addr");
	String extraAddr = request.getParameter("reference_addr");
	String hostPhone = request.getParameter("host_phone");
	String stay_image = request.getParameter("stay_image");
	String contents = request.getParameter("contents");
	out.println(postCode);
	out.println(lat);
	out.println(lngt);
	out.println(roadAddr);
	out.println(JibunAddr);
	out.println(detailAddr);
	out.println(extraAddr);
	out.println(hostPhone);
	out.println(stay_image);
	out.println(contents);
	%>
</body>
</html>