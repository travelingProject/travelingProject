package com.pro.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.controller.ControlQuery;
import com.pro.dao.DetailStayDAO;
import com.pro.dto.DetailStayInfo;
import com.pro.dto.RoomInfo;

public class DetailStayService implements ControlQuery{
	static DetailStayService ssi = new DetailStayService();

	public static DetailStayService instance() {
		return ssi;
	}

	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {
		DetailStayDAO detailStayDAO = new DetailStayDAO();
		DetailStayInfo detailStayInfo = new DetailStayInfo();
		RoomInfo roomInfo = new RoomInfo();
		List <DetailStayInfo> detailStayList =  detailStayDAO.selectStayInfo(detailStayInfo);
		req.setAttribute("detailStayList", detailStayList);
		return null;
	}
}
