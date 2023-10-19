<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String uploadPath=request.getRealPath("/upload");
	/* 첨부파일을 업로드할 경로이다. */
	
	int size = 10*1024*1024;
	/* 업로드하는 파일의 크기이다. */
	String name="";	
	String filename1="";
	String origfilename1="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());
		/* fileUploadForm에서 enctype="multipart/form-data"을 사용했기 때문에 MultipartRequest를 사용해야 된다. */
		name=multi.getParameter("name");
		/* request.getParameter("")가 아닌 multi.getParameter("")을 사용한다. */		
		
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1);
		
		out.println(name);
		out.println(filename1);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>