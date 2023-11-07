package com.pro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.FilterStayInfo;
import com.pro.mybatis.DBCon;

public class PopStayDAO {
	static PopStayDAO ps = new PopStayDAO();

	public static PopStayDAO instance() {
		return ps;
	}
	
	SqlSessionFactory f = DBCon.getSqlSession();
	
	public List<FilterStayInfo> dbSelect() {
		SqlSession s = f.openSession();
		List<FilterStayInfo> stayList = s.selectList("popStaySelect");						
		s.close();
		return stayList;
	}
}
