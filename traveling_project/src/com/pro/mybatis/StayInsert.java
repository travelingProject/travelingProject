package com.pro.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;

public class StayInsert {
	static StayInsert mo = new StayInsert();
	
	public static StayInsert instance() {
		return mo;
	}
	
	SqlSessionFactory f = DBCon.getSqlSession();
	
	public void dbInsert(StayInfo user){
		SqlSession s = f.openSession();
		s.insert("stayInfoInsert", user);
		s.commit();
		s.close();
	}
}