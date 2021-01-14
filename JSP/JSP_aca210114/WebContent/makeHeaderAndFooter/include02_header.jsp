<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  HTML 내용이 필요없는 경우 DOCTYPE 등을 다 지워도 된다. -->

<%! 
	int pageCount = 0;
	
	void addCount() {
		pageCount++;
	}
%>

<%
	addCount();
%>
<p> 이 사이트 방문은 <%= pageCount %>번째 입니다. </p>