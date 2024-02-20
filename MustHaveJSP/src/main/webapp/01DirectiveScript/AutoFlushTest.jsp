<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="none" autoFlush="true"%>
    <!-- 
    	JSP가 생성한 결과는 일단 버퍼에 저장된다.
    	만약 실행 도중 에러가 발생하면 버퍼에 저장된 내용을 삭제하고 에러 화면을 표시한다.
    	buffer 기본값 8kb, 사용하지 않을시 none
    	
    	none 설정시 : 포워드나 에러 페이지 기능을 사용할 수 없다. 따라서 none 으로 하는 경우는 거의 없다.
    	buffer 의 크기를 줄이면 JSP의 기능을 온전히 사용할 수 없으므로 거의 사용하지 않는다.
    	
    	autoFlush=true : 버퍼가 채워지면 자동으로 플러시한다.
    	autoFlush=false : 버퍼가 채워지면 예외를 발생시킨다.
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
for(int i=0; i<=100; i++){
	out.println("abcde12345");
}
%>
</body>
</html>