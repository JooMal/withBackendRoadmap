<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Connection conn = null;
	ResultSet rs = null;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/sqldb";
		String dbId = "root";
		String dbPw = "root";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
		out.println("제대로 연결되었습니다.<br>");
		
		Statement stmt = conn.createStatement();
		String sql = "select * from buytbl where num = 1";
		rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			out.println(rs.getString("num") + " " + rs.getString("userID") + "<br>");
		}
	}catch(Exception e) {
		e.printStackTrace();
		out.println("제대로 연결되지 않았습니다.");
	}finally {
		if (conn != null) conn.close();
	}
%>

</body>
</html>