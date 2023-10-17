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
				out.println("<form action='insert.condb?comm=stay_ins&name=" + hostId +  "' method='post'>");
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
							<input type="file" id="btnAtt" name="stay_image" multiple="multiple"/>
							<label for="btnAtt">이미지 업로드</label>							
							<input type="button" id="file_delete_all" value="이미지 전체 삭제" onclick="deleteAllFiles()"/>
							<p id="file_error_text" class="error_text"></p>
							<div id="att_zone">이미지는 최소 3장 최대 5장까지 선택할 수 있습니다.</div>
						</td>
					</tr>
					<tr>
						<th>숙소 상세 정보</th>
						<td>
							<p style="line-height:1">
								<textarea name="contents" placeholder="숙소에 대한 상세한 정보를 입력해주세요."></textarea>
							</p>
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