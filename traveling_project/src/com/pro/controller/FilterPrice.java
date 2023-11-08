package com.pro.controller;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.dto.FilterStayInfo;
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
		ObjectMapper objectMapper = new ObjectMapper();		
		String json = objectMapper.writeValueAsString(stayList);		
		res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(json);
		for (int i = 0; i < stayList.size(); i++) {
			System.out.println("숙소 이름 : " + stayList.get(i).getStay_name());
			System.out.println("도로명 주소" + stayList.get(i).getRoad_addr());
			System.out.println("이미지1 : " + stayList.get(i).getImage1());
			System.out.println("숙소 최소 가격 : " + stayList.get(i).getMin_room_price());
			System.out.println("평균 평점 : " + stayList.get(i).getAvg_rating());
			System.out.println("리뷰 개수 : " + stayList.get(i).getRating_count());
			System.out.println("---------------------------------------------------");
		}
		return null;
	}
}
