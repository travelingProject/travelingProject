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

		ControlQuery inter = null;

		req.setCharacterEncoding("utf-8");
		String comm = req.getParameter("comm");

		try {
			if (comm.equals("myplan")) {
				inter = SelMyPlanInfo.instance();
				inter.dataCon(req, res);				
				RequestDispatcher dispatcher = req.getRequestDispatcher("planner.jsp");
				dispatcher.forward(req, res);
			} else if (comm.equals("hostData")) {
				inter = StaySel.instance();
				inter.dataCon(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("host_index.jsp");
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
