package com.itwillbs.ssb.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itwillbs.ssb.db.cartDAO;
import com.itwillbs.ssb.db.optionsDTO;

@WebServlet("/cartAJAX.ca")
public class cartAJAX extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartAJAX() {
		super();
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//GSON생성
		Gson gson = new Gson();
		// 정보저장
		String item_id = request.getParameter("item_id");
		System.out.println(item_id);
		
		cartDAO dao = new cartDAO();
		List<optionsDTO> list = dao.getOptions(item_id);
		String listJson = gson.toJson(list);
		System.out.println(listJson);

		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(listJson); // 전송이 되는 부분
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("cartAJAX doGet()");
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("cartAJAX doPOST()");
		doProcess(request,response);
	}

}
