package com.pro.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.RoomInfo;
import com.pro.mybatis.DBCon;

public class RoomInsertDAO {
	static RoomInsertDAO mo = new RoomInsertDAO();
	
	public static RoomInsertDAO instance() {
		return mo;
	}
	
	SqlSessionFactory f = DBCon.getSqlSession();
	
	public void dbInsert(RoomInfo roomInfo) {
		SqlSession s = f.openSession();
		s.insert("roomInfoInsert", roomInfo);
		s.commit();
		s.close();
	}
}
