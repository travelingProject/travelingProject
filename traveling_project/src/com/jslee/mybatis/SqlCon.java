package com.jslee.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlCon {
	// �����ͺ��̽��� �������ִ� ��ü
	private static SqlSessionFactory sqlSession;

	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}

	static {
		try {
			// xml���Ͽ� �����ͺ��̽� ���ῡ ���� ������ �ֱ� ������ xml������ ��θ� �����Ѵ�.
			// ��Ű���� ��κ��� Ȯ���ڸ���� ��Ȯ�ϰ� �����ش�.
			String resource = "com/jslee/mybatis/conf.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
