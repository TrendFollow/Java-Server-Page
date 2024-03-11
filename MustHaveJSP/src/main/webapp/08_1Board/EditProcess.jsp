<%@page import="model1_1.board.BoardDAO"%>
<%@page import="model1_1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	// 수정 내용 얻기
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// DTO 저장
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	// DB반영
	BoardDAO dao = new BoardDAO();
	int affected = dao.updateEdit(dto);
	
	// 성공시 상세보기 페이지로, 실패시 이전페이지(수정페이지)
	if(affected>=1){
		response.sendRedirect("View.jsp?num="+dto.getNum());
	}else{
		JSFunction.alertBack("수정하기에 실패하였습니다.", out);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>