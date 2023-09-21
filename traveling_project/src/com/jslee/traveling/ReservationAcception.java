package com.jslee.traveling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ReservationAcception {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	// Connection
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root", "0509");
			stmt = conn.createStatement();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// Close	
	public void close() {
		try {
			stmt.close();
		} catch (Exception e){
			System.out.println(e);
		}
		try {
			conn.close();
		} catch (Exception e){
			System.out.println(e);
		}
	}
	
	// ���� ���°� ���� ������� ���� ���� ����
	public ArrayList<ReservationInfo> reservationWaiting() {
		ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
		try {
			connect();
			rs = stmt.executeQuery("SELECT * FROM user_info , reservation where user_info.user_id = reservation.user_id and status='���� ���';");
			while(rs.next()) {
				ReservationInfo rsInfo = new ReservationInfo();
				rsInfo.setReservationId(rs.getInt("reservation_id"));
				rsInfo.setUserId(rs.getString("name"));
				rsInfo.setRoomId(rs.getInt("room_id"));
				rsInfo.setCheckInDate(rs.getString("check_in_date"));
				rsInfo.setCheckOutDate(rs.getString("check_out_date"));
				rsInfo.setCheckInTime(rs.getString("check_in_time"));
				rsInfo.setCheckOutTime(rs.getString("check_out_time"));
				rsInfo.setPeople(rs.getInt("people"));
				rsInfo.setPrice(rs.getInt("price"));
				rsInfo.setPaymentTime(rs.getString("payment_time"));
				rsInfo.setStatus(rs.getString("status"));
				arr.add(rsInfo);
			}
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
		return arr;
	}
	
	// ���� ���°� ���� Ȯ���� ���� ���� ����
	public ArrayList<ReservationInfo> reservationConfirmed() {
		ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
		try {
			connect();
			rs = stmt.executeQuery("SELECT * FROM user_info , reservation where user_info.user_id = reservation.user_id and status='���� Ȯ��';");
			while(rs.next()) {
				ReservationInfo rsInfo = new ReservationInfo();
				rsInfo.setReservationId(rs.getInt("reservation_id"));
				rsInfo.setUserId(rs.getString("name"));
				rsInfo.setRoomId(rs.getInt("room_id"));
				rsInfo.setCheckInDate(rs.getString("check_in_date"));
				rsInfo.setCheckOutDate(rs.getString("check_out_date"));
				rsInfo.setCheckInTime(rs.getString("check_in_time"));
				rsInfo.setCheckOutTime(rs.getString("check_out_time"));
				rsInfo.setPeople(rs.getInt("people"));
				rsInfo.setPrice(rs.getInt("price"));
				rsInfo.setPaymentTime(rs.getString("payment_time"));
				rsInfo.setStatus(rs.getString("status"));
				arr.add(rsInfo);
			}
		} catch(Exception e) {
			System.out.println(e);			
		}
		return arr;
	}
	
	// ���� ���°� ���� �źε��� ���� ���� ����
	public ArrayList<ReservationInfo> reservationRejected() {
		ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
		try {
			connect();
			rs = stmt.executeQuery("SELECT * FROM user_info , reservation where user_info.user_id = reservation.user_id and status='���� �ź�';");
			while(rs.next()) {
				ReservationInfo rsInfo = new ReservationInfo();
				rsInfo.setReservationId(rs.getInt("reservation_id"));
				rsInfo.setUserId(rs.getString("name"));
				rsInfo.setRoomId(rs.getInt("room_id"));
				rsInfo.setCheckInDate(rs.getString("check_in_date"));
				rsInfo.setCheckOutDate(rs.getString("check_out_date"));
				rsInfo.setCheckInTime(rs.getString("check_in_time"));
				rsInfo.setCheckOutTime(rs.getString("check_out_time"));
				rsInfo.setPeople(rs.getInt("people"));
				rsInfo.setPrice(rs.getInt("price"));
				rsInfo.setPaymentTime(rs.getString("payment_time"));
				rsInfo.setStatus(rs.getString("status"));
				arr.add(rsInfo);
			}
		} catch(Exception e) {
			System.out.println(e);			
		}
		return arr;
	}
	
	// ���� ���°� ���� ��ҵ��� ���� ���� ����
		public ArrayList<ReservationInfo> reservationCancelled() {
			ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
			try {
				connect();
				rs = stmt.executeQuery("SELECT * FROM user_info , reservation where user_info.user_id = reservation.user_id and status='���� ���';");
				while(rs.next()) {
					ReservationInfo rsInfo = new ReservationInfo();
					rsInfo.setReservationId(rs.getInt("reservation_id"));
					rsInfo.setUserId(rs.getString("name"));
					rsInfo.setRoomId(rs.getInt("room_id"));
					rsInfo.setCheckInDate(rs.getString("check_in_date"));
					rsInfo.setCheckOutDate(rs.getString("check_out_date"));
					rsInfo.setCheckInTime(rs.getString("check_in_time"));
					rsInfo.setCheckOutTime(rs.getString("check_out_time"));
					rsInfo.setPeople(rs.getInt("people"));
					rsInfo.setPrice(rs.getInt("price"));
					rsInfo.setPaymentTime(rs.getString("payment_time"));
					rsInfo.setStatus(rs.getString("status"));
					arr.add(rsInfo);
				}
			} catch(Exception e) {
				System.out.println(e);			
			}
			return arr;
		}
			
	// ���� ����
	public void reservationAccept(String reservationId) {
		try {
			connect();
			stmt.executeUpdate("update reservation set status='���� Ȯ��' where status='���� ���' and reservation_id ='" + reservationId + "';");
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}
	
	// ���� �ź�
	public void reservationReject(String reservationId) {
		try {
			connect();
			stmt.executeUpdate("update reservation set status='���� �ź�' where status='���� ���' and reservation_id ='" + reservationId + "';");
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}

}