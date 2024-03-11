<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>액션 태그를 이용한 포워딩</h2>
	 <!-- forward 를 만나면 이전의 모든 출력은 제거된다.
	 	 h2 가 출력되지 않는다. -->
	<jsp:forward page="ForwardSub.jsp" />
</body>
</html>