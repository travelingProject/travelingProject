package com.pro.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StayIdSel implements ControlQuery{
	static StayIdSel mo = new StayIdSel();

	public static StayIdSel instance() {
		return mo;
	}

	@Override
	public String dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		StayIdSelect stayIdSelect = StayIdSelect.instance();
		List <Roominfo> stayId = stayIdSelect.dbSelect(RoomInfo);
		System.out.println("stayIdSel");
		re.setCharacterEncoding("UTF-8");
		re.setAttribute("stayId", stayId);
		return stayId;
	}
}
