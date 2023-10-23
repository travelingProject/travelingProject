package com.pro.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.RoomInfo;
import com.pro.mybatis.DBCon;

public class StayIdSelect {
	static StayIdSelect mo = new StayIdSelect();

	public static StayIdSelect instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<RoomInfo> dbSelect(RoomInfo roomInfo) {
		SqlSession s = f.openSession();		
		List<RoomInfo> stayId = s.selectList("stayIdSelect",roomInfo);
		System.out.println(stayId);
		s.close();		
		return stayId;
	}
}
