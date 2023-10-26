package com.pro.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.CheckInInfo;

public class RezSelect {
	static RezSelect mo = new RezSelect();

	public static RezSelect instance() {
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