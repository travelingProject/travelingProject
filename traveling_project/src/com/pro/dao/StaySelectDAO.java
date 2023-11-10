package com.pro.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;
import com.pro.mybatis.DBCon;

public class StaySelectDAO {
	static StaySelectDAO staySelect = new StaySelectDAO();

	public static StaySelectDAO instance() {
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
