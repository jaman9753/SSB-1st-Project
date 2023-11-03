package com.itwillbs.ssb.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class cartDAO {
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

			System.out.println(" DAO : 디비연결 성공!! ");
			System.out.println(" DAO : " + con);
			return con;
		}

		// 공통) 디비 자원해제
		public void CloseDB() {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//장바구니 목록 조회 메서드
		public ArrayList<cartDTO> getCart(String member_id) {
			ArrayList<cartDTO> dtoArray = new ArrayList<cartDTO>();
			cartDTO dto = null;
			try {
				con = getCon();
				sql = "SELECT cart_id,C.item_id,cart_quantity,item_name,item_img_server,options_id,options_name,options_value,options_price,options_quantity FROM cart C JOIN item I ON C.item_id = I.item_id JOIN options O ON I.item_id = O.item_id WHERE member_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new cartDTO();
					dto.setCart_id(rs.getInt("cart_id"));
					dto.setItem_id(rs.getInt("item_id"));
					dto.setCart_quantity(rs.getInt("cart_quantity"));
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_img_server(rs.getString("item_img_server"));
					dto.setOptions_id(rs.getInt("options_id"));
					dto.setOptions_name(rs.getString("options_name"));
					dto.setOptions_value(rs.getString("options_value"));
					dto.setOptions_price(rs.getInt("options_price"));
					dto.setOptions_quantity(rs.getInt("options_quantity"));
					dtoArray.add(dto);
					System.out.println("dto 추가");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			return dtoArray;
		}

		public ArrayList<orderDTO> getOrder(String cart_id) {
			ArrayList<orderDTO> dtoArray = new ArrayList<orderDTO>();
			orderDTO dto = null;
			try {
				con = getCon();
				sql = "SELECT item_name,item_options_name,item_options_value,cart_quantity,item_price FROM cart C JOIN item I ON C.item_id = I.item_id WHERE cart_id IN(?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cart_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new orderDTO();
					dto.setItem_name(rs.getString("item_name"));
					dto.setItem_options_name(rs.getString("item_options_name"));
					dto.setItem_options_value(rs.getString("item_options_value"));
					dto.setCart_quantity(rs.getInt("cart_quantity"));
					dto.setItem_price(rs.getInt("item_price"));
					dtoArray.add(dto);
					System.out.println("dto 추가");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			return dtoArray;
		}

		public int updateCart(String cart_id, String cart_quantity, String item_options_name, String item_options_value) {
			int result = -1;
			try {
				con = getCon();
				sql = "UPDATE cart SET item_id = (SELECT item_id FROM item WHERE )";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cart_id);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			return result;
		}
<<<<<<< HEAD

		public ArrayList<optionsDTO> getOptions(String item_id) {
			ArrayList<optionsDTO> dtoArr = new ArrayList<optionsDTO>();
			optionsDTO dto = null;
			try {
				con = getCon();
				sql = "SELECT options_id,options_name,options_value,options_price,options_quantity FROM options WHERE item_id = ? ORDER BY options_id";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, item_id);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					dto = new optionsDTO();
					dto.setOptions_id(rs.getInt("options_id"));
					dto.setOptions_name(rs.getString("options_name"));
					dto.setOptions_value(rs.getString("options_value"));
					dto.setOptions_price(rs.getInt("options_price"));
					dto.setOptions_quantity(rs.getInt("options_quantity"));
					dtoArr.add(dto);
					System.out.println("dto 추가");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				CloseDB();
			}
			return dtoArr;
		}
=======
>>>>>>> parent of e5478b5 (20231102)
}
