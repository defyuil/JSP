package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8088/JSP7/exServlet

@WebServlet("/exServlet")
public class ExServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ExServlet_doGet() 호출");
		doPost(request, response);
	}// doGet

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ExServlet_doPost() 호출");
		
		// Person정보를 생성해서 전달 => core_set2.jsp
		Phone phone1 = new Phone();
		phone1.setModel("아이폰");
		phone1.setTel("010-1324-1234");
		
		Person p1 = new Person();
		p1.setName("아이티윌");
		p1.setAge(20);
		p1.setPhone(phone1);
		
		Phone phone2 = new Phone();
		phone2.setModel("갤럭시");
		phone2.setTel("010-5555-7777");
		
		Person p2 = new Person();
		p2.setName("부산");
		p2.setAge(22);
		p2.setPhone(phone2);
		
		// request 영역에 정보를 저장
		request.setAttribute("person1", p1);
		//	<c:set />(사용불가)
		
		//ArrayList<E>
		//Vector<E>
		Vector personList = new Vector();
		personList.add(p1);
		personList.add(p2);

		request.setAttribute("personList", personList);
		
		
		// 	core_set2.jsp 페이지 이동(request 영역정보를 가지고)
		RequestDispatcher dis 
		    //= request.getRequestDispatcher("./jstl_el/core_set2.jsp");
		= request.getRequestDispatcher("./jstl_el/core_foreach.jsp");
		
		dis.forward(request, response);		
		//  forward이동
		// 1) request 영역의 정보를 전달
		// 2) 주소를 변경X, 화면을 변경O
		
		
	}// doPost
	
}// class
