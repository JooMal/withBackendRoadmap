<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession();
		out.print("memberId : " + session.getAttribute("memberId") + "<br>");
	%>
	
	<form action="logoutCon" method="post">
		<input type="submit" value="logout">	
	</form>
</body>
</html>