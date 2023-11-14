package com.pro.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pro.service.FilterPriceService;
import com.pro.service.PopStayService;
import com.pro.service.ReservationSelectService;
import com.pro.service.RoomInsertService;
import com.pro.service.StayInsertService;
import com.pro.service.StaySelectService;

public class ServletFile extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ControlQuery inter = null;

		req.setCharacterEncoding("UTF-8");
		String comm = req.getParameter("comm");
		try {
			if (comm.equals("myplan")) {
				inter = SelMyPlanInfo.instance();
				inter.dataCon(req, res);			
				RequestDispatcher dispatcher = req.getRequestDispatcher("planner.jsp");
				dispatcher.forward(req, res);
			} else if (comm.equals("hostData")) {
				inter = ReservationSelectService.instance();
				inter.dataCon(req, res);
				RequestDispatcher dispatcher = req.getRequestDispatcher("host_index.jsp");
				dispatcher.forward(req, res);
			} else if (comm.equals("stay_ins")) {
				inter = StayInsertService.instance();
				inter.dataCon(req, res);
				res.sendRedirect("add_stay_result.jsp");
			} else if (comm.equals("room_ins")) {
				inter = RoomInsertService.instance();
				inter.dataCon(req, res);
				res.sendRedirect("add_room_result.jsp");
			} else if (comm.equals("stay_sel")) {
				inter = StaySelectService.instance();
				inter.dataCon(req, res);
				String result = inter.dataCon(req, res);								
				if (result.equals("0")) {
					req.setAttribute("result", false);
				} else {
					req.setAttribute("result", true);
				}
				RequestDispatcher dispatcher = req.getRequestDispatcher("stay_sel_result.jsp");
				dispatcher.forward(req, res);
			} else if (comm.equals("plan_sel")) {
				inter = PlanSel.instance();
				inter.dataCon(req, res);
			} else if (comm.equals("delPlan")) {
				inter = PlanDel.instance();
				inter.dataCon(req, res);
			} else if (comm.equals("insPlan")) {
				inter = PlanIns.instance();
				inter.dataCon(req, res);
			} else if (comm.equals("upPlan")) {
				inter = PlanUp.instance();
				inter.dataCon(req, res);   
			} else if(comm.equals("pop_stays")) {
				inter = PopStayService.instance();
				inter.dataCon(req, res);
			} else if (comm.equals("filter")) {		        
				inter = FilterPriceService.instance();
				inter.dataCon(req, res);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
