package com.pro.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBCon { // DB ����� Ŭ����
	
	private static SqlSessionFactory sqlSession;
	// SqlSessionFactory : DB�� ���� ���ִ� ���� (mybatis �ȿ� �ִ� Ŭ����)

	public static SqlSessionFactory getSqlSession() { // static ���� �÷��� (�̱��� Ÿ��)
		return sqlSession;
	}

	static {
		try {
			String resource = "com/pro/mybatis/dbcon.xml"; // xml ������ ��ΰ� �� (��Ű���� ������� ��)
			Reader reader = Resources.getResourceAsReader(resource); // resource(xml ����)�� �о���
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
