package com.pro.svc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.controller.ControlQuery;
import com.pro.dao.StayManagementDAO;
import com.pro.dto.DetailStayInfo;
import com.pro.dto.RoomInfo;

public class DetailStayService implements ControlQuery{
	static DetailStayService ssi = new DetailStayService();

	public static DetailStayService instance() {
		return ssi;
	}

	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int stay_id = Integer.parseInt((String) req.getParameter("stay_id"));
		StayManagementDAO stayManagementDAO = StayManagementDAO.instance();
		List<DetailStayInfo> detailStayList =  stayManagementDAO.selectStayInfo(stay_id);
		req.setAttribute("detailStayList", detailStayList);
		return null;
	}
}
