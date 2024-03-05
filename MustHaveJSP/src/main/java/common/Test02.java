package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Test02 {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/sqldb?serverTimezone=UTC";
	private static final String id = "root";
	private static final String pw = "0000";
	
	Connection conn;
	Statement stmt;
	ResultSet rs;
	
	String user_id;
	String user_pw;
	
	public Test02() {
		try {
			// 드라이버 로딩
			Class.forName(DRIVER);
			
			// DB와 connection 맺기
			conn = DriverManager.getConnection(URL, id, pw);
			// sql문을 전달할 객체
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from usertbl");
			String user_id=rs.getString("userid");
			String user_pw = rs.getString("name");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		Test02 t2 = new Test02();
		System.out.println(t2.user_id);
		System.out.println(t2.user_pw);
		
	}

}
