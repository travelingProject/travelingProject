package com.pro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pro.dto.DetailStayInfo;
import com.pro.dto.RoomInfo;
import com.pro.mybatis.DBCon;

public class DetailStayDAO {
	static DetailStayDAO ssid = new DetailStayDAO();

	public static DetailStayDAO instance() {
		return ssid;
	}
	
	SqlSessionFactory f = DBCon.getSqlSession();
	
	public List<DetailStayInfo> selectStayInfo(DetailStayInfo detailStayInfo) {
		SqlSession s = f.openSession();
		List<DetailStayInfo> detailStayList =  s.selectList("selectDetailStayInfo",detailStayInfo);
		s.commit();
		s.close();
		return detailStayList;
	}
	
	public List<RoomInfo> selectRoomInfo() {
		RoomInfo roomInfo = new RoomInfo();
		SqlSession s = f.openSession();
		List<RoomInfo> detailRoomList = s.selectList("selectDetailRoomInfo",roomInfo);
		return detailRoomList;
	}
}
