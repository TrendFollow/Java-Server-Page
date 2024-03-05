package sec01.ex01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/wongi?serverTimezone=UTC";
	private static final String user = "root";
	private static final String pwd = "0000";
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	
	private void conDB() {
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL,user,pwd);
			stmt = con.createStatement();
			System.out.println("접속 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//conDB()
	
	public List memlist() {
		
		List list = new ArrayList();
		
		try {
			conDB();
			String query = "select * from t_member";

			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				
				
				MemberVO memVo = new MemberVO();
				memVo.setId(id);
				memVo.setName(name);
				memVo.setPwd(pwd);
				memVo.setEmail(email);
				memVo.setJoinDate(joinDate);
				
				list.add(memVo);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con!=null)con.close();
				if(stmt!=null)stmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
}
