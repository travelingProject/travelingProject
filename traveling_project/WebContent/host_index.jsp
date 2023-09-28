<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- css -->
    <link rel="stylesheet" href="css/reset.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/host_header.css" />
    <link rel="stylesheet" href="css/host_index.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <!-- favicon -->
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Gowun+Dodum&display=swap" rel="stylesheet" />
    <!-- slider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>        
    <!-- script -->
    <title>호스트 페이지</title>
  </head>
  <body>  
    <%@ include file="host_header.jsp"%>
    <main>
    <aside>    	
    </aside>
      <h2>
      <%
      	String name = (String) session.getAttribute("name");
      	out.println(name + "님 환영합니다!");
      %></h2>
    </main>
	<%@ include file="footer.jsp"%>
  </body>
</html>
