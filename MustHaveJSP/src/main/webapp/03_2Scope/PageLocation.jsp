<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이동 후 page 영역의 속성값 읽기</h2>
	<%
		int pInteger3 = (Integer)pageContext.getAttributesScope("pageInteger");
		String pString3 = (String)pageContext.getAttribute("pageString");
		Person pPerson3 = (Person)pageContext.getAttribute("pagePerson");
	%>
	<ul>
	  <li> Integer 객체 : <%= (pInteger3==0)?"값 없음":pInteger3 %> </li>
	  <li> String 객체 : <%= (pString3==null)?"값 없음":pString3 %> </li>
	  <li> Person 객체 : <%= (pPerson3==null)?"값 없음":pPerson3.getName() %></li>
	</ul>

</body>
</html>