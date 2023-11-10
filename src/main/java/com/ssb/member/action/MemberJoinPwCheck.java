package com.ssb.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class MemberJoinPwCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinPwCheck_execute() 호출");
		
		PrintWriter out = response.getWriter();
		
		// 정보 저장
		String member_pw = request.getParameter("userPw");
		
		
		
		return null;
	}

}
