package com.pro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.CheckInInfo;
import com.pro.mybatis.DBCon;

public class ReservationSelectDAO {
	static ReservationSelectDAO rs = new ReservationSelectDAO();

	public static ReservationSelectDAO instance() {
		return rs;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<CheckInInfo> dbSelect(CheckInInfo checkInInfo) {
		SqlSession s = f.openSession();
		
		List<CheckInInfo> checkInList = s.selectList("checkInInfoSelect", checkInInfo);		
		
		s.close();
		
		return checkInList;
	}
}
