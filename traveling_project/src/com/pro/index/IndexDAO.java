package com.pro.index;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

import com.pro.dto.PopStayInfo;

public class IndexDAO {
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public void close() {
		try {
			stmt.close();
			rs.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public HashMap<Integer, PopStayInfo> selectPopStays() {
		HashMap<Integer, PopStayInfo> popStays = new HashMap<Integer, PopStayInfo>();
		int rowCount = 0;
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_jsp", "root", "xhddlf336!");
			stmt = con.createStatement(); 
			rs = stmt.executeQuery(
					"SELECT s.stay_name, s.road_addr, MIN(r.price) AS lowest_price, rev.review_content"
					+ "FROM stay_info"
					+ "JOIN room_info r ON s.stay_id = r.stay_id"
					+ "JOIN reservation res ON r.room_id = res.room_id"
					+ "JOIN review_info rev ON res.reservation_id = rev.reservation_id"
					+ "GROUP BY s.stay_name, s.road_addr, rev.review_content;");
			while (rs.next()) {
				rowCount++;
				PopStayInfo popStayInfo = new PopStayInfo();				
				for (int i = 0; i < rowCount; i++) {
					popStayInfo.setStayName(rs.getString("stay_name"));
					popStayInfo.setStayAddr(rs.getString("road_addr"));
					popStayInfo.setPrice(rs.getInt("price"));
					popStayInfo.setReviewContent(rs.getString("review_content"));
					popStays.put(i, popStayInfo);
					System.out.println(popStays.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return popStays;
	}
}
