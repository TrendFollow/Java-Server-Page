<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person"  %>
<h4>Include 페이지</h4>
<%
int pInteger2 = (Integer)pageContext.getAttribute("pageInteger");
// String pString2 = (String)pageContext.getAttribute("pageString");
Person pPerson2 = (Person)pageContext.getAttribute("pagePerson");
%>
<ul>
	<li>Integer 객체 : <%=pInteger2 %></li>
	<!-- 저장한 객체가 문자열이거나, 기본 타입의 래퍼클래스라면 형변환 없이 출력 가능하다.  -->
	<li>String 객체 : <%=pageContext.getAttribute("pageString") %></li>
	<li>Person 객체 : <%= pPerson2.getName() %>, <%= pPerson2.getAge() %></li>
</ul>