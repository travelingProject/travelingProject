package com.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.CheckInInfo;
import com.pro.mybatis.StaySelect;

public class StaySel implements ControlQuery {

	static StaySel dbs = new StaySel();

	public static StaySel instance() {
		return dbs;
	}

	@Override
	public String dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		StaySelect staySelect = StaySelect.instance();
		
		HttpSession session = re.getSession();
		rs.setCharacterEncoding("UTF-8");
		
		String hostId = (String) session.getAttribute("id");
		CheckInInfo checkInInfo = new CheckInInfo();
		checkInInfo.setHostId(hostId);
		
		List<CheckInInfo> checkInlist = staySelect.dbSelect(checkInInfo);
		
		re.setAttribute("checkInlist", checkInlist);
		return null;
	}
}
