<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("requestString", "request 영역의 문자열");
request.setAttribute("requestPerson", new Person("안중근",31));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
		request.removeAttribute("requestString");
		request.removeAttribute("requestInteger"); // 존재하지 않는 속성이라도 지우면 에러없음
	%>
	
	<h2>request 영역의 속성값 읽기</h2>
	<%
		Person rPerson = (Person)request.getAttribute("requestPerson");
	%>
	<ul>
	  <li> String 객체 : <%= request.getAttribute("requestString") %> </li>
	  <li> Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %> </li>
	</ul>
	
	<h2>포워드 된 페이지에서 request 영역 속성값 읽기</h2>
	<%--
		request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request,response);
	--%>
	
	<h2>a 태그로 전달된 페이지에서 request 영역 속성값 읽기</h2>
	<a href="RequestA.jsp">RequestA.jsp 페이지 이동</a>
</body>
</html>