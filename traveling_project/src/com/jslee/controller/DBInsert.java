package com.jslee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslee.mybatis.Insert;
import com.jslee.stayinfo.StayInfo;

public class DBInsert implements Interface{

	static DBInsert dbi = new DBInsert();

	public static DBInsert instance() {
		return dbi;
	}

	@Override
	public String shData(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		rs.setCharacterEncoding("UTF-8");
		Insert insert = new Insert();
		StayInfo stayInfo = new StayInfo();
		stayInfo.setStayName(rq.getParameter("stay_name"));
		stayInfo.setLat(rq.getParameter("latitude"));
		stayInfo.setLngt(rq.getParameter("longitude"));
		stayInfo.setPostCode(rq.getParameter("post_code"));
		stayInfo.setRoadAddr(rq.getParameter("road_addr"));
		stayInfo.setJibunAddr(rq.getParameter("jibun_addr"));
		stayInfo.setDetailAddr(rq.getParameter("detail_addr"));
		stayInfo.setExtraAddr(rq.getParameter("reference_addr"));
		stayInfo.setHostPhone(rq.getParameter("host_phone"));
		stayInfo.setImage1(rq.getParameter("stay_image"));		
		stayInfo.setContents(rq.getParameter("contents"));
		insert.dbInsert(stayInfo);
		// TODO Auto-generated method stub
		return null;
	}

}
