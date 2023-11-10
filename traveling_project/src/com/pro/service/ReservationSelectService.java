package com.pro.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.controller.ControlQuery;
import com.pro.dao.ReservationSelectDAO;
import com.pro.dto.CheckInInfo;

public class ReservationSelectService implements ControlQuery {

	static ReservationSelectService dbs = new ReservationSelectService();

	public static ReservationSelectService instance() {
		return dbs;
	}

	@Override
	public String dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		ReservationSelectDAO rezSelect = ReservationSelectDAO.instance();
		
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
