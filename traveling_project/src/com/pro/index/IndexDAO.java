package com.pro.index;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.NumberFormat;
import java.util.HashMap;
import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.dto.PopStayInfo;

public class IndexDAO{
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	NumberFormat nf = NumberFormat.getInstance();
//	String savePath = "/stay_images";
//	ServletContext context = getServletContext();
//	String sDownloadPath = context.getRealPath(savePath);
//	byte b[] = new byte[4096];
	

	// 인기 숙소 선택
	public HashMap<Integer, PopStayInfo> selectPopStays() {
//		System.out.println(sDownloadPath);
		HashMap<Integer, PopStayInfo> popStays = new HashMap<Integer, PopStayInfo>();		
		nf.setGroupingUsed(true);
		int rowCount = 0;
		
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "xhddlf336!");
			stmt = con.createStatement();
			rs = stmt.executeQuery("SELECT " + 
					"si.stay_id, " + 
					"si.stay_name AS stay_name, " + 
					"si.road_addr AS stay_addr, " + 
					"si.image1 AS image1, " + 
					"si.image2 AS image2, " + 
					"MIN(ri.price) AS min_room_price, " +
					"MAX(rev.review_time) AS latest_review_time, " + 
					"SUBSTRING_INDEX(GROUP_CONCAT(rev.review_content ORDER BY rev.review_time DESC), ',', 1) AS review_content " + 
					"FROM stay_info si " + 
					"JOIN room_info ri ON si.stay_id = ri.stay_id " + 
					"LEFT JOIN reservation res ON ri.room_id = res.room_id " + 
					"LEFT JOIN review_info rev ON res.reservation_id = rev.reservation_id " + 
					"GROUP BY si.stay_id, si.stay_name, si.road_addr, si.image1, si.image2 " + 
					"ORDER BY latest_review_time DESC;");
			while (rs.next()) {				
				String formattedPrice = nf.format(rs.getInt("min_room_price"));
				PopStayInfo popStayInfo = new PopStayInfo();
				popStayInfo.setStayName(rs.getString("stay_name"));
				popStayInfo.setStayAddr(rs.getString("stay_addr"));
				String image1 = rs.getString("image1");
				String image2 = rs.getString("image2");
//				String image1Path = sDownloadPath + "\\" + image1;
//				FileInputStream in = new FileInputStream(image1Path);
//				String image2Path = sDownloadPath + "\\" + image2;
//				in = new FileInputStream(image2Path);
				popStayInfo.setImage1(rs.getString("image1"));
				popStayInfo.setImage2(rs.getString("image2"));
				popStayInfo.setPrice(formattedPrice);
				popStayInfo.setReviewContent(rs.getString("review_content"));
				popStays.put(rowCount, popStayInfo);
				rowCount++;
			}
            for (int i = 0; i < rowCount; i++) {
                System.out.println(popStays.get(i).getStayName());
                System.out.println(popStays.get(i).getStayAddr());
                System.out.println(popStays.get(i).getImage1());
                System.out.println(popStays.get(i).getImage2());
                System.out.println(popStays.get(i).getPrice());
                System.out.println(popStays.get(i).getReviewContent());
            }
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return popStays;
	}
	
// close 메소드
	public void close() {		
		try {
			con.close();	
			stmt.close();
			rs.close();
		} catch(Exception e) {
			System.out.println(e);
		}
	}
}
