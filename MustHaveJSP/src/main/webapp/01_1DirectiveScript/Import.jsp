<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
Date today = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss a z E요일");
String todayStr = dateFormat.format(today);
out.println(todayStr);
%>
</body>
</html>