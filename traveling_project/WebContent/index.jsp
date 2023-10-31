<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pro.index.IndexDAO" %>
<%@ page import="com.pro.dto.PopStayInfo" %>
<%@ page import="java.util.HashMap" %>
<%
	IndexDAO indexDAO = new IndexDAO(); 
	String path = request.getContextPath();		
	HashMap<Integer, PopStayInfo> popStays = indexDAO.selectPopStays();	
%>
<!DOCTYPE html>
<html>
<head>	
    <!-- favicon -->
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon"/>
	<%@ include file="header.jsp"%>	
</head>
<body>
	<section id="video">
		<video autoplay loop muted>
			<source src="video/Banner.mp4" type="video/mp4" width="100%" />
		</video>
	</section>	
	<main>
		<!-- 호텔 추천 -->
		<section class="hotel_recommend">
			<h2>숙소 추천</h2>
			<a href="reservation.html"><img src="images/view_all.png" alt="" /></a>
			<div class="slider rec_slider">
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(0).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(0).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(0).getStayName() %></h3>
						<p><%=popStays.get(0).getStayAddr() %></p>
						<p>₩ <%=popStays.get(0).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(0).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(1).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(1).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(1).getStayName() %></h3>
						<p><%=popStays.get(1).getStayAddr() %></p>
						<p>₩ <%=popStays.get(1).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(1).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(2).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(2).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(2).getStayName() %></h3>
						<p><%=popStays.get(2).getStayAddr() %></p>
						<p>₩ <%=popStays.get(2).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(2).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(3).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(3).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(3).getStayName() %></h3>
						<p><%=popStays.get(3).getStayAddr() %></p>
						<p>₩ <%=popStays.get(3).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(3).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(4).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(4).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(4).getStayName() %></h3>
						<p><%=popStays.get(4).getStayAddr() %></p>
						<p>₩ <%=popStays.get(4).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(4).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(5).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(5).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(5).getStayName() %></h3>
						<p><%=popStays.get(5).getStayAddr() %></p>
						<p>₩ <%=popStays.get(5).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(5).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(6).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(6).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(6).getStayName() %></h3>
						<p><%=popStays.get(6).getStayAddr() %></p>
						<p>₩ <%=popStays.get(6).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(6).getReviewContent() %>"</div>
					</a>
				</div>
				<div>
					<a href="#">
						<div class="image_slider">
							<img src="<%=path %>/stay_images/<%=popStays.get(7).getImage1() %>" alt="" />
							<img src="<%=path %>/stay_images/<%=popStays.get(7).getImage2() %>" alt="" />
						</div>
						<h3><%=popStays.get(7).getStayName() %></h3>
						<p><%=popStays.get(7).getStayAddr() %></p>
						<p>₩ <%=popStays.get(7).getPrice() %> ~</p>
						<div class="rec_review review">"<%=popStays.get(7).getReviewContent() %>"</div>
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
				</a>
				<a href="#">
					<div>
						<img src="images/seoul.jpg" alt="" />
					</div>
					<h2>서울</h2>
					<p>숙소 5,923개</p>
				</a>
				<a href="#">
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
	<%@ include file="footer.jsp"%>
</body>
</html>
