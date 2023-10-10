package com.pro.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pro.dto.MyPlanner;
import com.pro.mybatis.SelMyPlan;

public class SelMyPlanInfo implements ControlQuery {
	
	static SelMyPlanInfo sel = new SelMyPlanInfo(); // �̱��� ������� ��ü ����
	public static SelMyPlanInfo instance() {
		return sel;
	}

	@Override
	public String dataCon(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SelMyPlan selinfo = SelMyPlan.instance();
		
		// ���� ��������
        HttpSession session = req.getSession();
        // ���ǿ��� ����� ID ��������
        String user_id = (String) session.getAttribute("id");
        MyPlanner mp = new MyPlanner();
        mp.setUser_id(user_id);
		
		List<MyPlanner> selList = selinfo.sel(mp);
		
		req.setAttribute("selList", selList);
		return null;
	}

}
