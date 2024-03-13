<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>List 컬렉션 사용하기</h4>
	<%
		LinkedList<Person> lists = new LinkedList();
		lists.add(new Person("맹사성",34));
		lists.add(new Person("장영실",44));
		lists.add(new Person("신숙주",54));
	%>
	<c:set var="lists" value="<%= lists %>"/>
	<c:forEach var="list" items="${lists }">
		<li>이름 : ${list.name }, 나이 : ${list.age }</li>
	</c:forEach>
	
	
	<h4>List 컬렉션 사용하기2</h4>
	<c:forEach var="i"  begin="0" end="<%= lists.size()-1 %>">
		<li>이름 : ${lists[i].name }, 나이 : ${lists[i].age }</li>
	</c:forEach>	
	
	<h4>Map 컬렉션 사용하기</h4>
	<%
		Map<String, Person> maps = new HashMap<String,Person>();
		maps.put("1st", new Person("맹사성",34));
		maps.put("2st", new Person("장영실",44));
		maps.put("3st", new Person("신숙주",54));
	%>
	<c:set var="maps" value="<%= maps %>"/>
	<c:forEach var="map" items="${maps }">
		<li>Key = ${map.key } <br>
			Value => 이름 : ${map.value.name }, ${map.value.age } </li>
	</c:forEach>
	
	
	
</body>
</html>