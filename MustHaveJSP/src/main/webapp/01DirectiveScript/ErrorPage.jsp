<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
 <!-- errorPage = "IsErrorPage.jsp : 에러 페이지를 지정한다. 그 페이지에 에러 발생시 코드를 적는다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int myAge = Integer.parseInt(request.getParameter("age"))+10;
out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
%>
</body>
</html>