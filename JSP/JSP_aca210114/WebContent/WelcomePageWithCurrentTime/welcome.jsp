<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 네비게이션 -->
<%@ include file="menu.jsp" %>

<!-- 헤더 -->
<!-- 메인 페이지 -->
<br><br>
<h2> Welcome to Web Market! </h2>
<%@ page import ="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
Date d = new Date();
SimpleDateFormat sf = new SimpleDateFormat("HH:mm:ss");
String today = sf.format(d);
%>
현재 접속 시각 : <%= today %>

<!-- footer -->
<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>