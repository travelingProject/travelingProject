package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.mybatis.StayIdSelect;
import com.pro.mybatis.StaySelect;

public class StaySel implements ControlQuery{
	static StaySel selStay = new StaySel();

	public static StaySel instance() {
		return selStay;
	}

	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String hostId = (String) session.getAttribute("host_id");		
		StayIdSelect stayIdSelect = new StayIdSelect();
		String stayId =  Integer.toString(stayIdSelect.dbSelect(hostId));
		System.out.println("StaySel stayId = " + stayId);		
		if(stayId.equals("0")) {
			req.setAttribute("result", false);
		} else if(stayId.equals("1")) {
			req.setAttribute("result", true);
		}
		return null;
	}
}
