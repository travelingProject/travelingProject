package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RoomIns implements ControlQuery{
	static RoomIns roomIns = new RoomIns(); // 싱글톤 방식으로 객체 생성
	public static RoomIns instance() {
		return roomIns;
	}
	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
