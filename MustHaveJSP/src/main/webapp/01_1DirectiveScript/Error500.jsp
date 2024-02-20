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
int myAge = Integer.parseInt(request.getParameter("age"))+10; // 에러발생
out.println("10년 후 당신의 나이는 " + myAge + "입니다."); // 출력되지 않는다. 에러 페이지 출력

// 에러 페이지가 표시되면 코드가 그대로 노출된다.
%>
</body>
</html>