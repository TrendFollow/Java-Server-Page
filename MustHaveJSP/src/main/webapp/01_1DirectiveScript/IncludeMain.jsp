<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp"%>
<!--
	include
	- 상단 메뉴나 하단 정보(회사 연락처 등) 여러 페이지에서 반복되어 사용해야 할 시 사용된다.
	- include 파일의 jsp 에는 html 과 같은 태그들을 모두 제거한 후 작성한다.
	- page 지시어는 필수이다.
	
	- 참조하는 파일에서는 jsp 에 작성해놓은 변수를 사용할 수 있다. 
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println("오늘 날짜 : " + today);
out.println("<br>");
out.println("내일 날짜 : " + tomorrow);
%>
</body>
</html>