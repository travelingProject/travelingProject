package com.pro.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.StayInfo;

public class StaySelect {
	// DB Select ������
	static StaySelect mo = new StaySelect();

	public static StaySelect instance() {
		return mo;
	}

	SqlSessionFactory f = DBCon.getSqlSession();

	public List<StayInfo> dbSelect() {
		// xml���ϰ� ����� java���Ͽ� �ִ� sqlSession�� open
		SqlSession s = f.openSession();
		// �Ű����� �ȿ� statement�� �ֱ� ������ statement�ȿ� ���� select ������ ������ �ȴ�.
		List<StayInfo> list = s.selectList("stayInfoSelect"); // select�� �ϳ��� �ϴ°� �ƴ϶� ������ �ϴ� ���̱� ������ selectList�� ����Ѵ�.
		s.close();
		return list;
	}
}
