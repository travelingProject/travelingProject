package com.jslee.mybatis;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jslee.stayinfo.StayInfo;

public class Select {
	// DB Select ������
	static Select mo = new Select();

	public static Select instance() {
		return mo;
	}

	SqlSessionFactory f = SqlCon.getSqlSession();

	public List<StayInfo> dbSelect() {
		// xml���ϰ� ����� java���Ͽ� �ִ� sqlSession�� open
		SqlSession s = f.openSession();
		// �Ű����� �ȿ� statement�� �ֱ� ������ statement�ȿ� ���� select ������ ������ �ȴ�.
		List<StayInfo> list = s.selectList("stayInfoSelect"); // select�� �ϳ��� �ϴ°� �ƴ϶� ������ �ϴ� ���̱� ������ selectList�� ����Ѵ�.
		s.close();
		return list;
	}
}
