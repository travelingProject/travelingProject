package com.jslee.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlCon {
	// 데이터베이스를 연결해주는 객체
	private static SqlSessionFactory sqlSession;

	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}

	static {
		try {
			// xml파일에 데이터베이스 연결에 관한 내용이 있기 때문에 xml파일의 경로를 연결한다.
			// 패키지의 경로부터 확장자명까지 정확하게 적어준다.
			String resource = "com/jslee/mybatis/conf.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactoryBuilder factory = new SqlSessionFactoryBuilder();
			sqlSession = factory.build(reader);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
