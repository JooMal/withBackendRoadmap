<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method ="get" action="ParamServlet" name="frm">
	id: <input type="text" name="id"><br>
	age: <input type="text" name="age">
	<input type="submit" value="전송" onclick="return check();"/>
</form>
</body>
</html>