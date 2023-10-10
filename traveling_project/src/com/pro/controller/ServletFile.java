package com.pro.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.controller.StayIns;
import com.pro.controller.StaySel;

public class ServletFile extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ControlQuery inter = null; // interface�� ���·� �ָӴ�(?)�� ����� ��. interface�� ��ü�� ���� �� ����

		req.setCharacterEncoding("utf-8");
		String comm = req.getParameter("comm");

		try {
			if (comm.equals("myplan")) {
				inter = SelMyPlanInfo.instance();
				inter.dataCon(req, res);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("planner.jsp"); // Dispatcher�� forward �޼ҵ�� �Բ� ���
				dispatcher.forward(req, res);
			} else if (comm.equals("sel")) {
				inter = StaySel.instance();
				inter.dataCon(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("print.jsp");
				dispatcher.forward(req, res);
			} else if (comm.equals("ins")) {
				inter = StayIns.instance();
				inter.dataCon(req, res);
				res.sendRedirect("add_accomodation_result.jsp");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
