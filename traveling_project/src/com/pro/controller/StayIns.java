package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.StayInfo;
import com.pro.mybatis.StayInsert;

public class StayIns implements ControlQuery{

	static StayIns dbi = new StayIns();

	public static StayIns instance() {
		return dbi;
	}	

	@Override
	public String dataCon(HttpServletRequest rq, HttpServletResponse rs) throws Exception {		
		HttpSession session = rq.getSession();
		rs.setCharacterEncoding("UTF-8");
		StayInsert insert = new StayInsert();
		StayInfo stayInfo = new StayInfo();		
		String hostId = (String) session.getAttribute("id");
		stayInfo.setHostId(hostId);
		stayInfo.setStayName(rq.getParameter("stay_name"));
		stayInfo.setLat(rq.getParameter("latitude"));
		stayInfo.setLngt(rq.getParameter("longitude"));
		stayInfo.setPostCode(rq.getParameter("post_code"));
		stayInfo.setRoadAddr(rq.getParameter("road_addr"));
		stayInfo.setJibunAddr(rq.getParameter("jibun_addr"));
		stayInfo.setDetailAddr(rq.getParameter("detail_addr"));
		stayInfo.setExtraAddr(rq.getParameter("reference_addr"));
		stayInfo.setHostPhone(rq.getParameter("host_phone"));
		stayInfo.setImage1(rq.getParameter("stay_image1"));	
		stayInfo.setImage1(rq.getParameter("stay_image2"));	
		stayInfo.setImage1(rq.getParameter("stay_image3"));	
		stayInfo.setImage1(rq.getParameter("stay_image4"));	
		stayInfo.setImage1(rq.getParameter("stay_image5"));	
		stayInfo.setContents(rq.getParameter("contents"));
		insert.dbInsert(stayInfo);
		// TODO Auto-generated method stub
		return null;
	}

}
