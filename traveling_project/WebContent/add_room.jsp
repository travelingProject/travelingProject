<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.pro.dto.CheckInInfo"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- css -->
<link rel="stylesheet" href="css/host_common.css" />
<link rel="stylesheet" href="css/add_stay.css" />
<link rel="stylesheet" href="css/add_room.css" />

<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- script -->
<script src="js/add_room.js"></script>
<title>호스트 페이지</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<main>
		<%@ include file="host_aside.jsp"%>
		<section>
			<h2>객실 등록하기</h2>
			<form action="add_room.condb?comm=room_ins" method="post">
				<table>
					<tbody>
						<tr>
							<th>객실 이름</th>
							<td><input type="text" placeholder="객실 이름을 입력해주세요."></td>
						</tr>
						<tr>
							<th>객실 설명</th>
							<td>
								<p style="line-height: 1">
									<textarea name="contents" placeholder="객실에 대한 상세한 정보를 입력해주세요."></textarea>
								</p>
							</td>
						</tr>
						<tr>
							<th>객실 가격</th>
							<td><input type="text" placeholder="객실 가격을 입력해주세요."></td>
						</tr>
						<tr>
							<th>기준 인원</th>
							<td>
								<input type="hidden" name="std_people" id="std_people_input" value="1" />
								<input type="button" id="std_decrease_btn" value="-" />
								<span id="std_people_number"  class="people_num">1</span>
								<input type="button" id="std_increase_btn" value="+" />
							</td>							
						</tr>
						<tr>
							<th>최대 인원</th>
							<td>
							    <input type="hidden" name="max_people" id="max_people_input" value="1" />
								<input type="button" id="max_decrease_btn" value="-" />
								<span id="max_people_number" class="people_num">1</span>
								<input type="button" id="max_increase_btn" value="+" />
							</td>							
						</tr>
						<tr>
							<th>객실 이미지</th>
							<td>							
								<input type="file" id="btnAtt" name="stay_image" multiple="multiple" onchange="readURL(this);"/>
								<label for="btnAtt">이미지 업로드</label>
								<input type="button" id="file_delete_all" value="이미지 전체 삭제" onclick="deleteAllFiles()"/>
								<p id="file_error_text" class="error_text"></p>
								<div id="att_zone" data-placeholder="파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요"></div>	
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
					</tbody>					
				</table>
				<input type="submit" value="등록하기">
			</form>
		</section>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>
