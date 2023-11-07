<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 하기</title>
<link rel="stylesheet" href="css/all_stays_aside.css" />
</head>
<body>
	<aside>
		<div id="map">
			<span></span>
			<p>지도 전체 보기</p>
		</div>
		<div id="fee">
			<h3>1박당 요금</h3>
	  <div class="price-input">		      	
	    <div class="field">
	      <span>이상</span>		          
	      <span>이하</span>		          
	    </div>		        
	    <div class="field">		          
	      <input type="text" class="input-min" value="0" />
	      <span class="won">₩</span>
	      <div class="separator">-</div>
	      <input type="text" class="input-max" value="500,000" />
	      <span class="won">₩</span>
	    </div>
	  </div>
	  <div class="slider">
	    <div class="progress"></div>
	  </div>
	  <div class="range-input">
	    <input type="range" class="range-min" min="0" max="500000" value="0" step="10000" />
	    <input type="range" class="range-max" min="0" max="500000" value="500000" step="10000" />
	  </div>		      
	 </div>
	 <div id="filter">	      	
	 	<h3>평점</h3>
	 	<input id="rating5" type="checkbox" name="rating"> <label for="rating5">★ 4.5 ~ ★ 5.0</label> <br>
	 	<input id="rating4.5" type="checkbox" name="rating"> <label for="rating4.5">★ 4.0 ~ ★ 4.5</label> <br>
	 	<input id="rating4" type="checkbox" name="rating"> <label for="rating4">★ 3.5 ~ ★ 4.0</label> <br>
	 	<input id="rating3.5" type="checkbox" name="rating"> <label for="rating3.5">★ 3.0 ~ ★ 3.5</label> <br>
	 	<input id="rating3" type="checkbox" name="rating"> <label for="rating3">★ 3.0 이하</label> <br>	      	
	 	<hr>
	 	<h3>무료 서비스</h3>
	 	<input type="checkbox"> 무료 주차 <br>
	 	<input type="checkbox"> 무료 인터넷 <br>
	 	<input type="checkbox"> 무료 취소 <br>
	 	<hr>
	 	<h3>편의 시설</h3>
	 	<input type="checkbox"> 욕조 <br>
	 	<input type="checkbox"> 세탁기 <br>
	 	<input type="checkbox"> 건조기 <br>
	 	<input type="checkbox"> 에어컨 <br>
	 	<input type="checkbox"> 선풍기 <br>
	 	<input type="checkbox"> 난방 <br>
	 	<input type="checkbox"> 수영장 <br>
	 	<input type="checkbox"> 오락실 게임 <br>
	 	<input type="checkbox"> 헬스장 <br>
	 	<input type="checkbox"> 보드게임 <br>
	 	<input type="checkbox"> 바베큐 <br>
	 	<input type="checkbox"> 기본 조리도구 <br>
	 	<hr>
	 	<h3>서비스</h3>
	 	<input type="checkbox"> 아침 식사 <br>
	 	<input type="checkbox"> 청소 서비스 <br>
	 	<input type="checkbox"> 짐 보관 <br>
	 </div>
	</aside>
</body>
</html>