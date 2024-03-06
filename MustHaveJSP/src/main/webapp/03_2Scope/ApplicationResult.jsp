<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
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
	<%--
		Map<String, Person> maps=(Map<String,Person>)application.getAttribute("maps");
		for(Map.Entry<String,Person> entry : maps.entrySet()){
			out.print(entry.getKey()+":"+entry.getValue().getName()+","+entry.getValue().getAge()+"<br>");
		}
	--%>
	<% 
		Map<String, Person> maps = (Map)application.getAttribute("maps");
		Set<String> set = maps.keySet();
		for(String key : set){
			Person person=maps.get(key);
			out.print(key + " : " + person.getName() + ", " + person.getAge() + "<br>");
		}
	%>
</body>
</html>