package com.pro.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;
import com.pro.mybatis.DBCon;

public class StayIdSelectDAO {
	static StayIdSelectDAO mo = new StayIdSelectDAO();

	public static StayIdSelectDAO instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public int dbSelect(String hostId) {		
		SqlSession s = f.openSession();		
		int stayId = s.selectOne("stayIdCount" , hostId);		
		s.close();
		return stayId;
	}
}
