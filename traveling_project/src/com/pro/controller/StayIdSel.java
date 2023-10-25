package com.pro.controller;

import com.pro.mybatis.StayIdSelect;

public class StayIdSel{
	
	public int selStayId(String hostId) throws Exception {
		StayIdSelect stayIdSelect = StayIdSelect.instance();
		int stayId = stayIdSelect.dbSelect(hostId);
		return stayId;
	}
}
