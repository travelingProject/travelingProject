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
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- script -->
<title>호스트 페이지</title>
</head>
<body>
	<%@ include file="host_header.jsp"%>
	<main>
		<%@ include file="host_aside.jsp"%>
		<section>
			<div>
				<h2>
					<%
						String name = (String) session.getAttribute("name");
						out.println(name + " 님, 안녕하세요!");
					%>
				</h2>
				<a id="add_accomodation_btn" href="add_accomodation.jsp">숙소 등록하기</a>
			</div>
			<span id="underline"></span>
			<div>
				<h3>빠른 예약 조회</h3>
				<a href="#">모든 예약</a>				
			</div>
			<div>
				<input type="button" value="체크아웃 예정">				
				<input type="button" value="현재 호스팅">				
				<input type="button" value="체크인 예정">				
				<input type="button" value="답변 안한 후기">				
			</div>
			<div>
				<p>오늘 체크 아웃하는 게스트가 없습니다. </p>
			</div>				
		</section>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>
