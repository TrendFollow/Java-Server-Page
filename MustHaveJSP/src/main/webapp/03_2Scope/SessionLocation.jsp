<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이동한 페이지</h2>
	<%--
		ArrayList<String> list=(ArrayList)session.getAttribute("list");
		for(String str : list){
			out.print(str + " ");
		}
	--%>
	
	<%
		ArrayList<String> list = (ArrayList)session.getAttribute("list");
		Iterator it=list.iterator();
		while(it.hasNext()){
			out.print(it.next());
		}
	%>
</body>
</html>