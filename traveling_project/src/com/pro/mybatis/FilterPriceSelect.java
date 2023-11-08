package com.pro.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.FilterStayInfo;

public class FilterPriceSelect {
	static FilterPriceSelect fps = new FilterPriceSelect();

	public static FilterPriceSelect instance() {
		return fps;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<FilterStayInfo> dataCon(HttpServletRequest req, HttpServletResponse res) {
		SqlSession s = f.openSession();
		Map<String, Object> prices = new HashMap<>();
		prices.put("minPrice", Integer.parseInt(req.getParameter("minPrice")));
		prices.put("maxPrice", Integer.parseInt(req.getParameter("maxPrice")));
		List<FilterStayInfo> stayList = s.selectList("filterStaySelect", prices);		
		s.commit();
		s.close();
		return stayList;
	}
}
