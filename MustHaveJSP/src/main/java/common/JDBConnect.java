package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(기본 생성자)");
		}catch(Exception e) {
			System.out.println("0생성자 오류 " +e);
		}//try
	}// 생성자0
	
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자1)");
			
			
		}catch (Exception e) {
			System.out.println("1생성자 오류 : "+e);
		}
	}// 생성자 1
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OrcleDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("OrcleURL");
			String id = application.getInitParameter("OrcleId");
			String pwd = application.getInitParameter("OrclePwd");
			
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(인수 생성자2)");
			
		}catch (Exception e) {
			System.out.println("2생성자 오류 : " + e);
		}
	}// 생성자2
	
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();
			
		}catch(Exception e) {
			System.out.println("close 메서드 오류 :" + e);
		}//try
	}// close

}
