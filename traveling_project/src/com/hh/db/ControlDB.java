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

	// connect�� �޼ҵ�
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

	// close�� �޼ҵ�
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

	// ���� DB �Է¿� �޼ҵ�
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

	// ���������� - �������� ����� �޼ҵ�
	public ArrayList<MyPageObj> getReservInfo(String user_id) {
		ArrayList<MyPageObj> rinfoList = new ArrayList<MyPageObj>();
		try {
			condb();
			// �����ȣ, üũ��&�ƿ� ��¥, �ο��� ����
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

	// �α��� ��ȿ�� üũ
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

	// ���������� ����â - �ջ� ���� ����
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

	// �ջ� ������ ���� ����� ��� ����
	public String userGrade(int sum) {
		String grade = null;
		if (sum > 1000000) {
			grade = "PLATINUM";
		} else if (sum > 500000) {
			grade = "GOLD";
		} else {
			grade = "SILVER";
		}
		return grade;
	}
	
	// ��޺� ������ ����
	public double gradePer(String grade) {
		double per = 0.0;
		if (grade.equals("PLATINUM")) {
			per = 1.0;
		} else if (grade.equals("GOLD")) {
			per = 0.5;
		} else {
			per = 0.2;
		}
		return per;
	}

}
