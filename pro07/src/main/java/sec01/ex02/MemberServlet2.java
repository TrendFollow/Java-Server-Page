package sec01.ex02;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member2")
public class MemberServlet2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		List list = dao.memlist();
		
		out.print("<html>");
		out.print("<body>");
		out.print("<table border=1 align=center>");
		out.print("<tr>");
		out.print("<td>아이디</td><td>이름</td><td>비밀번호</td><td>이메일</td><td>가입일자</td>");
		out.print("</tr>");
		for(int i=0; i<list.size(); i++) {
			out.print("<tr>");
			out.print("<td>"+((MemberVO)list.get(i)).getId() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getName() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getPwd() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getEmail() +"</td>");
			out.print("<td>"+((MemberVO)list.get(i)).getJoinDate() +"</td>");
			out.print("</tr>");
		}
		
		
		out.print("</table>");
		out.print("</body>");
		out.print("</html>");
		
		
		
	}

}
