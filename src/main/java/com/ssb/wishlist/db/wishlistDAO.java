package com.ssb.wishlist.db;

import java.util.ArrayList;

import com.ssb.util.DAO;

public class wishlistDAO extends DAO{
	
	//위시리스트 조회 메서드
	public ArrayList<wishlistDTO> getWishlist(String member_id) {
		ArrayList<wishlistDTO> dtoArray = new ArrayList<wishlistDTO>();
		wishlistDTO dto = null;
		try {
			con = getCon();
			sql = "SELECT wishlist_id, W.item_id, item_name, item_img_main, item_price FROM wishlist W JOIN item I ON W.item_id = I.item_id WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(member_id));
			System.out.println("전송된 쿼리 : " + pstmt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = new wishlistDTO();
				dto.setWishlist_id(rs.getInt("wishlist_id"));
				dto.setItem_id(rs.getInt("item_id"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img_main(rs.getString("item_img_main"));
				dto.setItem_price(rs.getInt("item_price"));
				dtoArray.add(dto);
				System.out.println("dto 추가");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			CloseDB();
		}
		return dtoArray;
	}
	
}
