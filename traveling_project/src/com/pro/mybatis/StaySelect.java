package com.pro.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;

public class StaySelect {
	static StaySelect staySelect = new StaySelect();

	public static StaySelect instance() {
		return staySelect;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public void staySelect(StayInfo stayInfo) {
		SqlSession s = f.openSession();
		s.selectOne("stayInfoInsert", stayInfo);
		s.commit();
		s.close();
	}
}
