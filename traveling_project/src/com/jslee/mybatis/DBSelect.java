package com.jslee.mybatis;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jslee.stayinfo.StayInfo;

public class DBSelect {
	// DB Select ������
	static DBSelect mo = new DBSelect();

	public static DBSelect instance() {
		return mo;
	}

	SqlSessionFactory f = SqlCon.getSqlSession();

	public List<StayInfo> dbSelect() {
		// xml���ϰ� ����� java���Ͽ� �ִ� sqlSession�� open
		SqlSession s = f.openSession();
		// �Ű����� �ȿ� statement�� �ֱ� ������ statement�ȿ� ���� select ������ ������ �ȴ�.
		List<StayInfo> list = s.selectList("student_select"); // select�� �ϳ��� �ϴ°� �ƴ϶� ������ �ϴ� ���̱� ������ selectList�� ����Ѵ�.
		s.close();
		return list;
	}
}
