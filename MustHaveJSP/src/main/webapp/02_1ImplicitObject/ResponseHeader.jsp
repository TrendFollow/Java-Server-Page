<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// 응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
long add_date = s.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

// 응답 헤더에 값 추가
response.addDateHeader("myBirthday", add_date);

/* add : 같은 헤더 이름을 추가하면 원래 값이 한 번더 추가된다. */
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004);

/* set : 같은 헤더의 이전 값이 수정된다. 같은 이름의 헤더가 없으면 새로추가*/
response.addHeader("myName", add_str);
response.setHeader("myName", "안중근");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames();
	for(String hName : headerNames ){
		/* getHeader : 값이 여러개더라도 첫 번째 값만 가져온다.
		8282 만 가져온다.
		홍길동을 안중근으로 수정되어서 안중근을 가져온다.
		*/
		String hValue = response.getHeader(hName);
	%>
		<li><%= hName %> : <%= hValue %></li>	
	<%
	}
	%>
	
	<h2>myNumber만 출력하기</h2>
	<%
	Collection<String> myNumber = response.getHeaders("myNumber");
	for(String myNum : myNumber){
	%>
		<li>myNumber : <%= myNum %></li>			
	<% 
	}
	%>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>