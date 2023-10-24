package com.pro.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;

public class StayIdSelect {
	static StayIdSelect mo = new StayIdSelect();

	public static StayIdSelect instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public int dbSelect(String hostId) {		
		SqlSession s = f.openSession();		
		int stayId = s.selectOne("stayIdCount" , hostId);
		System.out.println("hostId is " + hostId);
		System.out.println("count is " + stayId);
		s.close();
		return stayId;
	}
}
