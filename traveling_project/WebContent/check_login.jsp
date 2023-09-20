<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hh.db.LoginObj"%>
<jsp:useBean id="chklog" class="com.hh.db.ControlDB" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
%>
<%
	LoginObj logChk = chklog.chkLoginId(id, pw);

	if (logChk.getId().equals(id) && logChk.getPw().equals(pw)) {
		session.setAttribute("user_id", id);
		out.println("성공");
	} else {
		out.println("실패");
	}
%>