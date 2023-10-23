package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.StayInfo;

public class StayIdSel{
	
	public int dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		StayIdSelect stayIdSelect = StayIdSelect.instance();
		HttpSession session = re.getSession();
		StayInfo stayInfo = new StayInfo();
		String hostId = (String) session.getAttribute("host_id");
		stayInfo.setHostId(hostId);
		int stayId = stayIdSelect.dbSelect(stayInfo);
		System.out.println("stayIdSel");		
		return stayId;
	}
}
