<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <!-- 장소 선택 다음 지도 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c58ef23f11133451e52c26eedfc5668&libraries=services"></script>
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
            <span class="notice_help"><u>#상세보기를 눌러 일정을 수정할 수 있습니다.</u></span>
            <ul id="planner_category">
              <li>숙소 이름</li>
              <li>여행 기간</li>
              <li>상세보기</li>
              <li>공유하기</li>
              <li>최근수정일</li>
            </ul>
            <%@ page import="com.hh.db.ReservationSort" %>
            <%
				List<MyPlanner> selList = (List<MyPlanner>) request.getAttribute("selList");
            	ReservationSort.sortByCheckInDateForPlanner(selList); // 체크인 날짜 빠른 순으로 정렬
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
    <div class="planner_modal_wrap">
            <div id="planner_modal_index">
                <button class="close_btn">&times;</button>
                <form action="" id="planner_form" method="post">
                    <!-- 모달 form -->
                    <input type="hidden" name="pid" id="rid_hidden" value=""> <!-- plan_id hidden-->
                    <div id="pm_header">
                        <p></p>
                        <!-- stay_info 테이블의 stay_name 컬럼 -->
                        <span></span>
                        <!-- reservation 테이블의 check_in_date, check_out_date 컬럼 -->
                    </div>
                    <div id="pm_contents">
                        <div class="planner_tab">
                            <ul class="tab_list">
                                <li class="is_on" data-tab="day1">
                                    <a href="#day1" class="tab_btn">1일차</a>
                                    <div id="day1" class="tab_cont">
                                        <p>2023.10.24</p> <!-- n일차별 날짜 출력 -->
                                        <div class="schedule">
                                            <input type="text" id="sample5_address" placeholder="주소" style="display:none">
                                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                                            <div id="map" style="width:150px;height:150px;margin-top:10px;display:none"></div>
                                        </div>
                                    </div>
                                </li>
                                <li data-tab="day2">
                                    <a href="#day2" class="tab_btn">2일차</a>
                                    <div id="day2" class="tab_cont">
                                        <p>2023.10.25</p> <!-- n일차별 날짜 출력 -->
                                        <div class="schedule">
                                        </div>
                                    </div>
                                </li>
                                <li data-tab="day3">
                                    <a href="#day3" class="tab_btn">3일차</a>
                                    <div id="day3" class="tab_cont">
                                        <p>2023.10.26</p> <!-- n일차별 날짜 출력 -->
                                        <div class="schedule">
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div id="pm_btn">
                            <input type="button" id="modi_btn" value="수정">
                            <input type="submit" id="modi_save_btn" value="저장">
                            <input type="button" id="can_btn" name="can_btn" value="종료">
                            <input type="button" id="modi_can_btn" name="can_btn" value="취소">
                        </div>
                </form>
            </div>
        </div>
  </body>

</html>