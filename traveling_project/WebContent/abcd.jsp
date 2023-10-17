<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>다중 파일 업로드 결과</title>
</head>
<body>
    <h1>다중 파일 업로드 결과</h1>
    <ul>
        <%
            if (ServletFileUpload.isMultipartContent(request)) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List<FileItem> items = null;

                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }

                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        // 파일을 저장하거나 처리하는 로직을 추가하세요
        %>
                        <li><%= fileName %></li>
        <%
                    }
                }
            }
        %>
    </ul>
</body>
</html>
