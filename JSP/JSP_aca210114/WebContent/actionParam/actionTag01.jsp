<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionTag</title>
</head>
<body>
 
 <h3> 파일명 : actionTag01.jsp 입니다. 메인 페이지! </h3>
 
 <%
 	String name = "Yelin";
 %>
 <jsp:include page = "second.jsp" flush="false">
 	<jsp:param value="<%= new java.util.Date() %>" name="date"/>
 	<jsp:param value="<%= name %>" name="name"/>
 </jsp:include>
 <p>Java Server Page</p>

</body>
</html>