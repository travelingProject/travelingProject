<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="javax.json.Json"%>
<%@ page import="javax.json.JsonObject"%>
<%@ page import="com.hh.db.ReservationInsert"%>
<jsp:useBean id="ins" class="com.hh.db.ControlDB" />
<%
	String customerParam = request.getParameter("customer");
	ReservationInsert rinfo = new ReservationInsert();

	if (customerParam != null && !customerParam.isEmpty()) {
		try {
			// JSON 파서 생성
			javax.json.JsonReader jsonReader = Json
					.createReader(new java.io.StringReader(java.net.URLDecoder.decode(customerParam, "UTF-8")));
			JsonObject customerJson = jsonReader.readObject();
			jsonReader.close();

			// JSON 객체에서 필요한 값을 추출
			String uid = customerJson.getString("uid");
			int price = customerJson.getInt("price");
			String rname = customerJson.getString("rname");
			String rid = customerJson.getString("rid");
			String chkin = customerJson.getString("chk_in");
			String chkout = customerJson.getString("chk_out");
			int people = customerJson.getInt("people");
			String chkinTime = customerJson.getString("chk_in_time");
			String chkoutTime = customerJson.getString("chk_out_time");

			rinfo.setUser_id(uid);
			rinfo.setRoom_id(new Integer(rid));
			rinfo.setCheck_in_date(chkin);
			rinfo.setCheck_out_date(chkout);
			rinfo.setCheck_in_time(chkinTime);
			rinfo.setCheck_out_time(chkoutTime);
			rinfo.setPeople(people);
			rinfo.setPrice(price);

			ins.reservInsert(rinfo);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#success-reservation {
    text-align: center;
    max-width: 1200px;
    margin: 130px auto;
    height: 430px;
}

#notice-reservation p {
	margin-top: 10px;
}

#go-mypage {
    margin-top: 50px;
}

#go-mypage-tag {
	background-color: #ccc;
    padding: 15px 30px;
    border-radius: 8px;
    font-weight: bold;
}

</style>
<body>
	<jsp:include page="header.jsp" />
	
	<section id="success-reservation">
		<div id="notice-reservation-wrap">
			<div id="notice-reservation">
				<h1>예약이 완료되었습니다.</h1>
				<p>호스트가 수락하면 예약이 확정됩니다. 상세 내용은 마이페이지에서 확인 가능합니다.</p>
			</div>
			<div id="go-mypage">
				<a href="my_info.jsp" id="go-mypage-tag">마이페이지로 이동하기</a>
			</div>
		</div>
	</section>

	
	<div class="go_top"></div>
	<jsp:include page="./footer.jsp" />
</body>
</html>