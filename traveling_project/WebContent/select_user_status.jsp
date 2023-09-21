<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sumPrice" class="com.hh.db.ControlDB"/>
<%
    String id = (String)session.getAttribute("id");
    int sum = sumPrice.statusPrice(id);

    String grade = sumPrice.userGrade(sum);
    double per = sumPrice.gradePer(grade);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 등급 연산 추출 -->
<div><p id="ugrade"><%=grade %></p></div>
<!-- 등급에 맞는 적립율 추출 -->
<div><p id="uper"><%=per %></p></div>

<div><p id="ugrade"><%=grade %></p></div>

</body>
</html>