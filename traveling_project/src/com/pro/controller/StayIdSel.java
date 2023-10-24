package com.pro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.StayInfo;
import com.pro.mybatis.StayIdSelect;

public class StayIdSel{
	
	public int selStayId(String hostId) throws Exception {
		StayIdSelect stayIdSelect = StayIdSelect.instance();
		int stayId = stayIdSelect.dbSelect(hostId);
		return stayId;
	}
}
