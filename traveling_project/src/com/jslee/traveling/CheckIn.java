package com.jslee.traveling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CheckIn {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	// Connection
	public void connect() {
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?characterEncoding=utf-8", "root", "xhddlf336!");
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
	
	// ���� ���°� ���� Ȯ���� ���� ���� ����
	public ArrayList<ReservationInfo> reservationConfirmed() {
		ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
		try {
			connect();
			rs = stmt.executeQuery("SELECT * FROM user_join , reservation where user_join.user_id = reservation.user_id and status='���� Ȯ��';");
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
	
	// ���� ���°� üũ���� ���� ���� ����
	public ArrayList<ReservationInfo> CheckInReservation() {
		ArrayList<ReservationInfo> arr = new ArrayList<ReservationInfo>();
		try {
			connect();
			rs = stmt.executeQuery("SELECT * FROM user_join , reservation where user_join.user_id = reservation.user_id and status='üũ��';");
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
	
	// üũ������ ���� ���� ����
	public void changeToCheckIn(String reservationId){
		try {
			connect();
			stmt.executeUpdate("update reservation set status='üũ��' where status='���� Ȯ��' and reservation_id ='" + reservationId + "';");
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}
	
	// ���� Ȯ������ ���� ���� ����
	public void changeToReservationConfirm(String reservationId){
		try {
			connect();
			stmt.executeUpdate("update reservation set status='���� Ȯ��' where status='üũ��' and reservation_id ='" + reservationId + "';");
		} catch(Exception e) {
			System.out.println(e);
		} finally {
			close();
		}
	}	

}