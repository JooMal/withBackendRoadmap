<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java beans</title>
</head>
<body>	
	<jsp:useBean id="bean2" class="com.dao.memberBean"></jsp:useBean>
	<p> 생년월일 : <%= bean2.getId() %> </p>
	<p> 이름 : <%= bean2.getName() %> </p>
	
</body>
</html>