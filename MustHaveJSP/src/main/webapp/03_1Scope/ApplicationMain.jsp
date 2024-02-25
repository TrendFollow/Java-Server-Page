<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--
    	Application
    	- 단 하나의 application 객체만 생성하고, 클라이언트가 요청하는 모든 페이지가 application 객체를 공유한다.
    	- 웹 서버를 시작할 때 만들어지며, 웹 서버를 내릴 때 삭제된다.
    	- application 영역에 한 번 저장된 정보는 페이지를 이동하거나, 웹브라우저를 닫았다가 새롭게 접속해도 삭제되지 않는다.
      -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application 영역의 공유</h2>
<%
Map<String,Person> maps = new HashMap<>();
maps.put("actor1", new Person("이수일",30));
maps.put("actor2", new Person("심순애",28));
application.setAttribute("maps", maps);
%>

application 영역에 속성이 저장되었습니다.
</body>
</html>