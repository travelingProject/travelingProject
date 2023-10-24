package com.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.CheckInInfo;
import com.pro.mybatis.RezSelect;

public class RezSel implements ControlQuery {

	static RezSel dbs = new RezSel();

	public static RezSel instance() {
		return dbs;
	}

	@Override
	public String dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		RezSelect rezSelect = RezSelect.instance();
		
		HttpSession session = re.getSession();
		rs.setCharacterEncoding("UTF-8");
		
		String hostId = (String) session.getAttribute("host_id");
		CheckInInfo checkInInfo = new CheckInInfo();
		checkInInfo.setHostId(hostId);
		
		List<CheckInInfo> checkInlist = rezSelect.dbSelect(checkInInfo);
		
		re.setAttribute("checkInlist", checkInlist);
		return null;
	}
}
