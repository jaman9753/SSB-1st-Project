package com.ssb.main.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;

import com.mysql.cj.Session;
import com.ssb.main.db.ItemDAO;
import com.ssb.main.db.ItemDTO;
import com.ssb.member.db.MemberDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : MainAction_execute() 호출! ");
		
		ItemDAO idao = new ItemDAO();
		
		ArrayList itemList = idao.getMainItemList();
		
		request.setAttribute("itemList", itemList);
		

		ActionForward forward = new ActionForward();
		forward.setPath("./main/main.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
