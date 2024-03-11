<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String popupMode = "on";

Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie c : cookies){
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if(cookieName.equals("PopupClose")){
			popupMode=cookieValue;
		}//if
	}//for
}//if
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	#popup{
		text-align:center;
		position:absolute;
		top:100px;
		left:50px;
		border: 1px solid black;
		width: 300px;
		height: 100px;
		background-color: #747474;
	}
	.div2{
		position: relative;
		background-color: #ffffff;
		border:1px solid gray;
		padding:2px;
	}
</style>
</head>
<body>
	<h2>팝업 메인 페이지(ver 0.1)</h2>
<%
	for(int i=1; i<=10; i++){
		out.print("현재 팝업창은" + popupMode + " 입니다.<br>");
	}
	
	if(popupMode.equals("on")){
%>
	<div id="popup">
		<h2 class="h2" style="color:white;">공지사항 팝업입니다.</h2>
		<div class="div2">
			<input type="checkbox" id="inactiveToday" value="1">하루 동안 열지 않음
			<input type="button" value="닫기" id="closeBtn">
		</div>
	</div>	
<%		
	}
%>
<script type="text/javascript">
	$("#closeBtn").click(function () {
		$("#popup").hide();	
		
		let chk = $("input:checkbox[id=inactiveToday]:checked").val();
		
		$.ajax({
			url:'./PopupCookie.jsp',
			type:'get',
			data:{chkbox:chk},
			dataType:"text",
		})//ajax
	})//click
		
	
</script>

</body>
</html>