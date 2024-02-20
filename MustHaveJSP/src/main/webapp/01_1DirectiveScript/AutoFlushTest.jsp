<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb" autoFlush="true"%>
    
<!--
	JSP 실행 과정
	- JSP 파일은 서블릿 코드로 변환뒨 후 컴파일되어 class 파일로 만들어 진다.
	- 이를 실행한 결과물을 HTMl 형태로 웹브라우저에 보내 최종적으로 화면에 출력하는 것이다.
	- 또한 이 과정에서 응답결과를 웹 브라우저로 즉시 전송하지 않고, 출력할 내용을 버퍼에 저장했다가 일정량이 되었을 때 전송하게 된다.
	
	buffer
	- 작은 단위로 여러 번 정송하는 것보다 큰 단위로 묶어서 한 번에 보내는 것이 효율적이다.
	- 버퍼라는 임시 저장소를 두어 데이터들이 충분히 쌓일 때까지 기다렸다가 보내는 것입니다.
	- 기본값 8kb, 사용하고 싶지 않다면 none
	- 단, none으로 설정하면 포워드나 에러 페이지 기능을 사용할 수 없다.
	
	autoFlush
	- 버퍼가 모두 채워졌을 때의 처리 방법을 정하는데 쓰인다. 기본값 true
	- true : 버퍼가 채워지면 자동으로 플러시(버퍼 안의 데이터를 목적지로 전송하고 버퍼를 비우는 작업)한다.
	- false : 버퍼가 채워지면 예외를 발생시킨다.
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
for(int i=0; i<=10000; i++){
	out.println("abcde1234");
}
%>
</body>
</html>