<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

second.jsp 페이지입니다.
<br> Today is : <%= request.getParameter("date") %>
<br> name is : <%= request.getParameter("name") %>

</body>
</html>