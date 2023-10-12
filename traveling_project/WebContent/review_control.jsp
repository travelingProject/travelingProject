<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>my page (리뷰관리)</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/member.css" />
<link rel="stylesheet" href="css/my_info.css" />
<link rel="stylesheet" href="css/review_modal.css" />
<!-- js -->
<script src="js/review_modal.js"></script>
<script src="js/review_control.js"></script>
</head>
<body>
	<jsp:include page="login_header.jsp" />
	<!-- 마이페이지 공통 배너 -->
	<section id="member_status">
		<jsp:include page="./status.jsp" />
	</section>
	<main id="member_contents">
		<!-- 마이페이지 사이드 nav include -->
		<jsp:include page="./my_page_nav.jsp" />
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
					<div id="review_list">
						<!-- ajax로 동적으로 생성 -->
					</div>
					<div class="review_modal_wrap">
						<div id="review_modal_index">
							<button class="close_btn">&times;</button>
							<form action="review_update.jsp" id="review_form" method="post">
								<!-- 리뷰 form -->
								<input type="hidden" name="rid" id="rid_hidden" value="">
								<div id="rm_header">
									<p></p>
									<!-- stay_info 테이블의 stay_name 컬럼 -->
									<span></span>
									<!-- reservation 테이블의 check_in_date, check_out_date 컬럼 -->
								</div>
								<div id="rm_contents">
									<div class="review_title">
										<label for="rtitle" id="rtitle_la">제목</label> <br>
										<input type="text" id="rtitle" name="rtitle" placeholder="제목을 작성해주세요.">
									</div>
									<div class="review_content">
										<label for="rcontent" id="rcontent_la">내용</label> <br>
										<textarea id="rcontent" name="rcontent" placeholder="리뷰를 작성해주세요."></textarea>
									</div>
									<div class="review_image">
										<label for="rimg">이미지 업로드</label>
										<input type="file" id="rimg" name="rimg" class="img_upload" onchange="addFile(this);" accept="image/*" multiple>
										<div class="file_list"></div>
									</div>
								</div>
								<div class="star-rating space-x-4 mx-auto">
									<input type="radio" id="5-stars" name="rating" value="5.0" />
									<label for="5-stars" class="star pr-4">★</label>
									<input type="radio" id="4-stars" name="rating" value="4.0" />
									<label for="4-stars" class="star">★</label>
									<input type="radio" id="3-stars" name="rating" value="3.0" />
									<label for="3-stars" class="star">★</label>
									<input type="radio" id="2-stars" name="rating" value="2.0" />
									<label for="2-stars" class="star">★</label>
									<input type="radio" id="1-star" name="rating" value="1.0" />
									<label for="1-star" class="star">★</label>
								</div>
								<div id="rm_btn">
									<input type="submit" id="submit_btn" value="저장">
									<input type="button" id="can_btn" name="can_btn" value="취소">
								</div>
							</form>
						</div>
					</div>
				</article>
			</div>
		</section>
	</main>
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />
</body>
</html>