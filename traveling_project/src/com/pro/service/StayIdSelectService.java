package com.pro.service;

import com.pro.dao.StayIdSelectDAO;

public class StayIdSelectService{
	
	public int selStayId(String hostId) throws Exception {
		StayIdSelectDAO stayIdSelect = StayIdSelectDAO.instance();
		int stayId = stayIdSelect.dbSelect(hostId);
		return stayId;
	}
}
