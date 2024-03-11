<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String chk = request.getParameter("chkbox");

if(chk != null && chk.equals("1")){
	Cookie cookie = new Cookie("PopupClose","off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(120);
	response.addCookie(cookie);
	out.print("쿠키 : 2분 동안 열지 않음");
}
%>