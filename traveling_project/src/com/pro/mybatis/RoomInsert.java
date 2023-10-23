package com.pro.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.RoomInfo;

public class RoomInsert {
	static RoomInsert mo = new RoomInsert();
	
	public static RoomInsert instance() {
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
