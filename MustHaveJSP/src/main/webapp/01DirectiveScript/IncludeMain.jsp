<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>

<!--
	여러 페이지에서 반복 사용되어야 할 경우 include 지시어 사용
	html 과 같은 태그는 모두 제거한 후 작성한다.
	page 지시어는 제거하면 안된다.
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println("오늘 날짜 : " + today);
out.println("내일 날짜 : " + tomorrow);
%>
</body>
</html>