<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/header.css" />
<link rel="stylesheet" href="css/add_stay.css" />
<link rel="stylesheet" href="css/host_common.css" />
<link rel="stylesheet" href="css/footer.css" />
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
			<h2>숙소 등록하기</h2>
			<%				
				String hostId = (String) session.getAttribute("id");				
				out.println("<form action='insert.condb?comm=stay_ins&name=" + hostId +  "' method='post' enctype='multipart/form-data'>");
			%>			
				<table>
					<tr>
						<th>숙소 이름</th>
						<td>
							<input type="text" id="stay_name" name="stay_name" placeholder="숙소 이름을 입력하세요." />
							<p id="stay_name_text" class="error_text">숙소 이름을 입력해주세요.</p>						
						</td>						
					</tr>
					<tr>
						<th rowspan="4">숙소 주소</th>
						<td>
							<input type="hidden" name="latitude" id="latitudeInput">
    						<input type="hidden" name="longitude" id="longitudeInput">
							<input type="text" id="sample4_postcode" name="post_code" readonly="readonly" placeholder="우편번호" />
							<input type="button" id="addr_search" onclick="sample5_execDaumPostcode()" value="주소 검색" />
							<p id="addr_text" class="error_text">주소를 입력해주세요.</p>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="road_addr" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" />
                  			<input type="text" name="jibun_addr" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id="sample4_detailAddress" name="detail_addr" placeholder="상세주소" />
                  			<input type="text" id="sample4_extraAddress" name="reference_addr" placeholder="참고항목" readonly="readonly" />
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
							<input type="text" id="host_phone" name="host_phone" placeholder="연락받을 전화번호를 입력하세요.">
							<p id="phone_text" class="error_text">"-"를 제외한 전화번호 11자리를 입력해주세요.</p>
						</td>
					</tr>
					<tr>
						<th>숙소 이미지</th>
						<td>							
							<p id="image_text">숙소 이미지는 최소 3장에서 최대 5장까지 등록해주세요.</p>
							<div id="att_zone">
								<label class="image_label" for="image1"">이미지를 드래그하세요.</label>
								<input type="file" class="images" id="image1" name="image1">
								<label class="image_label" for="image2">이미지를 드래그하세요.</label>
								<input type="file" class="images" id="image2" name="image2" onchange="readURL(this)">
								<label class="image_label" for="image3">이미지를 드래그하세요.</label>
								<input type="file" class="images" id="image3" name="image3" onchange="readURL(this)">
								<label class="image_label" for="image4">이미지를 드래그하세요.</label>
								<input type="file" class="images" id="image4" name="image4" onchange="readURL(this)">
								<label class="image_label" for="image5">이미지를 드래그하세요.</label>
								<input type="file" class="images" id="image5" name="image5" onchange="readURL(this)">
							</div>
						</td>
					</tr>
					<tr>
					
						<th>숙소 상세 정보</th>
						<td>
							<p style="line-height:1">
								<textarea name="content" placeholder="숙소에 대한 상세한 정보를 입력해주세요."></textarea>
							</p>
						</td>
					</tr>
					<tr>
					<th rowspan="2">편의 시설</th>							
						<td>	
							<h3>욕실</h3>							
							<div>
								<h4>욕조</h4>
								<div>										
									<input type="radio" id="tub_check" name="tub" value="option1">
									<label for="tub_check"></label>										
									<input type="radio" id="tub_not_checked" name="tub" value="option2">
									<label for="tub_not_checked"></label>
								</div>									
							</div>
							<div>
								<h4>샤워 용품</h4>
								<div>										
									<input type="radio" id="bath_supplies_checked" name="bath_supplies" value="option1">
									<label for="bath_supplies_checked"></label>										
									<input type="radio" id="bath_supplies_not_checked" name="bath_supplies" value="option2">
									<label for="bath_supplies_not_checked"></label>
								</div>									
							</div>
							<div>
								<h4>헤어 드라이어</h4>
								<div>										
									<input type="radio" id="hair_dryer_checked" name="hair_dryer" value="option1">
									<label for="hair_dryer_checked"></label>										
									<input type="radio" id="hair_dryer_not_checked" name="hair_dryer" value="option2">
									<label for="hair_dryer_not_checked"></label>
								</div>
							</div>
							<h3>침실 및 세탁 시설</h3>
							<div>
								<h4>수건</h4>
								<div>										
									<input type="radio" id="towel_checked" name="towel" value="option1">
									<label for="towel_checked"></label>										
									<input type="radio" id="towel_not_checked" name="towel" value="option2">
									<label for="towel_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>침구류</h4>
								<div>										
									<input type="radio" id="bedding_checked" name="bedding" value="option1">
									<label for="bedding_checked"></label>										
									<input type="radio" id="bedding_not_checked" name="bedding" value="option2">
									<label for="bedding_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>세탁기</h4>
								<div>										
									<input type="radio" id="washing_machine_checked" name="washing_machine" value="option1">
									<label for="washing_machine_checked"></label>										
									<input type="radio" id="washing_machine_not_checked" name="washing_machine" value="option2">
									<label for="washing_machine_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>건조기</h4>
								<div>										
									<input type="radio" id="drying_machine_checked" name="drying_machine" value="option1">
									<label for="drying_machine_checked"></label>										
									<input type="radio" id="drying_machine_not_checked" name="drying_machine" value="option2">
									<label for="drying_machine_not_checked"></label>
								</div>
							</div>
							<h3>엔터테인먼트</h3>
							<div>
								<h4>수영장</h4>
								<div>										
									<input type="radio" id="pool_checked" name="pool" value="option1">
									<label for="pool_checked"></label>										
									<input type="radio" id="pool_not_checked" name="pool" value="option2">
									<label for="pool_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>오락실 게임</h4>
								<div>										
									<input type="radio" id="arcade_game_checked" name="arcade_game" value="option1">
									<label for="arcade_game_checked"></label>										
									<input type="radio" id="arcade_game_not_checked" name="arcade_game" value="option2">
									<label for="arcade_game_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>헬스장</h4>
								<div>										
									<input type="radio" id="gym_checked" name="gym" value="option1">
									<label for="gym_checked"></label>										
									<input type="radio" id="gym_not_checked" name="gym" value="option2">
									<label for="gym_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>TV</h4>
								<div>										
									<input type="radio" id="tv_checked" name="tv" value="option1">
									<label for="tv_checked"></label>										
									<input type="radio" id="tv_not_checked" name="tv" value="option2">
									<label for="tv_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>보드게임</h4>
								<div>										
									<input type="radio" id="board_game_checked" name="board_game" value="option1">
									<label for="board_game_checked"></label>										
									<input type="radio" id="board_game_not_checked" name="board_game" value="option2">
									<label for="board_game_not_checked"></label>
								</div>
							</div>
							<h3>냉난방</h3>
							<div>
								<h4>에어컨</h4>
								<div>										
									<input type="radio" id="air_conditioner_checked" name="air_conditioner" value="option1">
									<label for="air_conditioner_checked"></label>										
									<input type="radio" id="air_conditioner_not_checked" name="air_conditioner" value="option2">
									<label for="air_conditioner_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>선풍기</h4>
								<div>										
									<input type="radio" id="fan_checked" name="fan" value="option1">
									<label for="fan_checked"></label>										
									<input type="radio" id="fan_not_checked" name="fan" value="option2">
									<label for="fan_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>난방</h4>
								<div>										
									<input type="radio" id="heating_system_checked" name="heating_system" value="option1">
									<label for="heating_system_checked"></label>										
									<input type="radio" id="heating_system_not_checked" name="heating_system" value="option2">
									<label for="heating_system_not_checked"></label>
								</div>
							</div>
							<h3>숙소 안전</h3>
							<div>
								<h4>일산화탄소 경보기</h4>
								<div>										
									<input type="radio" id="carbon_monoxide_alarm_checked" name="heating_system" value="option1">
									<label for="carbon_monoxide_alarm_checked"></label>										
									<input type="radio" id="carbon_monoxide_alarm_not_checked" name="heating_system" value="option2">
									<label for="carbon_monoxide_alarm_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>소화기</h4>
								<div>										
									<input type="radio" id="fire_extinguisher_checked" name="fire_extinguisher" value="option1">
									<label for="fire_extinguisher_checked"></label>										
									<input type="radio" id="fire_extinguisher_not_checked" name=""fire_extinguisher"" value="option2">
									<label for="fire_extinguisher_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>구급 상자</h4>
								<div>										
									<input type="radio" id="aid_kit_checked" name="aid_kit" value="option1">
									<label for="aid_kit_checked"></label>										
									<input type="radio" id="aid_kit_not_checked" name="aid_kit" value="option2">
									<label for="aid_kit_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>화재 경보기</h4>
								<div>										
									<input type="radio" id="fire_alarm_checked" name="fire_alarm" value="option1">
									<label for="fire_alarm_checked"></label>										
									<input type="radio" id="fire_alarm_not_checked" name="fire_alarm" value="option2">
									<label for="fire_alarm_not_checked"></label>
								</div>
							</div>
							<h3>인터넷 및 업무 공간</h3>
							<div>
								<h4>업무 전용 공간</h4>
								<div>										
									<input type="radio" id="workspace_checked" name="workspace" value="option1">
									<label for="workspace_checked"></label>										
									<input type="radio" id="workspace_not_checked" name="workspace" value="option2">
									<label for="workspace_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>무선 인터넷</h4>
								<div>										
									<input type="radio" id="wireless_internet_checked" name="wireless_internet" value="option1">
									<label for="wireless_internet_checked"></label>										
									<input type="radio" id="wireless_internet_not_checked" name="wireless_internet" value="option2">
									<label for="wireless_internet_not_checked"></label>
								</div>
							</div>
							<h3>주방 및 식당</h3>
							<div>
								<h4>바베큐 도구</h4>
								<div>										
									<input type="radio" id="barbecue_tool_checked" name="barbecue_tool" value="option1">
									<label for="barbecue_tool_checked"></label>										
									<input type="radio" id="barbecue_tool_not_checked" name="barbecue_tool" value="option2">
									<label for="barbecue_tool_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>기본 조리도구</h4>
								<div>										
									<input type="radio" id="basic_cookware_checked" name="basic_cookware" value="option1">
									<label for="basic_cookware_checked"></label>										
									<input type="radio" id="basic_cookware_not_checked" name="basic_cookware" value="option2">
									<label for="basic_cookware_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>식탁</h4>
								<div>										
									<input type="radio" id="dining_table_checked" name="dining_table" value="option1">
									<label for="dining_table_checked"></label>										
									<input type="radio" id="dining_table_not_checked" name="dining_table" value="option2">
									<label for="dining_table_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>식기류</h4>
								<div>										
									<input type="radio" id="cutlery_checked" name="cutlery" value="option1">
									<label for="cutlery_checked"></label>										
									<input type="radio" id="cutlery_not_checked" name="cutlery" value="option2">
									<label for="cutlery_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>냉장고</h4>
								<div>										
									<input type="radio" id="refrigerator_checked" name="refrigerator" value="option1">
									<label for="refrigerator_checked"></label>										
									<input type="radio" id="refrigerator_not_checked" name="refrigerator" value="option2">
									<label for="refrigerator_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>전자레인지</h4>
								<div>										
									<input type="radio" id="microwave_checked" name="microwave" value="option1">
									<label for="microwave_checked"></label>										
									<input type="radio" id="microwave_not_checked" name="microwave" value="option2">
									<label for="microwave_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>전기밥솥</h4>
								<div>										
									<input type="radio" id="electric_rice_cooker_checked" name="electric_rice_cooker" value="option1">
									<label for="electric_rice_cooker_checked"></label>										
									<input type="radio" id="electric_rice_cooker_not_checked" name="electric_rice_cooker" value="option2">
									<label for="electric_rice_cooker_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>가스레인지 또는 인덕션</h4>
								<div>										
									<input type="radio" id="gas_stove_or_induction_checked" name="gas_stove_or_induction" value="option1">
									<label for="gas_stove_or_induction_checked"></label>										
									<input type="radio" id="gas_stove_or_induction_not_checked" name="gas_stove_or_induction" value="option2">
									<label for="gas_stove_or_induction_not_checked"></label>
								</div>
							</div>
							<h3>주차</h3>
							<div>
								<h4>전기차 충전시설</h4>
								<div>										
									<input type="radio" id="electric_vehicle_charging_facilities_checked" name="electric_vehicle_charging_facilities" value="option1">
									<label for="electric_vehicle_charging_facilities_checked"></label>										
									<input type="radio" id="electric_vehicle_charging_facilities_not_checked" name="electric_vehicle_charging_facilities" value="option2">
									<label for="electric_vehicle_charging_facilities_not_checked"></label>
								</div>
							</div>
							<div>
								<h4>주차장</h4>
								<div>										
									<input type="radio" id="parking_lot_checked" name="parking_lot" value="option1">
									<label for="parking_lot_checked"></label>										
									<input type="radio" id="parking_lot_not_checked" name="parking_lot" value="option2">
									<label for="parking_lot_not_checked"></label>
								</div>
							</div>
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