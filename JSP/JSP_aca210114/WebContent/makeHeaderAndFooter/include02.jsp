<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include02</title>
</head>
<body>

<!-- 머리글 : 이 사이트 n번째 방문이다. -->
<%@ include file="include02_header.jsp" %>
<p>방문해주셔서 감사합니다.</p>

<!-- 바닥글 -->
<%@ include file="include02_footer.jsp" %>
</body>
</html>