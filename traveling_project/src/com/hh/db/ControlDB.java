package com.hh.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ControlDB {
	Connection con = null;
	Statement sta = null;
	ResultSet rs = null;

	// connect용 메소드
	// db 비밀번호
	public void condb() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root",
					"0509");
			sta = con.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// close용 메소드
	public void discon() {
		try {
			sta.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 리뷰 DB 입력용 메소드
	public void insertReview(ReviewObj obj) {
		try {
			condb();
			sta.executeUpdate(
					"INSERT INTO review_info (reservation_id, review_title, review_content, rating, review_time) VALUES ("
							+ obj.getReservation_id() + ", '" + obj.getRtitle() + "', '" + obj.getRcontent() + "', "
							+ obj.getRating() + ", " + "date_format(now(), '%Y%m%d%H%i%s'));");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}

	// 마이페이지 - 예약정보 추출용 메소드
	public ArrayList<MyPageObj> getReservInfo(String user_id) {
		ArrayList<MyPageObj> rinfoList = new ArrayList<MyPageObj>();
		try {
			condb();
			// 예약번호, 체크인&아웃 날짜, 인원수 추출
			rs = sta.executeQuery(
					"SELECT r.reservation_id, r.check_in_date, r.check_out_date, r.people, si.stay_name, si.location "
							+ "FROM reservation r " + "JOIN room_info ri ON r.room_id = ri.room_id "
							+ "JOIN stay_info si ON ri.stay_id = si.stay_id WHERE user_id = '" + user_id + "';");
			while (rs.next()) {
				MyPageObj rinfo = new MyPageObj();
				rinfo.setReservation_id(rs.getString("reservation_id"));
				rinfo.setCheckInDate(rs.getString("check_in_date"));
				rinfo.setCheckOutDate(rs.getString("check_out_date"));
				rinfo.setPeople(rs.getInt("people"));
				rinfo.setStayName(rs.getString("stay_name"));
				rinfo.setLocation(rs.getString("location"));
				rinfoList.add(rinfo);
			}
		} catch (Exception e) {

		} finally {
			discon();
		}
		return rinfoList;
	}

	// 로그인 유효성 체크
	public LoginObj chkLoginId(String id, String pw) {
		LoginObj logChk = new LoginObj();
		try {
			condb();
			rs = sta.executeQuery("SELECT user_id, pw FROM user_join WHERE user_id = '" + id + "';");
			while (rs.next()) {
				logChk.setId(rs.getString("user_id"));
				logChk.setPw(rs.getString("pw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return logChk;
	}

	// 마이페이지 상태창 - 합산 가격 추출
	public int statusPrice(String id) {
		int sum = 0;
		try {
			condb();
			rs = sta.executeQuery("SELECT SUM(price) FROM reservation WHERE user_id = '" + id + "';");
			while (rs.next()) {
				sum = rs.getInt("SUM(price)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return sum;
	}
	
	// 마지막 여행 다녀온지 n일 추출
	public int lastTravel(String id) {
		int ndays = 0;
		try {
			condb();
			rs = sta.executeQuery(
					"SELECT DATEDIFF(NOW(), MAX(check_out_date)) AS days_since_last_travel "
					+ "FROM reservation "
					+ "WHERE user_id = '" + id + "' "
					+ "AND check_out_date < CURDATE();");
			while (rs.next()) {
				ndays = rs.getInt("days_since_last_travel");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return ndays;
	}
	
	// 현재날짜 기준 총 숙박일수 추출
	public int totalStay(String id) {
		int tstay = 0;
		try {
			condb();
			rs = sta.executeQuery(
					"SELECT SUM(DATEDIFF(check_out_date, check_in_date)) AS total_stay "
					+ "FROM reservation "
					+ "WHERE user_id = '" + id + "' "
					+ "AND check_out_date < CURDATE();");
			while (rs.next()) {
				tstay = rs.getInt("total_stay");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return tstay;
	}
	
	// 로그인 한 사용자의 누적 마일리지 추출
	public int totalMileage(String id) {
		int mil = 0;
		try {
			condb();
			rs = sta.executeQuery("SELECT total_mileage FROM mileage WHERE user_id = '" + id + "';");
			while (rs.next()) {
				mil = rs.getInt("total_mileage");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return mil;
	}
}
