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
