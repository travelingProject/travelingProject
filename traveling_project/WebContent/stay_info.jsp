<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.pro.dto.StayInfo" %>
<%@ page import="java.util.List" %>
<% String hostId = (String) session.getAttribute("host_id"); %>
<% 
	List<StayInfo> stayInfo = (List<StayInfo>) request.getAttribute("stayInfo");
	String path = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/add_stay.css" />
<link rel="stylesheet" href="css/host_common.css" />
<link rel="stylesheet" href="css/stay_info.css" />
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap"
	rel="stylesheet" />
<!-- jquery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 카카오 api -->
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=503ba05a6aebde2c3d2be42f78d1b63b&libraries=services"></script>
<!-- script -->
<title>숙소 등록</title>
</head>
<body>	
	<%@ include file="host_header.jsp"%>
	<main>
		<%@ include file="host_aside.jsp"%>
		<section>	
			<h2>숙소 정보</h2>			
			<form action="insert.condb?comm=stay_ins&name=<%= hostId %>" method="post" enctype="multipart/form-data">					
				<table>
					<tr>
						<th>숙소 이름</th>
						<td colspan="2">
							<p id="stay-name" class="info"><%=stayInfo.get(0).getStayName() %></p>
							<input id="stay-name-edit" type="button" value="수정하기">
						</td>						
					</tr>
					<tr>
						<th rowspan="2">숙소 주소</th>
						<td colspan="2" id="addr-td">
							<div id="addr-box">
								<p class="info">우편번호 : <%=stayInfo.get(0).getPostCode() %></p>
								<p class="info">도로명 주소 : <%=stayInfo.get(0).getRoadAddr() %></p>
								<p class="info">지번 주소 : <%=stayInfo.get(0).getJibunAddr() %></p>
								<p class="info">상세 주소 : <%=stayInfo.get(0).getDetailAddr() %></p>
								<p class="info">참고 사항 : <%=stayInfo.get(0).getReferenceAddr() %></p>
							</div>
							<input type="button" id="addr-edit-btn" value="수정하기">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" id="latitude" value="<%=stayInfo.get(0).getLatitude()%>">
							<input type="hidden" id="longitude" value="<%=stayInfo.get(0).getLongitude()%>">
							<div id="map" style="width: 100%; height: 300px; margin-top: 10px;"></div>
						</td>
					</tr>
					<tr>
						<th>연락받을 전화번호</th>
						<td>
							<p id="host-phone" class="info"><%=stayInfo.get(0).getHostPhone() %></p>
							<input id="phone-edit-btn" type="button" value="수정하기">
						</td>
					</tr>
					<tr>
						<th>숙소 이미지</th>
						<td id="image_td">							
							<div id="att_zone">
								<div>
									<img src="<%=path%>/stay_images/<%=stayInfo.get(0).getImage1()%>" width="128" height="128">
								</div>			
								<div>
									<img src="<%=path%>/stay_images/<%=stayInfo.get(0).getImage2()%>" width="128" height="128">
								</div>								
								<div>
									<img src="<%=path%>/stay_images/<%=stayInfo.get(0).getImage3()%>" width="128" height="128">								
								</div>								
								<div>
									<img src="<%=path%>/stay_images/<%=stayInfo.get(0).getImage4()%>" width="128" height="128">
								</div>								
								<div>
									<img src="<%=path%>/stay_images/<%=stayInfo.get(0).getImage5()%>" width="128" height="128">		
								</div>
							</div>
							<input id="image-edit-btn" type="button" value="수정하기">
						</td>
					</tr>
					<tr>					
						<th>숙소 상세 정보</th>
						<td>							
							<p class="info">
								<%=stayInfo.get(0).getContent()%>
							</p>
							<input id="content-edit-btn" type="button" value="수정하기">
						</td>
					</tr>
					<tr>
					<th rowspan="2">편의 시설</th>							
						<td>
							<div style="color:#999; border-bottom:none">
								<div>
									<c:choose>
									
									    <c:when test="${not empty stayInfo[0].tub}">
									        <div>${stayInfo[0].tub}</div>
									    </c:when>
									    
										<c:when test="${not empty stayInfo[0].bathSupplies}">
											<div>${stayInfo[0].bathSupplies}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].hairDryer}">
											<div>${stayInfo[0].hairDryer}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].towel}">
											<div>${stayInfo[0].towel}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].bedding}">
											<div>${stayInfo[0].bedding}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].washingMachine}">
											<div>${stayInfo[0].washingMachine}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].dryingMachine}">
											<div>${stayInfo[0].dryingMachine}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].pool}">
											<div>${stayInfo[0].pool}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].arcadeGame}">
											<div>${stayInfo[0].arcadeGame}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].gym}">
											<div>${stayInfo[0].gym}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].tv}">
											<div>${stayInfo[0].tv}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].boardGame}">
											<div>${stayInfo[0].boardGame}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].airConditioner}">
											<div>${stayInfo[0].airConditioner}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].fan}">
											<div>${stayInfo[0].fan}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].heatingSystem}">
											<div>${stayInfo[0].heatingSystem}</div>
										</c:when>
										
										<c:when test="${not empty stayInfo[0].carbonMonoxideAlarm}">
											<div>${stayInfo[0].carbonMonoxideAlarm}</div>
										</c:when>
										
									</c:choose>																		
								</div>
								<div>
<%-- 									<c:choose>
									    <c:when test="${not empty stayInfo[0].tub}">
									    	<div>${stayInfo[0].fire_extinguisher}</div>
									        <div>${stayInfo[0].aid_kit}</div>
									        <div>${stayInfo[0].fire_alarm}</div>
									        <div>${stayInfo[0].workspace}</div>
									        <div>${stayInfo[0].wireless_internet}</div>
									        <div>${stayInfo[0].barbecue_tool}</div>
									        <div>${stayInfo[0].basic_cookware}</div>
									        <div>${stayInfo[0].dining_table}</div>
									        <div>${stayInfo[0].cutlery}</div>
									        <div>${stayInfo[0].refrigerator}</div>
									        <div>${stayInfo[0].microwave}</div>
									        <div>${stayInfo[0].electric_rice_cooker}</div>
									        <div>${stayInfo[0].gas_stove_or_induction}</div>
									        <div>${stayInfo[0].electric_vehicle_charging_facilities}</div>
									        <div>${stayInfo[0].parking}</div>
									        <div>${stayInfo[0].breakfast}</div>
									        <div>${stayInfo[0].clean_service}</div>
									        <div>${stayInfo[0].luggage_storage}</div>									        
									    </c:when>    
									</c:choose> --%>
									<div>화재 경보기</div>
									<div>업무 전용 공간</div>
									<div>무선 인터넷</div>
									<div>바베큐 도구</div>
									<div>기본 조리도구</div>
									<div>식탁</div>
									<div>식기류</div>
									<div>냉장고</div>
									<div>전자레인지</div>
									<div>전기밥솥</div>
									<div>가스레인지 또는 인덕션</div>
									<div>전기차 충전시설</div>
									<div>주차장</div>
									<div>아침식사</div>
									<div>청소 서비스</div>
									<div>짐보관</div>								
								</div>								
							</div>
							<input id="amenties_edit_btn" type="button" value="수정하기">
						</td>
					</tr>	
				</table>
				<input type="submit" id='add_btn' value="등록하기">
			</form>
		</section>		
	</main>
	<%@ include file='footer.jsp'%>	
	<script src="js/add_stay.js"></script>
</body>
</html>