<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
	<jsp:useBean id="db" class="com.hh.db.ControlDB" />
	<jsp:useBean id="obj" class="com.hh.db.ReviewObj" />
<%
	request.setCharacterEncoding("UTF-8");

    String uploadPath = request.getRealPath("/images/review");
	int size = 10 * 1024 * 1024;
    
	// 리뷰 정보
	int rid = 0;
	String rtitle = "";
	String rcontent = "";
	double rating = 0;
	
	// 이미지
	String imagename1 = "";
	String imagename2 = "";
	String imagename3 = "";
	String imagename4 = "";
	String imagename5 = "";
	String origimagename1 = "";
	String origimagename2 = "";
	String origimagename3 = "";
	String origimagename4 = "";
	String origimagename5 = "";
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		
		rid = Integer.parseInt(multi.getParameter("rid"));
		rtitle = multi.getParameter("rtitle");
		rcontent = multi.getParameter("rcontent");
		rating = Double.parseDouble(multi.getParameter("rating"));
		
		imagename1 = multi.getParameter("r_image1");
		imagename2 = multi.getParameter("r_image2");
		imagename3 = multi.getParameter("r_image3");
		imagename4 = multi.getParameter("r_image4");
		imagename5 = multi.getParameter("r_image5");

		// 이미지 업로드
		String[] fieldNames = { "r_image1", "r_image2", "r_image3", "r_image4", "r_image5" };

		for (int i = 0; i < fieldNames.length; i++) {
		    String fieldName = fieldNames[i];
		    String newImageName = multi.getFilesystemName(fieldName);

		    if (newImageName != null) {
		        // 이미지 파일이 업로드되었을 때만 새 이미지 파일명을 저장
		        // 나머지 이미지 파일 필드도 동일한 방식으로 처리
		        if (i == 0) {
		            obj.setImage_path01(newImageName);
		        } else if (i == 1) {
		            obj.setImage_path02(newImageName);
		        } else if (i == 2) {
		            obj.setImage_path03(newImageName);
		        } else if (i == 3) {
		            obj.setImage_path04(newImageName);
		        } else if (i == 4) {
		            obj.setImage_path05(newImageName);
		        }
		    }
		}

		// 이미지 파일이 업로드되지 않았을 때는 기존 이미지 파일 경로를 유지
		// 나머지 이미지 파일 필드도 동일한 방식으로 처리
		if (imagename1 != null && imagename1.isEmpty() == false) {
		    obj.setImage_path01(imagename1);
		}
		if (imagename2 != null && imagename2.isEmpty() == false) {
		    obj.setImage_path02(imagename2);
		}
		if (imagename3 != null && imagename3.isEmpty() == false) {
		    obj.setImage_path03(imagename3);
		}
		if (imagename4 != null && imagename4.isEmpty() == false) {
		    obj.setImage_path04(imagename4);
		}
		if (imagename5 != null && imagename5.isEmpty() == false) {
		    obj.setImage_path05(imagename5);
		}
		
		obj.setReservation_id(rid);
		obj.setRtitle(rtitle);
		obj.setRcontent(rcontent);
		obj.setRating(rating);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
    
	db.reviewUpdate(obj);
    response.sendRedirect("review_control.jsp");
%>