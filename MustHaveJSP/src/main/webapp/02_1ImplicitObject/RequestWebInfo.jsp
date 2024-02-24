<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
	URL : 호스트가 보인다
	URI : 호스트가 안보인다.
	GET 전송방식 : 파라미터 한글을 안깨지고, 쿼리스트링 한글 깨진다.
  -->
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<ul>
		<li>데이터 전송 방식 : <%= request.getMethod() %></li>
		<li>URL : <%= request.getRequestURL() %></li>
		<li>URI : <%= request.getRequestURI() %></li>
		<li>프로토콜 : <%= request.getProtocol() %></li>
		<li>서버명 : <%=request.getServerName()  %></li>
		<li>서버 포트 : <%= request.getServerPort() %></li>
		<li>클라이언트 IP 주소 : <%= request.getRemoteAddr() %></li>
		<li>쿼리스트링 : <%= request.getQueryString() %></li>
		<li>전송된 값1 : <%= request.getParameter("eng") %></li>
		<li>전송된 값2 : <%= request.getParameter("han") %></li>
	</ul>
</body>
</html>