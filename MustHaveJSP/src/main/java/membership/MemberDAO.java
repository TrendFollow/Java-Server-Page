package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{
	
	// 연결을 super 로 보낸다.
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	// 명시한 아이디/패스워드와 일치하는 회원 정보 반환
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		// 회원 정보 DTO 객체 생성
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
				
			}//if
		} catch (Exception e) {
			System.out.println("getMemberDTO 메서드 오류 :" + e);
		}//try
		
		
		return dto;
	}

}
