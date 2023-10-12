<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pid = request.getParameter("planId");
	int cdays = new Integer(request.getParameter("countDays"));
	
	for (int i = 0; i < cdays; i++) {
		int j = i + 1;
		if (j == 1) {
%>
<li class="is_on" data-tab="day<%=j%>"><a href="#day<%=j%>" class="tab_btn"><%=j%>일차</a>
	<div id="day<%=j%>" class="tab_cont">
		<p><%=j%>일차	</p>
		<div class="schedule"></div>
	</div>
</li>
<%
	} else {
%>
<li data-tab="day<%=j%>"><a href="#day<%=j%>" class="tab_btn"><%=j%>일차</a>
	<div id="day<%=j%>" class="tab_cont">
		<p><%=j%>일차</p>
		<div class="schedule"></div>
	</div>
</li>
<%
	}
	}
%>
