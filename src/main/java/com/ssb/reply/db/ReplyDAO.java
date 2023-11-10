package com.ssb.reply.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ssb.board.db.BoardDTO;

public class ReplyDAO {

	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
		
	// 공통) 디비 연결하기(CP)
	private Connection getCon() throws Exception {
			
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/ssb");
		con = ds.getConnection();
			
		System.out.println("DAO: 디비 연결 성공!");
		System.out.println("DAO: " + con);
		return con;			
	}
		
	// 공통) 디비 자원해제
	public void CloseDB() {
			
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close(); 
			if(con != null) con.close(); 
		} catch(SQLException e) {
			e.printStackTrace();
		}
			
	}
	
	
	// 문의글 답변 작성하기 메서드 - insertInquiryABoard(ReplyDTO rdto)
	public void insertInquiryABoard(ReplyDTO rdto) {
		int replyId = 0;
		
		try {
			// 1.2. 디비 연결
			con = getCon();
			
			// reply_id 계산
			// 3. SQL 구문(select) & pstmt 객체
			sql = "select max(reply_id) from reply";
			pstmt = con.prepareStatement(sql);
						
			// 4. SQL 실행
			rs = pstmt.executeQuery();
						
			// 5. 데이터 처리
			if(rs.next()) {
				// reply_id = rs.getInt("max(reply_id)") + 1;
				// => getInt(int columnIndex):
				replyId = rs.getInt(1) + 1; 
			} else {
				replyId = 1;
			}
						
			System.out.println("DAO: 댓글번호: " + replyId);
			
			// 3. SQL 구문(insert) & pstmt 객체
			sql = "insert into reply(reply_id, board_id, reply_content, reply_writeTime) "
					+ "values(?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			
			// ?		
			pstmt.setInt(1, replyId);
			pstmt.setInt(2, rdto.getBoard_id());
			pstmt.setString(3, rdto.getReply_content());
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO: 문의글 답변 작성하기 완료!");		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		
	} 	
	// 문의글 답변 작성하기 메서드 - insertInquiryABoard(ReplyDTO rdto)
	
	// 댓글 작성하기 메서드 - insertReply(ReplyDTO rdto)
//	public void insertReply(ReplyDTO rdto) {
//		int replyId = 0;
//		
//		try {
//			// 1.2. 디비 연결
//			con = getCon();
//			
//			// reply_id 계산
//			// 3. SQL 구문(select) & pstmt 객체
//			sql = "select max(reply_id) from reply";
//			pstmt = con.prepareStatement(sql);
//						
//			// 4. SQL 실행
//			rs = pstmt.executeQuery();
//						
//			// 5. 데이터 처리
//			if(rs.next()) {
//				// reply_id = rs.getInt("max(reply_id)") + 1;
//				// => getInt(int columnIndex):
//				replyId = rs.getInt(1) + 1; 
//			} else {
//				replyId = 1;
//			}
//						
//			System.out.println("DAO: 댓글번호: " + replyId);
//			
//			// 3. SQL 구문(insert) & pstmt 객체
//			sql = "insert into reply(reply_id, board_id, reply_content, reply_writeTime) "
//					+ "values(?, ?, ?, now())";
//			pstmt = con.prepareStatement(sql);
//			
//			// ?		
//			pstmt.setInt(1, replyId);
//			pstmt.setInt(2, rdto.getBoard_id());
//			pstmt.setString(3, rdto.getReply_content());
//			
//			// 4. SQL 실행
//			pstmt.executeUpdate();
//			
//			System.out.println("DAO: 문의글 답변 작성하기 완료!");		
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			CloseDB();
//		}
//		
//	} 
	// 댓글 작성하기 메서드 - insertReply(ReplyDTO rdto)
	
}