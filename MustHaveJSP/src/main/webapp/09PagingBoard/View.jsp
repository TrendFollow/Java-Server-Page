<%@page import="model1_1.board.BoardDTO"%>
<%@page import="model1_1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num);
	BoardDTO dto= dao.selectView(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function deletePost() {
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.writeFrm;
		form.method = "post";
		form.action = "DeleteProcess.jsp";
		form.submit();
	}
}
</script>
</head>
<body>
	<jsp:include page="../common/Link.jsp"/>
	<h2>회원제 게시판 - 상세 보기(View)</h2>
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%= num %>">
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%= dto.getNum() %></td>
				<td>작성자</td>
				<td><%= dto.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%= dto.getPostdate() %></td>
				<td>조회수</td>
				<td><%= dto.getVisitcount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%= dto.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100px">
				<%= dto.getContent().replace("\r\n", "<br>") %>
				</td>
			</tr>
			<!-- 상세보기에서 작성자와 유저id가 같으면 수정, 삭제 가능
				다르면 목록보기로 다시 이동 가능 -->
			<tr>
				<td colspan="4" align="center">
				<%
					if(session.getAttribute("UserId")!=null &&
						session.getAttribute("UserId").toString().equals(dto.getId())){
				%>
					<button type="button" onclick="location.href='../09PagingBoard/Edit.jsp?num=<%=dto.getNum() %>';">수정하기</button>
					<button type="button" onclick="deletePost();">삭제하기</button>
				<% 
					}
				%>
				<button type="button" onclick="location.href='../09PagingBoard/List.jsp';">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>