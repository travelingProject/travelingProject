package com.hh.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hh.DTO.MyPlanner;

public class SelMyPlan {
	
	static SelMyPlan sel = new SelMyPlan();
	public static SelMyPlan instance() {
		return sel;
	}
	
	SqlSessionFactory sqlSession = DBCon.getSqlSession();
	
	public List<MyPlanner> sel(MyPlanner mp) {
		SqlSession sqls = sqlSession.openSession();
		
		List<MyPlanner> selList = sqls.selectList("sel", mp);
		
		sqls.close();
		
		return selList;
	}
}
