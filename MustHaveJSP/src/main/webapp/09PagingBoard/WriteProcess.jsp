<%@page import="model1_1.board.BoardDAO"%>
<%@page import="model1_1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	/* Write.jsp 에서 작성한 제목, 내용 처리 페이지 */
	
	// 폼 값 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// 폼 값을 DTO 에 저장
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId((String)session.getAttribute("UserId"));
	
	// DAO 객체를 통해 DB에 DTO 저장
	BoardDAO dao = new BoardDAO();
	int iResult = dao.insertWrite(dto);
	
	// 성공하면 목록 페이지 요청, 실패하면 뒤로가기(글쓰기 화면)
	 if(iResult >= 1){
		response.sendRedirect("List.jsp");
	}else{
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
%>
