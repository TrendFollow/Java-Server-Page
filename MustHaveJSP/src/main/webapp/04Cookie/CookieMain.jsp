<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	Cookie
	- 쿠키의 이름은 생성자를 통해 설정, 생성 후에는 더 이상 이름을 변경할 수 없다.
	- 쿠키가 처음 만들어진 상태에는 서버가 쿠키를 읽을 수 없다. 다음번 요청 때부터 클라이언트가 전송해주기 때문이다.
	- 페이지를 새로 고치거나 다시 접속해야 서버가 쿠키를 읽어 활용하게 된다.
 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 쿠키(Cookie) 설정</h2>
<%
Cookie cookie = new Cookie("myCookie","쿠키맛나요"); // 쿠키 생성
// 이클립스에서 프로젝트명이 컨텍스트 루트로 사용되므로 MustHaveJSP가 반환되어 설정된다.
cookie.setPath("request.getContextPath()"); // 경로를 컨텍스트 루트로 설정
cookie.setMaxAge(10); // 초 단위로 설정, 쿠키 유지 시간 1시간 설정
response.addCookie(cookie); // 응답 헤더에 쿠키 추가
%>

	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
<%
Cookie[] cookies = request.getCookies(); // 요청 헤더에 모든 쿠키 얻기
if(cookies != null){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		out.print(cookieName +" : "+cookieValue);
	}
}
%>
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>