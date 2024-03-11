package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	
	// 데이터베이스 연동
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	// 게시물의 개수 반환 메서드
	public int selectCount(Map<String,Object> map) {
		// 게시물 갯수 담을 변수
		int totalCount = 0;
		
		// 게시물 수 얻어오는 쿼리문
		String query = "select count(*) from board ";
		if(map.get("searchWord")!=null) {
			query += " where "+map.get("searchField")+" "
				 + "like '%"+map.get("searchWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("selectCount 메서드 오류 ="+e);
		}
		
		return totalCount;
	}//selectCount()
	
	// 검색 조건에 맞는 게시물 목록 반환
	public List<BoardDTO> selectList(Map<String,Object> map){
		// 결과를 담을 변수
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "select * from board";
		if(map.get("searchWord")!=null) {
			query += " where "+map.get("searchField")+" "
					+ "like '%" + map.get("searchWord")+"%'";
		}
		query += " order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				// 일련번호, 제목, 내용, 아이디, 작성일, 조회수
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("selectList 메서드 오류 = "+e);
		}
		
		return bbs;
	}//selectList()
	
	// 게시글을 DB에 추가합니다.
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into board values (seq_board_num.nextval,?,?,?,sysdate,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertWrite 메서드 오류 = "+e);
		}
		
		return result;
	}//insertWrite()
	
	// 지정한 게시물을 찾아 내용을 반환합니다.
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "select B.*, M.name "
					 + " from member M inner join board B "
					 + " on M.id = B.id "
					 + " where num=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
				
			}
		} catch (Exception e) {
			System.out.println("selectView 메서드 오류 = "+e);
		}//try-catch
		
		return dto;
	}//selectView()
	
	// 지정한 게시물의 조회수를 1 증가시키기
	public void updateVisitCount(String num) {
		String query = "update board set visitcount=visitcount+1 where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
		} catch (Exception e) {
			System.out.println("updateVisitCount 메서드 오류 = "+e);
		}
		
	}//updateVisitCount()
	
	// 제목과 내용 수정하기
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "update board set title=?, content=? where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("updateEdit 메서드 오류 = " + e);
		}
		
		
		return result;
	}//updateEdit()

	
}//class
