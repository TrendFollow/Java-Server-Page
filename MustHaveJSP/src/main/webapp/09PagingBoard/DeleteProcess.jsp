<%@page import="model1_1.board.BoardDAO"%>
<%@page import="model1_1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
    
<%
	// 일련번호 얻기
	String num = request.getParameter("num");
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	dto = dao.selectView(num); // 일련번호에 해당하는 게시물 얻기
	
	// 로그인 된 사용자 ID 얻기
	String sessionId = session.getAttribute("UserId").toString();
	int delResult = 0;
	
	if(sessionId.equals(dto.getId())){
		dto.setNum(num);
		delResult = dao.deletePost(dto);
		
		// 성공시 목록페이지로, 실패시 상세보기 페이지로
		if(delResult==1){
			JSFunction.alertLocation("삭제되었습니다", "List.jsp", out);
		}else{
			JSFunction.alertBack("삭제에 실패하였습니다.", out);
		}
	}else{
		// 작성자 본인이 아니라면 이전 페이지로 이동
		JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
		return;
	}
%>
