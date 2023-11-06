package com.itwillbs.ssb.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.ssb.db.cartDAO;
import com.itwillbs.ssb.db.cartDTO;
import com.itwillbs.ssb.db.orderDTO;
import com.itwillbs.ssb.util.Action;
import com.itwillbs.ssb.util.ActionForward;

public class orderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cart_id = request.getParameter("cart_id");
		String cart_quantity = request.getParameter("cart_quantity");
		String item_options_name = request.getParameter("item_options_name");
		String item_options_value = request.getParameter("item_options_value");
		cartDAO dao = new cartDAO();
		ArrayList<orderDTO> dtoArray = dao.getOrder(cart_id);
		
		request.setAttribute("dtoArray", dtoArray);
		
		// 페이지 이동준비 
		ActionForward forward = new ActionForward();
		forward.setPath("./order/order.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
