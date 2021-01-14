<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 디렉티브 태그 (Directive Tag)
문서를 어떻게 처리할 것인지 나타내는 태그
페이지와 관련된 정보를 JSP 컨테이너에게 보내는 일종의 메시지

page 디렉티브 : 페이지와 관련된 다양한 속성, 기능을 지정
language : 스크립트 언어 이름
contentType : JSP 페이지가 생성하는 문서의 타입을 나타내기 위하여 사용
		charset : JSP페이지에서 사용하는 문자 지정

include 디렉티브 : 특정 영역에 다른 문서를 포함한다.
taglib 디렉티브 : JSP 페이지에서 사용할 태그 라이브러리를 설정한다.
 -->
 
 <%@ page import ="java.util.Date"%>
 Today is <%= new Date() %>
 
 <%
 int str1[] = {10, 4, 5, 3, 1};
 String str2[] = {"사과", "딸기", "포도", "감", "수박"};
 
 out.println("<br>");
 
 int sum = 0;
 for(int i=0;i<str1.length;i++) {
	 sum += str1[i];
	 out.println(str2[i]+" "+str1[i]+"개");
 }

out.println("<br>총합: "+sum+"개");
 
 %>

</body>
</html>