<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%@ page info="글쓰기 화면 구현" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
	function validateForm(form) {
		if(form.text.value==""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if(form.content.value==""){
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>회원제 게시판 - 글쓰기(Write)</h2>
	<!-- 글쓰기 완료 후 WriteProcess.jsp 처리 요청
		제목, 내용이 공백이면 WriteProcess.jsp 로 폼 내용을 보내지 않는다.
	-->
	<form action="WriteProcess.jsp" name="writeFrm" method="get"
		onsubmit="return validateForm(this);">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width: 90%;">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%; height: 100px;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">다시입력</button>
					<button type="button" onclick="location.href='List.jsp';">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>