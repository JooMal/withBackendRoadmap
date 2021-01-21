<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.product_list {
	list-style-type:none;
}
.product_list > li {
	float : left;
}
.product_list > li > a {
	display : block;
	text-align: center;
	padding-left : 50px;
	padding-bottom: 10px;
}

.display {
	font-size: 20px;
}

.core {
	font-size: 13px;
}


</style>
<body>

<!-- 네비게이션 -->
<%@ include file="menu.jsp" %>

<!-- 헤더 -->
<!-- 메인 페이지 -->
<br><br>

<h2> 상품 목록 </h2>

<%@ page import="com.dto.Phone" %>
<jsp:useBean id="dao" class="com.dao.ProductRepository"/>

<ul class="product_list">
	<%
		ArrayList<Phone> listOfProducts = dao.getAllProducts();
		for(Phone phone : listOfProducts) {
	%>
	<li>
		<a class="display"><%=phone.getProdName()%></a>
		<a class="core"><%=phone.getProdDetail() %></a>
		<a class="price"><%=phone.getProdPrice() %>원</a>
	</li>
	<%
		}
	%>
</ul>

<!-- footer -->
<br>
<a class="footer">
<%@ include file="footer.jsp" %>
</a>

</body>
</html>