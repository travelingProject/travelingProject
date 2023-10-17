<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>다중 파일 업로드</title>
</head>
<body>
    <form action="FileUpload.jsp" method="post" enctype="multipart/form-data">
        <input type="file" name="file" id="fileInput" multiple>
        <input type="submit" value="업로드">
    </form>
</body>
</html>
