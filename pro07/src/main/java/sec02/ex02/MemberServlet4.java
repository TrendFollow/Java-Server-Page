package sec02.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member4")
public class MemberServlet4 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}// doGet
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}// doPost
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();

		
		// command 값을 받아 옵니다.
		String command = request.getParameter("command");
		
		// command 값이 addMember이면 전송된 값을 받아온다.
		// MemberVO에 저장하고, DAO 메서드로 넘긴다.
		if(command!=null && command.equals("addMember")) {
			String _id = request.getParameter("id");
			String _pwd = request.getParameter("pwd");
			String _name = request.getParameter("name");
			String _email = request.getParameter("email");
			
			MemberVO memberVO = new MemberVO();
			memberVO.setId(_id);
			memberVO.setPwd(_pwd);
			memberVO.setName(_name);
			memberVO.setEmail(_email);
			dao.addMember(memberVO);
		}
		
		List list = dao.memlist();
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border=1 align=center>");
		out.print("<tr>");
		out.print("<td>아이디</td><td>이름</td><td>비밀번호</td><td>이메일</td><td>가입일자</td><td>삭제</td>");
		out.print("</tr>");
		for(int i=0; i<list.size(); i++) {
			out.print("<tr>");
			out.print("<td>"+((MemberVO)list.get(i)).getId() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getName() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getPwd() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getEmail() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getJoinDate() +"</td>");
			out.print("<td><a href=/pro07/member4?command=delMember&id="+((MemberVO)list.get(i)).getId()+">삭제</a></td>");
			out.print("</tr>");
		}// for
		out.print("</table>");
		
		out.print("<a href=/pro07/Memberform.html>새 회원 등록하기</a>");
		
		
		out.print("</body>");
		out.print("</html>");
		
	}
	
}
