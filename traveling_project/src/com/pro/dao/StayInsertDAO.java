package com.pro.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;
import com.pro.mybatis.DBCon;

public class StayInsertDAO {
	static StayInsertDAO mo = new StayInsertDAO();

	public static StayInsertDAO instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public void dbInsert(StayInfo stayInfo) {		
		SqlSession s = f.openSession();		
			s.insert("stayInfoInsert", stayInfo);			
			s.commit();
			s.close();
	}
}
