<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 로그인 폼으로 받은 아이디 패스워드
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	// web.xml에서 가져온 데이터베이스 연결 정보
	String oracleDriver = application.getInitParameter("OrcleDriver");
	String oracleUrl = application.getInitParameter("OrcleURL");
	String oracleId = application.getInitParameter("OrcleId");
	String oraclePwd = application.getInitParameter("OrclePwd");
	
	// 오라클 접속
	MemberDAO dao = new MemberDAO(oracleDriver,oracleUrl,oracleId,oraclePwd);
	// 회원 정보 획득
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	if(memberDTO.getId()!=null){
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
	}else{
		request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
