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
		if(session.getAttribute("memberId") != null) {
			response.sendRedirect("loginOk.jsp");
		}
	%>
	<form action="loginCon" method="post">
		ID : <input type="text" name="mId">
		PW : <input type="password" name="mPw">
		<input type="submit" value="login">	
	</form>
</body>
</html>