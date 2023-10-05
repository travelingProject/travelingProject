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
<link rel="stylesheet" href="css/add_accomodation.css" />
<link rel="stylesheet" href="css/host_header.css" />
<link rel="stylesheet" href="css/host_index.css" />
<link rel="stylesheet" href="css/footer.css" />
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap"
	rel="stylesheet" />
<!-- slider -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=503ba05a6aebde2c3d2be42f78d1b63b&libraries=services"></script>
<!-- script -->
<title>숙소 등록</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<main>
		<%@ include file="host_aside.jsp"%>
		<section>
			<h2>숙소 등록하기</h2>
			<form action="hello.jsp">
				<table>
					<tr>
						<th>숙소 이름</th>
						<td>
							<input type="text" id="stay_name" name="stay_name" placeholder="숙소 이름을 입력하세요." />
							<p id="stay_name_text" class="error_text">숙소 이름을 입력해주세요.</p>						
						</td>						
					</tr>
					<tr>
						<th rowspan="2">숙소 주소</th>
						<td>
							<input type="hidden" name="latitude" id="latitudeInput">
    						<input type="hidden" name="longitude" id="longitudeInput">
							<input type="text" id="sample5_address" name="stay_addr" readonly="readonly" placeholder="주소" />
							<input type="button" id="addr_search" onclick="sample5_execDaumPostcode()" value="주소 검색" />
							<p id="addr_text" class="error_text">주소를 입력해주세요.</p>
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
							<input type="text" id="host_phone" name="host_phone" placeholder="전화번호를 입력하세요.">
							<p id="phone_text" class="error_text">"-"를 제외한 전화번호 11자리를 입력해주세요.</p>
						</td>
					</tr>
					<tr>
						<th>숙소 이미지</th>
						<td>
							<input type="file" name="" id="" multiple onchange="readURL(this);"/>
							<img id="preview"style="display:none; height:300px;"/>							
						</td>
					</tr>					
				</table>
				<input type="submit" id='add_btn' value="등록하기">
			</form>
		</section>
		<script src="js/add_accomodation.js"></script>
	</main>
	<%@ include file='footer.jsp'%>
</body>
</html>