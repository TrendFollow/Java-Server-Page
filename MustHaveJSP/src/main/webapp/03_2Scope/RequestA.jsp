<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Person aPerson = (Person)request.getAttribute("requestPerson");
	%>
	<ul>
	  <li> Person 객체 : <%= aPerson.getName() %> </li>
	</ul>

</body>
</html>