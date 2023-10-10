package com.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.dto.StayInfo;
import com.pro.mybatis.StaySelect;

public class StaySel implements ControlQuery {

	static StaySel dbs = new StaySel();

	public static StaySel instance() {
		return dbs;
	}

	@Override
	public String dataCon(HttpServletRequest re, HttpServletResponse rs) throws Exception {
		StaySelect select = StaySelect.instance();
		// Select.java�ȿ� �ִ� openSession �޼ҵ� ȣ��
		// Return type�� List�� �����ش�.
		List<StayInfo> list = select.dbSelect();
		// servlet �������� ������ ���ؼ�list�� setAttribute ���ش�.
		// servlet ������������ getAttribute�� �ϸ� �ȴ�.
		re.setAttribute("list", list);
		return null;
	}
}
