package com.jslee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslee.mybatis.Select;
import com.jslee.stayinfo.StayInfo;

public class DBSelect implements Interface {

	static DBSelect dbs = new DBSelect();

	public static DBSelect instance() {
		return dbs;
	}

	@Override
	public String shData(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		Select select = Select.instance();
		// Select.java안에 있는 openSession 메소드 호출
		// Return type을 List로 맞춰준다.
		List<StayInfo> list = select.dbSelect();
		// servlet 페이지로 보내기 위해서list를 setAttribute 해준다.
		// servlet 페이지에서는 getAttribute를 하면 된다.
		re.setAttribute("list", list);
		return null;
	}
}
