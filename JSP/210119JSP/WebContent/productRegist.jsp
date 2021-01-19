<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="com.dao.ProductRepository" %>
<!-- 네비게이션 -->
<%@ include file="menu.jsp" %>

<form action="registor.jsp" name="member" method="post">
	상품 코드 <input type="text" name="prodCode"><br>
	상품명 <input type="text" name="prodName"><br>
	가격 <input type="number" name="prodPrice"><br>
	상세 정보 <input type="text" name="prodDetail"><br>
	제조사 <input type="text" name="prodMake"><br>
	분류 <input type="text" name="prodCat"><br>
	재고 수 <input type="number" name="prodRemain"><br>
	<input type="submit" value="등록">	
</form>

</body>
</html>