<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- input 태그의 name 값이 Person 클래스의 필드 이름과 같아야 한다. -->
	<h2>액션 태그로 폼값 한 번에 받기</h2>
	<form action="UseBeanAction.jsp" method="post">
		이름 : <input type="text" name="name"><br>
		나이 : <input type="text" name="age"><br>
		<input type="submit" value="폼값 전송">
	</form>
</body>
</html>