<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String hostId = (String) session.getAttribute("host_id"); %>
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
							<p id="stay-name" class="info">서초포레스타</p>
							<input id="stay-name-edit" type="button" value="수정하기">
						</td>						
					</tr>
					<tr>
						<th rowspan="2">숙소 주소</th>
						<td colspan="2" id="addr-td">
							<div id="addr-box">
								<p class="info">우편번호 : 06800</p>
								<p class="info">도로명 주소 : 서울특별시 서초구 헌릉로 8길 45</p>
								<p class="info">지번 주소 : 서울 서초구 내곡동 384</p>
								<p class="info">상세 주소 : 210-701</p>
								<p class="info">참고 사항 : (내곡동, 서초포레스타2단지)</p>
							</div>							
							<input type="button" id="addr-edit-btn" value="수정하기">
						</td>						
					</tr>
					<tr>
						<td colspan="2">
							<div id="map" style="width: 100%; height: 300px; margin-top: 10px;"></div>
						</td>
					</tr>
					<tr>
						<th>연락받을 전화번호</th>
						<td>
							<p id="host-phone" class="info">01041868842</p>
							<input id="phone-edit-btn" type="button" value="수정하기">
						</td>
					</tr>
					<tr>
						<th>숙소 이미지</th>
						<td id="image_td">							
							<div id="att_zone">
								<div>
									<label id="image_label1" class="image_label" for="image1">이미지를 선택해주세요.</label>									
									<input type="button" id="remove_btn1" class="remove_btn" value="-" style="display:none">
									<input type="file" class="images" id="image1" name="image1" accept="image/png,image/jpeg,image/gif">
								</div>			
								<div>
									<label id="image_label2" class="image_label" for="image2">이미지를 선택해주세요.</label>
									<input type="button" id="remove_btn2" class="remove_btn" value="-" style="display:none">
									<input type="file" class="images" id="image2" name="image2" accept="image/png,image/jpeg,image/gif">		
								</div>								
								<div>
									<label id="image_label3" class="image_label" for="image3">이미지를 선택해주세요.</label>
									<input type="button" id="remove_btn3" class="remove_btn" value="-" style="display:none">
									<input type="file" class="images" id="image3" name="image3" accept="image/png,image/jpeg,image/gif">								
								</div>								
								<div>
									<label id="image_label4" class="image_label" for="image4">이미지를 선택해주세요.</label>
									<input type="button" id="remove_btn4" class="remove_btn" value="-" style="display:none">
									<input type="file" class="images" id="image4" name="image4" accept="image/png,image/jpeg,image/gif">									
								</div>								
								<div>
									<label id="image_label5" class="image_label" for="image5">이미지를 선택해주세요.</label>
									<input type="button" id="remove_btn5" class="remove_btn" value="-" style="display:none">
									<input type="file" class="images" id="image5" name="image5" accept="image/png,image/jpeg,image/gif">												
								</div>
							</div>
							<input id="image-edit-btn" type="button" value="수정하기">
						</td>
					</tr>
					<tr>					
						<th>숙소 상세 정보</th>
						<td>							
							<p class="info">
								편안한 휴식을 취할 수 있고, 화려한 전망을 자랑하는 온수 욕조에서 휴식을 취할 수 있습니다! 리우데자네이루 캄포의 타이오진호에 위치하고 있으며, 문 앞에는 석호, 정원, 과수원, 그네 등이 있어 자연과 다시 만날 수 있습니다! 시설이 완비된 주방에서 식사를 준비하고 백만 개의 별표 아래에서 휴식을 취해보세요! 체험에 참여하세요!
							</p>
						</td>
					</tr>
					<tr>
					<th rowspan="2">편의 시설</th>							
						<td>
							<div style="color:#999; border-bottom:none">
								<div>
									<div>욕조</div>
									<div>샤워 용품</div>
									<div>헤어 드라이어</div>
									<div>수건</div>
									<div>침구류</div>
									<div>세탁기기</div>
									<div>건조기</div>
									<div>수영장</div>
									<div>오락실 게임</div>
									<div>헬스장</div>
									<div>TV</div>
									<div>보드게임</div>
									<div>에어컨</div>
									<div>선풍기</div>
									<div>난방</div>
									<div>일산화탄소 경보기</div>
									<div>소화기</div>
									<div>구급 상자</div>
								</div>
								<div>
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