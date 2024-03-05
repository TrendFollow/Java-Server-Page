package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

// mysql 연동
public class Test1 {

	public static void main(String[] args) {
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/sqldb?serverTimezone=UTC";	
		String user = "root";
		String password = "0000";
		String query = "select * from usertbl";	
		
		Connection conn;
		Statement stmt;
		ResultSet rs;
		
		try {
//			userID char(8) PK 
//			name varchar(10) 
//			birthYear int 
//			addr char(2) 
//			mobile1 char(3) 
//			mobile2 char(8) 
//			height smallint 
//			mDate date
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				System.out.println(rs.getString("userID"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getInt("birthYear"));
				System.out.println(rs.getString("addr"));
				System.out.println(rs.getString("mobile1"));
				System.out.println(rs.getString("mobile2"));
				System.out.println(rs.getInt("height"));
				System.out.println(rs.getDate("mDate"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	            
		
		
	}

}
