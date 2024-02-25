<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application 영역의 속성 읽기</h2>
	<%
	Map<String,Person> maps = (Map<String,Person>)application.getAttribute("maps"); 
	Set<String> set = maps.keySet();
	for(String key : set){
		Person p = maps.get(key);
		out.print("이름 : " + p.getName() + ", 나이 : " + p.getAge());
	}
	%>
</body>
</html>