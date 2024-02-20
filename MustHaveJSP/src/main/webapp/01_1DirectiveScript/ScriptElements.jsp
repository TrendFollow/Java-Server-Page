<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! // 선언부(변수, 메서드 선언)
public int add(int a, int b){
	return a + b;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
// _jspService() 메서드 내부에 기술된다.
// 메서드 선언은 불가능, 메서드를 호출은 가능하다.
int result = add(10,20);
%>
덧셈 결과 1 : <%=result %> <br>
덧셈 결과 2 : <%=add(30,40) %>

<!--
<%=%>
- 표현식
- 상수, 변수, 연산자를 사용한 식, 반환값이 있는 메서드 호출 등이 모두 표현식에 속한다.
- 주로 변수의 값을 웹 브라우저에 출력할 때 사용

  -->
</body>
</html>