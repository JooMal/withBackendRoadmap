<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dto.Phone" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Enumeration paramNames = request.getParameterNames();
while (paramNames.hasMoreElements()) {
	String name = (String)paramNames.nextElement();
	out.println("<a> parameter Name : "+name+"<br>\n");
	String param = request.getParameter(name);
	out.println("<a> parameter value : "+param+"<br>\n");
}

%>

</body>
</html>