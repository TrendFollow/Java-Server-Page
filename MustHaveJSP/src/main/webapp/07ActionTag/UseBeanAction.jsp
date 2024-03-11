<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- property="*" 폼 태그로 받아오는 것을 저장하겠다. -->
	<h3>액션 태그로 폼 값 한 번에 받기</h3>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<jsp:setProperty property="*" name="person"/>
	<ul>
	  <li> 이름 : <jsp:getProperty property="name" name="person"/> </li>
	  <li> 나이 : <jsp:getProperty property="age" name="person"/> </li>
	</ul>
</body>
</html>