package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestServlet1 extends HttpServlet{
	
	// http://localhost:8088/JSP7/test1
	
	// alt shift s + v
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("TestServlet1_doGet() 실행");
		 doPost(request, response);		 
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet1_doPost() 실행");
	
		//page영역에 정보를 저장해서 전달 => JSP 출력 가능 X
		//session영역에 정보를 저장해서 전달 => JSP 출력 가능 O
		
		// 데이터 생성 -> JSP 페이지에서 출력
		// request영역에 정보를 저장해서 전달
		request.setAttribute("cnt", 2000);
		
		// session영역 정보 저장
		HttpSession session = request.getSession();
		session.setAttribute("cnt", 5000);
		
		// 서블릿 + JSP( attribute.jsp )연결 (포워딩)
		RequestDispatcher dis 
		     = request.getRequestDispatcher("./jstl_el/attribute.jsp");
		dis.forward(request, response);
	}// doPost
	
	

}
