package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	private Connection con;
	private Statement stmt;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");
			
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
			
		} catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패 : "+e);
		}//try
	}// 생성자
	
	public void close() {
		try {
			if(con!=null)con.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(rs!=null)rs.close();
			System.out.println("DB 커넥션 풀 자원 반납");
		} catch (Exception e) {
			System.out.println("close 메서드 오류 : " + e);
		}
	}//close()
	
}
