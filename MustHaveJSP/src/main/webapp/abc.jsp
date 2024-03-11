<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1_1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	Map<String, Object> map = new HashMap();
	map.put("searchField", "title");
	map.put("searchWord", "");
	
	out.print(dao.selectCount(map));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>