package com.pro.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.FilterStayInfo;
import com.pro.mybatis.DBCon;

public class FilterPriceDAO {
	static FilterPriceDAO fps = new FilterPriceDAO();

	public static FilterPriceDAO instance() {
		return fps;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<FilterStayInfo> dataCon(HttpServletRequest req, HttpServletResponse res) {
		SqlSession s = f.openSession();
		double rating = 0.0; // 기본값을 0으로 초기화
		int minPrice = 0;
		int maxPrice = 500000;

		try {
		    // req.getParameter("rating")이 null이 아니면 파싱을 시도합니다.
		    String ratingParam = req.getParameter("rating");
		    String minPriceParam = req.getParameter("minPrice");
		    String maxPriceParam = req.getParameter("maxPrice");
		    if (ratingParam != null && !ratingParam.isEmpty()) {
		        rating = Double.parseDouble(ratingParam);
		    }
		    if(minPriceParam != null && !minPriceParam.isEmpty()) {
		    	minPrice = Integer.parseInt(minPriceParam);
		    }
		    if(maxPriceParam != null && !maxPriceParam.isEmpty()) {
		    	maxPrice = Integer.parseInt(maxPriceParam);
		    }
		} catch (NumberFormatException e) {
		    // 파라미터 값이 숫자로 파싱할 수 없는 경우 예외를 처리합니다.
		    // rating은 이미 0으로 초기화되어 있습니다.
		}
		Map<String, Object> prices = new HashMap<>();
		prices.put("minPrice", minPrice);
		prices.put("maxPrice", maxPrice);
		prices.put("rating",rating);
		List<FilterStayInfo> stayList = s.selectList("filterStaySelect", prices);
		s.close();
		return stayList;
	}
}
