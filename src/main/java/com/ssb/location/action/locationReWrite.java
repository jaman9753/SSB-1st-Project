package com.ssb.location.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.location.db.locationDAO;
import com.ssb.location.db.locationDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class locationReWrite implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 받은정보저장
		int location_id = Integer.parseInt(request.getParameter("location_id"));
		int member_id = Integer.parseInt(request.getParameter("member_id"));// 세션에서 받아오기
		System.out.println(location_id);
		System.out.println(member_id);
		// 데이터 처리
		locationDAO dao = new locationDAO();
		locationDTO dto = dao.getReWrite(location_id,member_id);
		System.out.println(dto);
		request.setAttribute("dto", dto);
		// 페이지 이동준비
		ActionForward forward = new ActionForward();
		forward.setPath("/location/locationReWrite.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
