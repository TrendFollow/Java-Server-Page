<%@page import="utils.BoardPage"%>
<%@page import="model1_1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1_1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();

// 사용자가 입력한 검색 조건 Map에 저장
Map<String,Object> map = new HashMap();
// title, content(제목, 내용) 중 넘어오는 값
String searchField = request.getParameter("searchField");
// 검색 값으로 넘어오는 인자
String searchWord = request.getParameter("searchWord");
map.put("searchField", searchField);
map.put("searchWord", searchWord);

int totalCount = dao.selectCount(map); // 검색 조건에 맞는 게시물 수 확인

/* 페이지 처리 start */
// 전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount/pageSize);

// 현재 페이지 확인
int pageNum=1; // 기본값
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")){
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정
}

// 목록에 출력할 게시물 범위 계산
int start = (pageNum-1)*pageSize + 1; // 첫 게시물 번호
int end = pageNum * pageSize;
map.put("start", start);
map.put("end", end);
/* 페이지 처리 end */

List<BoardDTO> boardLists = dao.selectListPage(map); // 검색 목록 받기
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
	<jsp:include page="../common/Link.jsp"/>
	<h2>목록 보기(List) - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>
	<!-- 검색 목록 현재 페이지 재요청 -->
	<form method="get">
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord">
				<input type="submit" value="검색하기">
			</td>
		</tr>
	</table>
	<!-- 게시물 목록 표 -->
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
<%		
		// 검색한 목록이 없을 때
		if(boardLists.isEmpty()){
%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
<% 
		// 검색한 목록이 있을 때
		}else{
			int countNum = 0;
			int virtualNum = 0; // 화면상 게시물 번호
			for(BoardDTO dto : boardLists){
				//virtualNum = totalCount--;
				virtualNum = totalCount - (((pageNum-1)*pageSize) + countNum++);
%>				
		<tr align="center">
			<td><%= virtualNum %></td>
			<td align="left">
			<!-- 상세보기로 num을 변수와 함께 재요청한다. -->
			<a href="../09PagingBoard/View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
			</td>
			<td align="center"><%= dto.getId() %></td>
			<td align="center"><%= dto.getVisitcount() %></td>
			<td align="center"><%= dto.getPostdate() %></td>
		</tr>
<% 
			}// for
		}//if-else
%>
	</table>
	
	<!-- 글쓰기 버튼, Write.jsp 요청 -->
	<table border="1" width="90%">
		<tr align="center">
			<td>
				<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
	</form>
	
</body>
</html>