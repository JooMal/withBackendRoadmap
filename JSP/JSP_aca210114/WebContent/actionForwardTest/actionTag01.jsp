<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ActionTag</title>
</head>
<body>
 
 <h3> 파일명 : actionTag01.jsp 입니다. 메인 페이지! </h3>
 <!-- forward를 하기 때문에 위의 내용은 실제 구동 화면에선 보이지 않습니다. -->
 <jsp:include page = "second.jsp" flush="false"/>

 <p>Java Server Page</p>

</body>
</html>