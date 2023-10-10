package com.hh.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ControlDB {
	Connection con = null;
	Statement sta = null;
	ResultSet rs = null;

	// connect�� �޼ҵ�
	// db ��й�ȣ
	public void condb() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root",
					"xhddlf336!");
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
							+ obj.getRating() + ", now());");
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
					"SELECT r.reservation_id, DATE_FORMAT(r.check_in_date, '%Y.%m.%d') AS check_in_date, DATE_FORMAT(r.check_out_date, '%Y.%m.%d') AS check_out_date, r.people, si.stay_name, si.location "
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
	
	// ���� �ۼ� ���θ� ĳ���ϱ� ���� ���� ����
	private Map<String, List<Integer>> userReviewCache = new HashMap<>();

	// ���� �ۼ��ߴ��� ���� ��ȸ��
	public List<Integer> hasReview(String id) {
	    // ĳ�ÿ��� ���� ������ �������� �õ�
	    List<Integer> cachedReviews = userReviewCache.get(id);

	    if (cachedReviews != null) {
	        // ĳ�ÿ��� ���� ������ ã���� ��� �ٷ� ��ȯ
	        return cachedReviews;
	    } else {
	        // ĳ�ÿ� ���� ������ ���� ��� �����ͺ��̽� ��ȸ
	        List<Integer> reviews = new ArrayList<>();
	        try {
	            condb();
	            rs = sta.executeQuery(
	            		"SELECT re.reservation_id AS review_exists "
	            		+ "FROM reservation r "
	            		+ "LEFT JOIN review_info re ON r.reservation_id = re.reservation_id "
	            		+ "WHERE r.user_id = '" + id + "';"
	            );
	            while (rs.next()) {
	                int reviewId = rs.getInt("review_exists");
	                reviews.add(reviewId);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            discon();
	        }

	        // ��ȸ�� ���� ������ ĳ�ÿ� ����
	        userReviewCache.put(id, reviews);

	        return reviews;
	    }
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
	
	// ������ ���� �ٳ���� n�� ����
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
	
	// ���糯¥ ���� �� �����ϼ� ����
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
	
	// �α��� �� ������� ���� ���ϸ��� ����
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
	
	// �ۼ��� ���� ��� ����
	public ArrayList<MyPageObj> reviewControlPage(String id) {
		ArrayList<MyPageObj> rivConList = new ArrayList<MyPageObj>();
		try {
			condb();
			rs = sta.executeQuery(
					"SELECT r.reservation_id, si.stay_name, si.location, DATE_FORMAT(r.check_in_date, '%Y.%m.%d') AS check_in_date, DATE_FORMAT(r.check_out_date, '%Y.%m.%d') AS check_out_date, DATE_FORMAT(rv.review_time, '%Y.%m.%d') AS review_time " 
					+ "FROM reservation AS r "
					+ "JOIN room_info AS ri ON r.room_id = ri.room_id "
					+ "JOIN stay_info AS si ON ri.stay_id = si.stay_id "
					+ "JOIN review_info AS rv ON r.reservation_id = rv.reservation_id "
					+ "WHERE r.user_id = '" + id + "' AND rv.review_time IS NOT NULL;"
					);
			while(rs.next()) {
				MyPageObj rivCon = new MyPageObj();
				rivCon.setReservation_id(rs.getString("reservation_id"));
				rivCon.setStayName(rs.getString("stay_name"));
				rivCon.setLocation(rs.getString("location"));
				rivCon.setCheckInDate(rs.getString("check_in_date"));
				rivCon.setCheckOutDate(rs.getString("check_out_date"));
				rivCon.setReviewTime(rs.getString("review_time"));
				rivConList.add(rivCon);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return rivConList;
	}
	
	// ���� ���� ��ư Ŭ���� ���� ���� ����
	public ReviewObj reviewReplace(String rid) {
		ReviewObj riv = new ReviewObj();
		try {
			condb();
			rs = sta.executeQuery("SELECT * FROM review_info WHERE reservation_id = " + rid + ";");
			while (rs.next()) {
				riv.setRtitle(rs.getString("review_title"));
				riv.setRcontent(rs.getString("review_content"));
				riv.setRating(rs.getDouble("rating"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
		return riv;
	}
	
	// ���� ���� update
	public void reviewUpdate(ReviewObj obj) {
		try {
			condb();
			sta.executeUpdate("UPDATE review_info SET review_title = '" + obj.getRtitle()
							+ "', review_content = '" + obj.getRcontent()
							+ "', rating = " + obj.getRating()
							+ ", review_time = now() WHERE reservation_id = " + obj.getReservation_id() + ";");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}
	
	// ���� ����
	public void reviewDelete(String rid) {
		try {
			condb();
			sta.executeUpdate("DELETE FROM review_info WHERE reservation_id = " + rid + ";");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			discon();
		}
	}
}
