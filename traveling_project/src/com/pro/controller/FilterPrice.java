package com.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.dto.FilterStayInfo;
import com.pro.dto.StayInfo;
import com.pro.mybatis.FilterPriceSelect;

public class FilterPrice implements ControlQuery{

	static FilterPrice fp = new FilterPrice();

	public static FilterPrice instance() {
		return fp;
	}

	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {		
		// TODO Auto-generated method stub		
		FilterPriceSelect filterPriceSelect = new FilterPriceSelect();
		List<FilterStayInfo> stayList = filterPriceSelect.dataCon(req,res);		
		return null;
	}
}
