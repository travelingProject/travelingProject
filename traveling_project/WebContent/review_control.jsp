<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>my page (리뷰관리)</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
<style> <!-- 나눔고딕 폰트 -->
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<!-- jquery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/member.css" />
<link rel="stylesheet" href="css/my_info.css" />
<link rel="stylesheet" href="css/review_modal.css" />
<!-- js -->
<script src="js/review_modal.js"></script>
</head>
<body>
	<jsp:include page="./header.jsp"/>
	<!-- 마이페이지 공통 배너 -->
	<section id="member_status">
		<jsp:include page="./status.jsp"/>
	</section>
	<main id="member_contents">
	<!-- 마이페이지 사이드 nav include -->
		<jsp:include page="./my_page_nav.jsp"/>
		<section>
			<!-- 이 부분에 기능 index 페이지 -->
			<div id="reservation_wrap" class="index_wrap">
				<article>
					<h2>리뷰관리</h2>
					<ul id="reservation_category" class="index_category">
						<li>숙소 이름</li>
						<li>일정</li>
						<li>수정하기</li>
						<li>삭제하기</li>
						<li>최근수정일</li>
					</ul>
					<ul class="index_list">
						<li><a href="#">
							<span></span> <!-- 예약 테이블의 location 컬럼 -->
							<h6></h6> <!-- 예약 테이블의 참조키인 방 정보 테이블에서 가져온 숙소 이름 -->
						</a></li>
						<li></li> <!-- 예약 테이블의 체크인 ~ 체크아웃 날짜 -->
						<li><button class="replace_review_btn">수정하기</button></li>
						<li><button class="remove_review_btn">삭제하기</button></li>
						<li></li> <!-- 리뷰 테이블 최종수정일 -->
					</ul>
				</article>
			</div>
		</section>
	</main>
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>