package com.jslee.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jslee.stayinfo.StayInfo;

public class Insert {
	static DBSelect mo = new DBSelect();
	
	public static DBSelect instance() {
		return mo;
	}
	
	SqlSessionFactory f = SqlCon.getSqlSession();
	
	public void dbInsert(StayInfo user){
		SqlSession s = f.openSession();
		s.insert("student_insert", user);
		s.commit();
		s.close();
	}
}
