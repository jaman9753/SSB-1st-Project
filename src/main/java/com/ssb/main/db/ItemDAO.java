package com.ssb.main.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ssb.rental.db.RentalDTO;

public class ItemDAO {
	
	// 공통변수 선언
	
		private Connection con = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		private String sql = "";
		
		// 디비연결수행
		private Connection getCon() throws Exception{
		
		
		Context initCTX = new InitialContext(); // 프로젝트의 정보를 확인(JNDI)
		DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/ssb");
		con = ds.getConnection();
		
		
		System.out.println("DAO : 디비 연결 성공!");
		System.out.println("DAO : "+con);
		
		return con;
		
		}
		
		// 디비 자원해제
		public void CloseDB() {
			try {
				if(rs != null)rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
					
		 	} catch (SQLException e) {
		 		e.printStackTrace();
			}
		}
	
	
	
	// 메인화면 출력 메서드 - mainPrint()
	public ArrayList getMainItemList() {
		ArrayList itemlList = new ArrayList();
		
		try {
			con = getCon();
			sql = "select * from item order by item_id";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDTO idto = new ItemDTO();
				idto.setItem_id(rs.getInt("item_id"));
				idto.setItem_name(rs.getString("item_name"));
				idto.setItem_price(rs.getInt("item_price"));
				idto.setItem_img_main(rs.getString("item_img_main"));
				idto.setItem_img_sub(rs.getString("item_img_sub"));
				idto.setItem_img_logo(rs.getString("item_img_logo"));
				idto.setCategory_id(rs.getInt("category_id"));
				
				itemlList.add(idto);
				
			}
			System.out.println("DAO : 렌탈아이템 조회 성공!");
			System.out.println("DAO 조회 행수 : "+itemlList.size());
			
		} catch (Exception e) {
		
			e.printStackTrace();
		}finally {
			CloseDB();
		}
		
		return itemlList;
		
		
			
	}

}
