<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="number" value="100"/>
	
	<h4>choose 태그로 홀짝 판단하기</h4>
	<c:choose>
		<c:when test="${number % 2 == 0 }">
			${number }는 짝수입니다.
		</c:when>
		<c:otherwise>
			${number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
	<h4>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h4>
	<form action="">
		국어 : <input type="text" name="kor"> <br>
		영어 : <input type="text" name="eng"> <br>
		수학 : <input type="text" name="math"> <br>
		<input type="submit" value="학점 구하기">
	</form>
	
	<c:set var="kor" value="${param.kor }"/>
	<c:set var="eng" value="${param.eng }"/>
	<c:set var="math" value="${param.math }"/>
	<c:set var="avg" value="${(kor+eng+math)/3 }"/>
	
	<c:if test="${!(empty kor or empty eng or empty math)}">
		<c:choose>
			<c:when test="${avg>=90 }">A 학점</c:when>
			<c:when test="${avg>=80 }">B 학점</c:when>
			<c:when test="${avg>=70 }">C 학점</c:when>
			<c:when test="${avg>=60 }">D 학점</c:when>
			<c:otherwise>F 학점</c:otherwise>
		</c:choose>
		입니다. <br>
		평균 = ${avg }
	</c:if>
	
	
	
	
</body>
</html>