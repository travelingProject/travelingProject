package com.pro.controller;

import java.util.Enumeration;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pro.dto.StayInfo;
import com.pro.mybatis.StayInsert;

public class StayIns implements ControlQuery {

	static StayIns dbi = new StayIns();

	public static StayIns instance() {
		return dbi;
	}

	@Override
	public String dataCon(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		HttpSession session = rq.getSession();
		String uploadPath = rq.getRealPath("/stay_images");
		int size = 10 * 1024 * 1024;
		String hostId = (String) session.getAttribute("id");
		String stayName = "";		
		String latitude = "";
		String longitude = "";
		String postCode = "";
		String roadAddr = "";
		String jibunAddr = "";
		String detailAddr = "";
		String referenceAddr = "";
		String hostPhone = "";
		String content = "";
		
		String imagename1 = "";
		String imagename2 = "";
		String imagename3 = "";
		String imagename4 = "";
		String imagename5 = "";
		String origimageename1 = "";
		String origimageename2 = "";
		String origimageename3 = "";
		String origimageename4 = "";
		String origimageename5 = "";

		try {
			MultipartRequest multi = new MultipartRequest(rq, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());			
			Enumeration files = multi.getFileNames();
			stayName = multi.getParameter("name");				
			latitude = multi.getParameter("latitude");
			longitude = multi.getParameter("longitude");
			postCode = multi.getParameter("post_code");
			roadAddr = multi.getParameter("road_addr");
			jibunAddr = multi.getParameter("jibun_addr");
			detailAddr = multi.getParameter("detail_addr");
			referenceAddr = multi.getParameter("reference_addr");
			hostPhone = multi.getParameter("host_phone");
			content = multi.getParameter("content");

			String image1 = (String) files.nextElement();
			imagename1 = multi.getFilesystemName(image1);
			origimageename1 = multi.getOriginalFileName(image1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rs.setCharacterEncoding("UTF-8");
		StayInsert insert = new StayInsert();
		StayInfo stayInfo = new StayInfo();		
		stayInfo.setHostId(hostId);
		stayInfo.setStayName(stayName);
		stayInfo.setLat(latitude);
		stayInfo.setLngt(longitude);
		stayInfo.setPostCode(postCode);
		stayInfo.setRoadAddr(roadAddr);
		stayInfo.setJibunAddr(jibunAddr);
		stayInfo.setDetailAddr(detailAddr);
		stayInfo.setReferenceAddr(referenceAddr);
		stayInfo.setHostPhone(hostPhone);
		stayInfo.setImage1(imagename1);
		stayInfo.setImage2(imagename2);
		stayInfo.setImage3(imagename3);
		stayInfo.setImage4(imagename4);
		stayInfo.setImage5(imagename5);
		stayInfo.setContent(content);
		insert.dbInsert(stayInfo);
		// TODO Auto-generated method stub
		return null;
	}

}
