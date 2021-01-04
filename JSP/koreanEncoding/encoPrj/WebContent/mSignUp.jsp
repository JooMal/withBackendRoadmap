<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!
	String mName;
	String mNickName;
	%>
	
	<%
	mName = request.getParameter("m_name");
	mNickName = request.getParameter("m_nickname");
	%>
	
	이름 : <%= mName %>
	별명 : <%= mNickName %>
</body>
</html>