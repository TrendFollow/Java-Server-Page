<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pInteger2 = (Integer)pageContext.getAttribute("pageInteger");
	String pString2 = (String)pageContext.getAttribute("pageString");
	Person pPerson2 = (Person)pageContext.getAttribute("pagePerson");
%>
<ul>
  <li> Integer 객체 : <%= pInteger2 %></li>
  <li> String 객체 : <%= pString2 %> </li>
  <li> Person 객체 : <%= pPerson2.getName() %>, <%= pPerson2.getAge() %> </li>
</ul>
