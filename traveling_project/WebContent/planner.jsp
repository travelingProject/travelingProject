<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>my page -> 내 일정</title>
    <!-- favicon -->
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet">    
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/member.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/planner.css">
    <script src="js/planner.js"></script>
    <script src="js/header.js"></script>
  </head>
<%@ page import="java.util.List" %>
<%@ page import="com.hh.DTO.MyPlanner" %>

  <body>
    <jsp:include page="login_header.jsp" />
    <!-- 마이페이지 공통 배너 -->
    <section id="member_status">
      <jsp:include page="status.jsp"/>
    </section>
    <main id="member_contents">
      <jsp:include page="./my_page_nav.jsp"/>
      <section> <!-- 이 부분에 기능 index 페이지 -->
        <div id="planner_wrap">
          <article>
            <h2>내 일정</h2>
            <ul id="planner_category">
              <li>숙소 이름</li>
              <li>여행 기간</li>
              <li>상세보기</li>
              <li>공유하기</li>
              <li>최근수정일</li>
            </ul>
            <%
				List<MyPlanner> selList = (List<MyPlanner>) request.getAttribute("selList");
            	if (selList.size() == 0) {
        	%>
            		<ul class="planner_list">
            			<li>숙소를 예약하시면 일정이 등록됩니다.</li>
            		</ul>
         	<%	
            	} else {
					for (int i = 0; i < selList.size(); i++) {		
			%>            
            <ul class="planner_list">
              <li class="planner_stay_info">
                <a href="#">
                  <span><%= selList.get(i).getLocation() %></span>
                  <h6 class="p_stay_name"><%= selList.get(i).getStay_name() %></h6>
                </a>
              </li>
              <li class="planner_trip_date"><%= selList.get(i).getCheck_in_date() %> ~ <%= selList.get(i).getCheck_out_date() %></li>
              <li><button id="show_btn" class="show_detail" onclick="detail_plan(event)" data-plan_id="<%= selList.get(i).getPlan_id() %>">상세보기</button></li>
              <li><a href="#"><img src="./images/share.png" alt=""></a></li>
              <li>
                <span class="planner_update_date"><%= selList.get(i).getModified_date() %></span>
              </li>
            </ul>
            <%
            	}
           	}
			%>
          </article>
        </div>
      </section>
    </main>
    </div>
    <div class="go_top"></div>
    <!-- footer include -->
    <jsp:include page="./footer.jsp"/>
    <!-- 수정하기 인덱스 -->
    <div id="planner_modal" class="modal">
      <div class="modal_content">
        <span class="close">&times;</span>
        <section id="planner_header">
          <h2></h2> <!-- 예약한 숙소의 이름을 추출 -->
          <h5></h5> <!-- 예약한 체크인&아웃 날짜 추출 -->
        </section>
        <section>
          <div class="main">
            <div class="tabs">
              <ul class="days_tabs">
                <!-- <li id="travel_item" class="click_days"><b>준비물</b></li> -->
              </ul>
            </div>
            <div class="contents">
              <div class="days_selected show">
                <div class="days_title">
                  <h3>1일차</h3>
                </div>
                <div class="days_sub">
                  <form>
                    <input class="select_all" type="checkbox"> 전체선택
                  </form>
                  <span id="add_plan">일정 추가하기 +</span>
                  <span id="delete_plan">일정 삭제하기 -</span>
                </div>
                <div class="days_contents">
                  <!-- 일정 추가하기 & 삭제 버튼을 통해 form 생성 및 제거 -->
                </div>
              </div>
              <div class="days_selected">
                <div class="days_title">
                  <h2>여행 준비물</h2>
                </div>
                <div class="category_items">
                  <div class="category_list">
                    <div class="item_clothes">
                      <img src="./images/clothes.png" alt="" width="36px" height="36px">
                    </div>
                    <div class="item_essential">
                      <img src="./images/essential.png" alt="" width="36px" height="36px">
                    </div>
                    <div class="item_shower">
                      <img src="./images/shower.png" alt="" width="36px" height="36px">
                    </div>
                    <div class="item_medicine">
                      <img src="./images/medicine.png" alt="" width="36px" height="36px">
                    </div>
                    <div class="item_food">
                      <img src="./images/pork.png" alt="" width="36px" height="36px">
                    </div>
                    <div class="item_etc">
                      <img src="./images/etc.png" alt="" width="36px" height="36px">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div class="modal_footer">
        <button id="modify_btn">수정하기</button>
        <button id="share_btn">공유하기</button>
      </div>
    </div>
  </body>

</html>