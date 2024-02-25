<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="common.*" %>

<!-- 
	pageContext
	- 이 객체에 저장된 정보는 해당 페이지에서만 사용할 수 있고,
	페이지를 벗어나면 소멸된다.
	- include 지시어로 포함한 파일은 하나의 페이지로 통합되므로 page 영역이 공유된다.
 -->
 
<%
pageContext.setAttribute("pageInteger", 1000);
pageContext.setAttribute("pageString", "페이지 영역의 문자열");
pageContext.setAttribute("pagePerson", new Person("한석봉",99));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
<%
int pInteger = (Integer)pageContext.getAttribute("pageInteger");
String pString = (String)pageContext.getAttribute("pageString");
Person pPerson = (Person)pageContext.getAttribute("pagePerson");
%>

	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%= pString %></li>
		<li>Person 객체 : <%= pPerson.getName()%>, <%= pPerson.getAge() %></li>
	</ul>
	
	<h2>include 파일에서 page 영역 읽어오기</h2>
	<!-- include 파일 내에서는 html 태그를 모두 지우고 작성해놓는다.
		태그가 중복 될 수 있기 때문이다.  -->
	<%@include file="PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page 영역 읽어오기</h2>
	<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>