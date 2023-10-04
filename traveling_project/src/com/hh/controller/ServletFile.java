package com.hh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletFile extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ControlQuery inter = null; // interface의 형태로 주머니(?)를 만들어 줌. interface는 객체를 만들 수 없다

		req.setCharacterEncoding("utf-8");
		String comm = req.getParameter("comm");

		try {
			if (comm.equals("myplan")) {
				inter = SelMyPlanInfo.instance();
				inter.dataCon(req, res);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("planner.jsp"); // Dispatcher는 forward 메소드와 함께 사용
				dispatcher.forward(req, res);
			} 

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
