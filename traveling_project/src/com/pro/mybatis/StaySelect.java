package com.pro.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.CheckInInfo;

public class StaySelect {
	static StaySelect mo = new StaySelect();

	public static StaySelect instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<CheckInInfo> dbSelect(CheckInInfo checkInInfo) {
		SqlSession s = f.openSession();
		
		List<CheckInInfo> checkInList = s.selectList("checkInInfoSelect", checkInInfo);
		
		s.close();
		
		return checkInList;
	}
}
