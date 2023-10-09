package com.jslee.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jslee.stayinfo.StayInfo;

public class Insert {
	static Select mo = new Select();
	
	public static Select instance() {
		return mo;
	}
	
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void dbInsert(StayInfo user){
		SqlSession s = f.openSession();
		s.insert("stayInfoInsert", user);
		s.commit();
		s.close();
	}
}
