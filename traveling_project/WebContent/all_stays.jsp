<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pro.dto.FilterStayInfo" %>
<%
	List<FilterStayInfo> stayList = (List<FilterStayInfo>) request.getAttribute("stayList");
	for(int i = 0; i < stayList.size(); i++) {
		System.out.println(stayList.get(i).getStay_name());
		System.out.println(stayList.get(i).getAvg_rating());
		System.out.println(stayList.get(i).getRoad_addr());
		System.out.println(stayList.get(i).getRating_count());			
		System.out.println(stayList.get(i).getMin_room_price());			
		System.out.println("--------------------------------");
	}
		
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- css -->    
    <link rel="stylesheet" href="css/all_stays.css" />
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- script -->    
    <script src="js/all_stays.js"></script>
    <title>예약하기</title>
  </head>
  <body>
    <%@ include file="header.jsp"%>
    <main class="clearfix">
    <%@ include file="all_stays_aside.jsp" %>
      <section id="accomodation_info" class="clearfix">
	      <%
	      	for(int i = 0; i < stayList.size(); i++){
	      %>
      	<div class="accomodation">
	      	<a href="#">
	      		<div class="accomodation_box">
		      		<div>
		      			<img src="images/accomodation_near_me_image1.jpg" alt="" />
		      		</div>
		      		<div>
		      			<h2>야외풀 노천스파 오션뷰</h2>
		            	<p>4.78(32)</p>
		            	<p>경기/가평</p>
		            	<p>₩ 320,000 ~</p>
		      		</div>
	      		</div>	      			      		
	      	</a>
	      </div>	      
	      <%
	      	}
	      %>
	      <!-- <div id="more">
	      	<span id="more_btn">더보기</span>
	      </div> -->
      </section>
      <section id="mapper">
      
      </section>
            
    </main>
    <div class="go_top"></div>
    <%@ include file="footer.jsp"%>    
  </body>
</html>
