package model1_1.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import membership.MemberDTO;

// Data Access Object 데이터베이스에 접근해 CRUD 작업을 수행하는 객체
public class BoardDAO {
	Connection con;
	Statement stmt;
	PreparedStatement psmt;
	ResultSet rs;
	DataSource dataSource;
	
	public BoardDAO() {
		try {
			Context context = new InitialContext();
			Context envconContext = (Context)context.lookup("java:/comp/env");
			dataSource = (DataSource)envconContext.lookup("dbcp_myoracle");
			
		} catch (Exception e) {
			System.out.println("생성자 오류 = " +e);
		}
	}// 생성자
	
	// 게시물의 갯수를 반환하는 메서드
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		try {
			con = dataSource.getConnection();
			
			String query = "select count(*) from board";
			if(map.get("searchWord")!=null) {
				query += " where " + map.get("searchField") + " "
						+ " like '%" + map.get("searchWord") + "%'";
			}
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println("selectCount 메서드 오류 = " + e);
		} finally {
			close();
		}
		 
		return totalCount;
	}// selectCount()
	
	// 게시물 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object>map){
		// 결과를 담을 변수
		List<BoardDTO> list = new ArrayList<>();
		try {
			con = dataSource.getConnection();
			
			String query = "select * from board";
			if(map.get("searchWord")!=null) {
				query += " where " + map.get("searchField") + " "
						+ " like '%" + map.get("searchWord") + "%'";
			}
			query += " order by num desc";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("selectList 메서드 오류 = " + e);
		} finally {
			close();
		}
		return list;
	}// selectList()
	
	public List<BoardDTO> selectListPage(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<>();
		
		try {
			con = dataSource.getConnection();
			
			String query = " select * from (select Tb.*, rownum rNum from (select * from board";
			if(map.get("searchWord")!=null) {
				query += " where " + map.get("searchField")
						+ " like '%"+ map.get("searchWord") +"%' ";
			}//if
			query += "   order by num desc) Tb) where rNum between ? and ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				bbs.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("selectListPage 메서드 오류 = "+e);
		} finally {
			close();
		}// try-catch
		return bbs;
	}// selectListPage()
	
	// 자원해제 메서드
	public void close() {
			try {
				if(con!=null)con.close();
				if(stmt!=null)stmt.close();
				if(psmt!=null)psmt.close();
				if(rs!=null)rs.close();
			} catch (Exception e) {
				System.out.println("close() 메서드 오류 = "+e);
			}
	}//close()
	
	// Write.jsp 쓴 글을 WriteProcess.jsp 에서 dto에 저장 후
	// dao 객체를 통해 DB에 저장
	public int insertWrite(BoardDTO dto) {
		int result =0;
		
		try {
			con = dataSource.getConnection();
			
			String query = "insert into board("
					+ "num,title,content,id,visitcount) "
					+ " values(seq_board_num.NEXTVAL,?,?,?,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("insertWrite 메서드 오류 = "+e);
		} finally {
			close();
		}
		return result;
	}//insertWrite()
	
	// List.jsp 목록에서 제목을 클릭시 num변수와 값이 View.jsp로 요청하며 넘어간다.
	// View.jsp : 상세보기 페이지
	// num 값에 맞는 데이터 제공하는 메서드
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		try {
			con = dataSource.getConnection();
			
			String query = "select B.*, M.name "
					+ " from member M inner join board B "
					+ " on M.id=B.id "
					+ " where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
		} catch (Exception e) {
			System.out.println("selectView 메서드 오류 "+e);
		}finally {
			close();
		}//try-catch
		return dto;
	}// selectView()
	
	// 조회수 1증가 시키는 메서드
	public void updateVisitCount(String num) {
		try {
			con = dataSource.getConnection();
			String query = "update board set visitcount=visitcount+1 where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateVisitCount 메서드 오류 = "+e);
		} finally {
			close();
		}
		
	}//updateVisitCount()
	
	// 지정한 게시물 수정하기
	public int updateEdit(BoardDTO dto) {
		int result = 0 ;
		try {
			con = dataSource.getConnection();
			
			String query = "update board set title=?, content=? where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateEdit 메서드 오류 = "+e);
		}finally {
			close();
		}
		return result;
	}//updateEdit
	
	// 게시물 삭제 메서드
	public int deletePost(BoardDTO dto) {
		int result=0;
		try {
			con = dataSource.getConnection();
			String query = "delete from board where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deletePost 메서드 오류 = "+e);
		}finally {
			close();
		}
		return result;
	}
	
	
}
