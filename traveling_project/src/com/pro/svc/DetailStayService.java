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
		StayManagementDAO stayManagementDAO = StayManagementDAO.instance();
		DetailStayInfo detailStayInfo = new DetailStayInfo();
		RoomInfo roomInfo = new RoomInfo();
		List<DetailStayInfo> detailStayList =  stayManagementDAO.selectStayInfo(detailStayInfo);
		req.setAttribute("detailStayList", detailStayList);
		return null;
	}
}
