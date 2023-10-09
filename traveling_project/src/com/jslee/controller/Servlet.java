package com.jslee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jslee.mybatis.Select;



public class Servlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest rq, HttpServletResponse rs) throws ServletException, IOException {		
		rq.setCharacterEncoding("UTF-8");
		// DBExtract에서 생성한 static 객체에 있는 instance 메소드 호출
		// 인터페이스 주머니 하나만 생성
		// ↓
		// select, insert, delete 등 기능을 새로 만들 때마다 새롭게 객체를 생성해서 인터페이스에 담으면 된다.
		String comm = rq.getParameter("comm");
		Interface inter = null;
		// override된 메소드 호출
		try {
			if (comm.equals("sel")) {
				inter = DBSelect.instance();
				inter.shData(rq, rs);
				RequestDispatcher dispatcher = rq.getRequestDispatcher("print.jsp");
				dispatcher.forward(rq, rs);
			} else if (comm.equals("ins")) {
				inter = DBInsert.instance();
				inter.shData(rq, rs);
				rs.sendRedirect("result.jsp");
			}
			// List<Info> list = rq.getAttribute("list");
			// print.jsp로 setAttribute 되어있는 값을 넘기기 위해서 RequestDispatcher를 사용
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
