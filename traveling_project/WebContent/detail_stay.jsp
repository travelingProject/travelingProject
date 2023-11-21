<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.pro.dto.StayInfo" %>
<%@ page import="com.pro.dto.RoomInfo" %>
<%@ page import="com.pro.dto.ReviewInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%
	List<StayInfo> detailStayList = (List<StayInfo>) request.getAttribute("detailStayList");
	List<RoomInfo> roomList = (List<RoomInfo>) request.getAttribute("roomList");
	List<ReviewInfo> reviewList = (List<ReviewInfo>) request.getAttribute("reviewList");
	
	String path = request.getContextPath();
	NumberFormat formatter = NumberFormat.getNumberInstance();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<link rel="stylesheet" href="css/detail_stay.css">
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="js/detail_stay.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<h1 id="stay_name"><%=detailStayList.get(0).getStayName() %></h1>
	<!-- Swiper -->	
	<div class="swiper mySwiper">
	  <div class="swiper-wrapper">
		  <%
		  	if(detailStayList.get(0).getImage1() != null){
		  %>	  	  	
		    <div class="swiper-slide"><img alt="숙소 이미지" src="<%=path%>/stay_images/<%=detailStayList.get(0).getImage1()%>"></div>
		  <%
		  	}
		  %>	    	    
		  <%
		  	if(detailStayList.get(0).getImage2() != null){
		  %>	  	  	
		    <div class="swiper-slide"><img alt="숙소 이미지" src="<%=path%>/stay_images/<%=detailStayList.get(0).getImage2()%>"></div>
		  <%
		  	}
		  %>	    	    
		  <%
		  	if(detailStayList.get(0).getImage3() != null){
		  %>	  	  	
		    <div class="swiper-slide"><img alt="숙소 이미지" src="<%=path%>/stay_images/<%=detailStayList.get(0).getImage3()%>"></div>
		  <%
		  	}
		  %>	    	    
		  <%
		  	if(detailStayList.get(0).getImage4() != null){
		  %>	  	  	
		    <div class="swiper-slide"><img alt="숙소 이미지" src="<%=path%>/stay_images/<%=detailStayList.get(0).getImage4()%>"></div>
		  <%
		  	}
		  %>	    	    
		  <%
		  	if(detailStayList.get(0).getImage5() != null){
		  %>	  	  	
		    <div class="swiper-slide"><img alt="숙소 이미지" src="<%=path%>/stay_images/<%=detailStayList.get(0).getImage5()%>"></div>
		  <%
		  	}
		  %>	    	    
	  </div>
	  <div class="swiper-button-next"></div>
	  <div class="swiper-button-prev"></div>
	</div>	
	<!-- 숙소 정보 -->
	<section class="detail-stay-info">
		<div>
			<h3>숙소 설명</h3>
			<p class="content"><%=detailStayList.get(0).getContent() %></p>
			<input id="amenity-btn" type="button" value="편의 시설 보기">
		</div>
		<div class="amenity">
					<h3 id="amenity-title">편의시설</h3>
					<div class="stay-amenity-content">						
						<c:if test="${not empty detailStayList[0].tub or 
						             not empty detailStayList[0].bathSupplies or 
						             not empty detailStayList[0].hairDryer}">
						    <p class="amenity-bedroom">
						        <b>욕실</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].tub}">욕조</c:if> <br>
						            <c:if test="${not empty detailStayList[0].bathSupplies}">샤워용품</c:if> <br>
						            <c:if test="${not empty detailStayList[0].hairDryer}">헤어 드라이기</c:if> <br>					            					
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].towel or 
						             not empty detailStayList[0].bedding or 
						             not empty detailStayList[0].washingMachine or 
						             not empty detailStayList[0].dryingMachine}">
						    <p class="amenity-bedroom">
						        <b>침실 및 세탁 시설</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].towel}">수건</c:if> <br>
						            <c:if test="${not empty detailStayList[0].bedding}">침구류</c:if> <br>
						            <c:if test="${not empty detailStayList[0].washingMachine}">세탁기</c:if> <br>
						            <c:if test="${not empty detailStayList[0].dryingMachine}">건조기</c:if> <br>						
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].pool or 
						             not empty detailStayList[0].arcadeGame or 
						             not empty detailStayList[0].gym or 
						             not empty detailStayList[0].tv or 
						             not empty detailStayList[0].boardGame}">
						    <p class="amenity-bedroom">
						        <b>엔터테인먼트</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].pool}">수영장</c:if> <br>
						            <c:if test="${not empty detailStayList[0].arcadeGame}">오락실 게임</c:if> <br>
						            <c:if test="${not empty detailStayList[0].gym}">헬스장</c:if> <br>
						            <c:if test="${not empty detailStayList[0].tv}">TV</c:if> <br>						
						            <c:if test="${not empty detailStayList[0].boardGame}">보드 게임</c:if> <br>						
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].airConditioner or 
						             not empty detailStayList[0].fan or						             
						             not empty detailStayList[0].heatingSystem}">
						    <p class="amenity-bedroom">
						        <b>냉난방</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].airConditioner}">에어컨</c:if> <br>
						            <c:if test="${not empty detailStayList[0].fan}">선풍기</c:if> <br>
						            <c:if test="${not empty detailStayList[0].heatingSystem}">난방</c:if> <br>					            							
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].carbonMonoxideAlarm or 
						             not empty detailStayList[0].fireExtinguisher or 
						             not empty detailStayList[0].aidKit or 
						             not empty detailStayList[0].fireAlarm}">
						    <p class="amenity-bedroom">
						        <b>숙소 안전</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].carbonMonoxideAlarm}">일산화탄소 경보기</c:if> <br>
						            <c:if test="${not empty detailStayList[0].fireExtinguisher}">소화기</c:if> <br>
						            <c:if test="${not empty detailStayList[0].aidKit}">구급상자</c:if> <br>
						            <c:if test="${not empty detailStayList[0].fireAlarm}">화재 경보기</c:if> <br>					
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].workspace or						             
						             not empty detailStayList[0].wirelessInternet}">
						    <p class="amenity-bedroom">
						        <b>인터넷 및 업무 공간</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].workspace}">업무 전용 공간</c:if> <br>
						            <c:if test="${not empty detailStayList[0].wirelessInternet}">무선 인터넷</c:if> <br>					            							
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].barbecueTool or 
						             not empty detailStayList[0].basicCookware or
						             not empty detailStayList[0].diningTable or
						             not empty detailStayList[0].cutlery or
						             not empty detailStayList[0].refrigerator or
						             not empty detailStayList[0].microwave or
						             not empty detailStayList[0].electricRiceCooker or 
						             not empty detailStayList[0].gasStoveOrInduction}">
						    <p class="amenity-bedroom">
						        <b>주방 및 식당</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].barbecueTool}">바베큐 도구</c:if> <br>
						            <c:if test="${not empty detailStayList[0].basicCookware}">기본 조리도구</c:if> <br>
						            <c:if test="${not empty detailStayList[0].diningTable}">식탁</c:if> <br>
						            <c:if test="${not empty detailStayList[0].cutlery}">식기류</c:if> <br>
						            <c:if test="${not empty detailStayList[0].refrigerator}">냉장고</c:if> <br>
						            <c:if test="${not empty detailStayList[0].microwave}">전자레인지</c:if> <br>
						            <c:if test="${not empty detailStayList[0].electricRiceCooker}">전기밥솥</c:if> <br>
						            <c:if test="${not empty detailStayList[0].gasStoveOrInduction}">가스레인지 또는 인덕션</c:if> <br>
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].electricVehicleChargingFacilities or						             
						             not empty detailStayList[0].parkingLot}">
						    <p class="amenity-bedroom">
						        <b>주차</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].electricVehicleChargingFacilities}">전기차 충전 시설</c:if> <br>
						            <c:if test="${not empty detailStayList[0].parkingLot}">주차장</c:if> <br>
						        </span>
						    </p>
						</c:if>
						<c:if test="${not empty detailStayList[0].breakfast or						             
						             not empty detailStayList[0].cleanService or 
						             not empty detailStayList[0].luggageStorage}">
						    <p class="amenity-bedroom">
						        <b>서비스</b>
						        <hr>
						        <span>
						            <c:if test="${not empty detailStayList[0].breakfast}">아침 식사</c:if> <br>
						            <c:if test="${not empty detailStayList[0].cleanService}">청소 서비스</c:if> <br>
						            <c:if test="${not empty detailStayList[0].luggageStorage}">짐보관</c:if> <br>
						        </span>
						    </p>
						</c:if>						
					</div>
				</div>
	</section>
	<!-- 리뷰 -->
	<section class="detail-stay-review">
		<h3 id="review-title">리뷰 ★<%=detailStayList.get(0).getRatingAvg() %> (<%=detailStayList.get(0).getRating_count() %>)</h3>
		<div class="stay-review-wrap">
			<%
				for(int i = 0; i < 3; i++){
			%>
			<div class="stay-review-content-wrap">
				<div class="stay-review-image">
					<img src="<%=path %>/images/review/<%=reviewList.get(i).getReview_image1() %>" width="150px" height="150px">
				</div>
				<div class="stay-review-content">
					<div class="review-writter">
						<h3><%=reviewList.get(i).getUser_id() %></h3>						
						<span class="review-writter-star">★<%=reviewList.get(i).getRating() %></span>
					</div>
					<div class="room-name">
						<h4><%=reviewList.get(i).getRoom_name() %></h4>
					</div>
					<div class="review-content-wrap">						
						<h3 class="review-title"><%=reviewList.get(i).getReview_title() %></h3>
						<p id="review-content"><%=reviewList.get(i).getReview_content() %></p>																	
					</div>
				</div>
			</div>			
			<%
				}
			%>
		</div>
	</section>
	<!-- 객실 예약 -->
	<section class="detail-stay-room">
		<h2>객실</h2>
		<ul class="room-list">
		<%
			for(int i = 0; i < roomList.size(); i++){
		%>		
			<li class="room-item" data-room_id="<%=roomList.get(i).getRoom_id()%>">
				<div class="room-item-wrap">
					<div class="room-item-image">
						<img alt="객실 이미지" src="<%=path %>/room_images/<%=roomList.get(i).getImage1() %>" width="512px" height="256px">
					</div>
					<div class="room-item-info">
						<div class="room-info-name">
							<h2><%=roomList.get(i).getRoomName() %></h2>
						</div>
						<div class="room-info-detail">
							<ul class="room-info-list">
								<li class="room-content">
									<h4>방 소개</h4>
									<span><%=roomList.get(i).getContent() %></span>
								</li>
								<li class="room-min-people">
									<h4>기준 인원</h4>
									<span><%=roomList.get(i).getStdPeople() %>명</span>
								</li>
								<li class="room-max-people">
									<h4>최대 인원</h4>
									<span><%=roomList.get(i).getMaxPeople() %>명</span>
								</li>
							</ul>
							<div class="room-to-reservation">
								<a href="#" class="reservation-a">예약하기</a>
								<span class="room-price">
								<%-- ₩ <%
									String formattedPrice = formatter.format(roomList.get(i).getPrice());
									out.println(formattedPrice);
								%> --%>
								</span>
							</div>
						</div>
					</div>
				</div>
			</li>
			<%
				}
			%>				
		</ul>
	</section>
	<!-- 숙소 위치 -->
	<section class="detail-stay-location">
		<span>LOCATION</span>
		<div class="stay-location-wrap">
			<div class="stay-location-info">
				<h4>숙소 이름</h4>
				<address>숙소 주소 가져와서 출력</address>
				<span>T. 010-1234-5678</span>
			</div>
			<div>
				<div id="map" style="width:800px;height:500px;"></div>
			</div>
		</div>
	</section>
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />
</body>
</html>