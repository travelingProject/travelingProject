<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- css -->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/header.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/footer.css" />
<!-- favicon -->
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
<!-- slider -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- script -->
<script src="js/header.js"></script>
<script src="js/main.js"></script>
<title>Traveling</title>
</head>
<body>
	<header>
		<nav id="menu_nav">
			<h1 id="logo">
				<a href="user_index.jsp"><img src="images/logo.png" alt="" /></a>
			</h1>
			<form action="reservation.jsp" id="accomodation_search">
				<input type="text" name="region" id="region" required placeholder="어디로 떠나시나요?" /> <input type="date" name="check_in_date" id="check_in_date" data-placeholder="체크인" required aria-required="true" /> <input type="date" name="check_out_date" id="check_out_date" data-placeholder="체크 아웃" required aria-required="true" /> <input type="number" name="people_num" id="people_num" required placeholder="인원 수를 입력해주세요." max="32" min="1" /> <input id="search_btn" type="submit" value="검색하기" />
			</form>
			<div class="right_menu">
				<a href="#" class="ir_pm">내 정보</a> <a href="#" class="ir_pm">언어 선택</a> <a href="#" class="ir_pm">고객 센터</a>
			</div>
			<ul id="my_info">
				<li><a href="login_select.jsp">로그인</a></li>
				<li><a href="signup_select.jsp">회원 가입</a></li>
			</ul>
		</nav>
	</header>
	<!-- slider -->
	<section id="video">
		<video autoplay loop muted>
			<source src="video/Banner.mp4" type="video/mp4" width="100%" />
		</video>
	</section>
	<!-- 숙소 검색 -->
	<main>
		<!-- 호텔 추천 -->
		<section class="hotel_recommend">
			<h2>호텔 추천</h2>
			<a href="reservation.html"><img src="images/view_all.png" alt="" /></a>
			<div class="slider rec_slider">
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image1.webp" alt="" /> <img src="images/hotel_rec_image2.webp" alt="" />
						</div>
						<h3>페어필드 바이 메리어트 서울</h3>
						<p>서울특별시 영등포구 경인로 870</p>
						<p>₩ 320,000~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image3.webp" alt="" /> <img src="images/hotel_rec_image4.webp" alt="" />
						</div>
						<h3>토요코인 서울 영등포</h3>
						<p>서울특별시 영등포구 신길로 293</p>
						<p>₩ 61,455~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image5.webp" alt="" /> <img src="images/hotel_rec_image6.webp" alt="" />
						</div>
						<h3>나인트리 프리미어 호텔 인사동</h3>
						<p>서울특별시 종로구 인사동길 49</p>
						<p>₩ 130,727</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image7.webp" alt="" /> <img src="images/hotel_rec_image8.webp" alt="" />
						</div>
						<h3>더 퍼스트 스테이</h3>
						<p>서울특별시 강서구 마곡동로 4길 23</p>
						<p>₩ 78,727~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image1.webp" alt="" /> <img src="images/hotel_rec_image2.webp" alt="" />
						</div>
						<h3>호텔 리베라</h3>
						<p>서울특별시 강남구 영동대로 737</p>
						<p>₩ 95,455~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image3.webp" alt="" /> <img src="images/hotel_rec_image4.webp" alt="" />
						</div>
						<h3>서울 가든 호텔</h3>
						<p>서울특별시 마포구 마포대로 58</p>
						<p>₩ 92,000~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image5.webp" alt="" /> <img src="images/hotel_rec_image6.webp" alt="" />
						</div>
						<h3>토요코인 서울 강남</h3>
						<p>서울특별시 강남구 강남대로 323</p>
						<p>₩ 82,364~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/hotel_rec_image7.webp" alt="" /> <img src="images/hotel_rec_image8.webp" alt="" />
						</div>
						<h3>파크 하비오 호텔</h3>
						<p>서울특별시 송파구 송파대로 111</p>
						<p>₩ 94,000~</p>
						<div class="rec_review review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
			</div>
			<span id="rec_show_review" class="show_review">리뷰 모두 보기</span> <span class="arrow ir_pm">left_arrow</span> <span class="arrow ir_pm">right_arrow</span>
		</section>
		<!-- 국내 인기 여행지 -->
		<section class="korea_popular_region">
			<h2>국내 인기 여행지</h2>
			<div class="slider">
				<a href="#">
					<div>
						<img src="images/jeju.jpg" alt="" />
					</div>
					<h2>제주</h2>
					<p>숙소 4,878개</p>
				</a> <a href="#">
					<div>
						<img src="images/seoul.jpg" alt="" />
					</div>
					<h2>서울</h2>
					<p>숙소 5,923개</p>
				</a> <a href="#">
					<div>
						<img src="images/busan.jpg" alt="" />
					</div>
					<h2>부산</h2>
					<p>숙소 2,719개</p>
				</a> <a href="#">
					<div>
						<img src="images/sokcho.jpg" alt="" />
					</div>
					<h2>속초</h2>
					<p>숙소 797개</p>
				</a> <a href="#">
					<div>
						<img src="images/incheon.jpg" alt="" />
					</div>
					<h2>인천</h2>
					<p>숙소 2,154개</p>
				</a> <a href="#">
					<div>
						<img src="images/gangneung.jpg" alt="" />
					</div>
					<h2>강릉</h2>
					<p>숙소 1,181개</p>
				</a>
			</div>
		</section>
		<!-- 내 근처 숙소  -->
		<section class="accomodation_near_me">
			<div class="swiper mySwiper banner">
				<h2>내 근처 숙소</h2>
				<a href="reservation.html"><img src="images/view_all.png" alt="" /></a>
				<div class="slider swiper-wrapper">
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image1.jpg" alt="" /> <img src="images/accomodation_near_me_image2.jpg" alt="" />
							</div>
							<h3>양양 더앤리조트 호텔&스파</h3>
							<p>강원도 양양군 현남면 개매길 260</p>
							<p>₩ 155,000~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image3.jpg" alt="" /> <img src="images/accomodation_near_me_image4.jpg" alt="" />
							</div>
							<h3>속초 호텔 더 블루테라</h3>
							<p>강원도 속초시 동해대로 3920</p>
							<p>₩ 80,000~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image5.jpg" alt="" /> <img src="images/accomodation_near_me_image6.jpg" alt="" />
							</div>
							<h3>속초 굿모닝호텔앤리조트</h3>
							<p>강원도 속초시 해오름로 204</p>
							<p>₩ 55,000~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image7.jpg" alt="" /> <img src="images/accomodation_near_me_image8.jpg" alt="" />
							</div>
							<h3>속초 아이파크스위트 호텔</h3>
							<p>강원도 속초시 중앙로 266</p>
							<p>₩ 79,900~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image9.jpg" alt="" /> <img src="images/accomodation_near_me_image10.jpg" alt="" />
							</div>
							<h3>체스터톤스 속초</h3>
							<p>강원도 속초시 엑스포로 109</p>
							<p>₩ 93,000~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image11.jpg" alt="" /> <img src="images/accomodation_near_me_image12.jpg" alt="" />
							</div>
							<h3>오션투유 리조트 설악비치 호텔</h3>
							<p>강원도 고성군 죽왕면 삼포해변길 9</p>
							<p>₩ 99,900~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image13.jpg" alt="" /> <img src="images/accomodation_near_me_image14.jpg" alt="" />
							</div>
							<h3>디그니티 호텔</h3>
							<p>강원도 양양군 양양읍 일출로 159-5</p>
							<p>₩ 90,000~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image15.jpg" alt="" /> <img src="images/accomodation_near_me_image16.jpg" alt="" />
							</div>
							<h3>호텔 탑스텐 정동진</h3>
							<p>강원도 강릉시 옥계면 헌화로 455-34</p>
							<p>₩ 134,750~</p>
						</a>
					</div>
					<div class="swiper-slide banner">
						<a href="#">
							<div class="image_slider">
								<img src="images/accomodation_near_me_image17.jpg" alt="" /> <img src="images/accomodation_near_me_image18.jpg" alt="" />
							</div>
							<h3>파크 하비오 호텔</h3>
							<p>강원특별자치도 강릉시 해안로 476</p>
							<p>₩ 94,000~</p>
						</a>
					</div>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</section>

		<!-- 인기 숙소 -->
		<section class="popular_accomodation">
			<h2>인기 숙소</h2>
			<a href="reservation.html"><img src="images/view_all.png" alt="" /></a>
			<div class="slider pop_slider">
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image1.jpg" alt="" /> <img src="images/pop_image2.jpg" alt="" />
						</div>
						<h3>어반스테이 속초등대</h3>
						<p>강원도 속초시 영랑해안8길 11</p>
						<p>₩ 63,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image3.jpg" alt="" /> <img src="images/pop_image4.jpg" alt="" />
						</div>
						<h3>호텔 이스티아</h3>
						<p>강원도 춘천시 남춘로 22</p>
						<p>₩ 45,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image5.jpg" alt="" /> <img src="images/pop_image6.jpg" alt="" />
						</div>
						<h3>휘닉스평창 리조트</h3>
						<p>강원도 평창군 봉평면 태기로 174</p>
						<p>₩ 159,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image7.jpg" alt="" /> <img src="images/pop_image8.jpg" alt="" />
						</div>
						<h3>아이체크호텔</h3>
						<p>강원도 동해시 한섬로 133-9</p>
						<p>₩ 55,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image9.jpg" alt="" /> <img src="images/pop_image10.jpg" alt="" />
						</div>
						<h3>춘천 더 잭슨나인스 호텔</h3>
						<p>강원도 춘천시 중앙로 193</p>
						<p>₩ 105,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image11.jpg" alt="" /> <img src="images/pop_image12.jpg" alt="" />
						</div>
						<h3>강릉 세인트존스호텔</h3>
						<p>강원도 강릉시 창해로 307</p>
						<p>₩ 199,400</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image13.jpg" alt="" /> <img src="images/pop_image14.jpg" alt="" />
						</div>
						<h3>스카이베이 호텔 경포</h3>
						<p>강원특별자치도 강릉시 해안로 476</p>
						<p>₩ 253,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="images/pop_image15.jpg" alt="" /> <img src="images/pop_image16.jpg" alt="" />
						</div>
						<h3>쏠비치 삼척 리조트</h3>
						<p>강원도 삼척시 수로부인길 453</p>
						<p>₩ 140,000</p>
						<div class="review pop_review">"혼자 조용히 쉬고싶어서 예약했어요. 예전에 친구가 묵었을 때 놀러간 적이 있는데 좋았던 기억이 있어서 다시 방문했습니다. 두시반 경에 도착했는데 흔쾌히 체크인 해주셔서 정말 감사했고 마침 조식 프로모션 기간이라 무료로 바우처를 받아서 그것도 정말 감사했어요. 조식은 3층에서 먹을 수 있는데 종류가 아주 다양하진 않았지만 다 맛있었어요. 이 호텔은 위치가 아주 좋아요. 대중교통편도 좋고 주변이 큰 상권이라 볼거리 먹을거리가 넘쳐나요 객실은 좁은 편이지만 창이 커서 답답하지 않고 길에서 들리는 소음을 제외하고는 조용한 편이에요. 침구도 편해서 푹 잤습니다. 아쉬운 점은 요금인데 재작년말에 6만원 정도였는데 1.5배 이상 인상이 되었네요ㅠ 그래도 재방문 의사 충분히 있습니다! 아 그리고 체크아웃이 12시라 여유있어서 그것도 만족이에요"</div>
					</a>
				</div>
			</div>
			<span id="pop_show_review" class="show_review">리뷰 모두 보기</span> <span class="arrow ir_pm">left_arrow</span> <span class="arrow ir_pm">right_arrow</span>
		</section>
		<!-- 이벤트 -->
		<section class="event">
			<h2>이벤트</h2>
			<div class="slider event_slider">
				<a href="#"><img src="images/event1.webp" alt="" /></a> <a href="#"><img src="images/event2.webp" alt="" /></a> <a href="#"><img src="images/event3.webp" alt="" /></a> <a href="#"><img src="images/event4.webp" alt="" /></a> <a href="#"><img src="images/event5.webp" alt="" /></a> <a href="#"><img src="images/event6.webp" alt="" /></a> <a href="#"><img src="images/event7.webp" alt="" /></a>
			</div>
		</section>
	</main>
	<div class="go_top"></div>
	<footer>
		<div class="footerInner">
			<ul>
				<li><a href="#"><b>회사소개</b></a> |</li>
				<li><a href="#">개인정보처리방침</a> |</li>
				<li><a href="#">서비스 이용약관</a> |</li>
				<li><a href="#">고객문의</a></li>
			</ul>
			<p>
				법인명: (주) Traveling 대표자: 이준섭 사업자등록번호 123-45-12345 통신판매업: 제2023-서울서초-1234호 <br /> 주소 : 서울특별시 서초구 테혜란로 92, 7층(역삼동, 케이지타워) 대표전화 : 02-1234-5678 (가맹문의 : 02-1234-5678) <br /> COPYRIGHT (C) KG F&B. All Rights Reserved.
			</p>
			<ul class="sns">
				<li><a href="#" class="ir_pm">facebook</a></li>
				<li><a href="#" class="ir_pm">twitter</a></li>
				<li><a href="#" class="ir_pm">blog</a></li>
				<li><a href="#" class="ir_pm">instagram</a></li>
				<li><a href="#" class="ir_pm">youtube</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>
