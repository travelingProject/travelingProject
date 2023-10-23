package com.pro.controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;
import com.pro.mybatis.DBCon;

public class StayIdSelect {
	static StayIdSelect mo = new StayIdSelect();

	public static StayIdSelect instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public int dbSelect(StayInfo stayInfo) {
		SqlSession s = f.openSession();		
		int stayId = s.selectOne("stayIdSelect",stayInfo);
		System.out.println("stayId :" + stayId);
		s.close();
		return stayId;
	}
}
