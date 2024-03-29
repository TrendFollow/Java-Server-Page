<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../inc/BookList.xml" var="booklist" charEncoding="utf-8"/>
	
	<x:parse xml="${booklist }" var="blist"/>
	
	<h4>파싱 1</h4>
	제목 : <x:out select="$blist/booklist/book[1]/name"/> <br>
	저자 : <x:out select="$blist/booklist/book[1]/author"/> <br>
	가격 : <x:out select="$blist/booklist/book[1]/price"/> <br>
	
	<h4>파싱 2</h4>
	<table border="1">
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
		</tr>
	
		<x:forEach select="$blist/booklist/book[]" var="item">
			<tr>
				<td> <x:out select="$item/name"/> </td>
				<td> <x:out select="$item/author"/> </td>
				<td> <x:out select="$item/price"/> </td>
			</tr>
		</x:forEach>		
	</table>
</body>
</html>