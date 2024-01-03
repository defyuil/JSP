<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writePro.jsp</h1>
	<%
		// 한글 인코딩 처리	
		request.setCharacterEncoding("UTF-8");
		// 전달정보 저장(파라메터) => 자바빈-액션태그 사용
	%>
		<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
		<jsp:setProperty property="*" name="bb"/>	
	<% 	
		System.out.println(bb.toString());
		// IP주소 저장
		bb.setIp(request.getRemoteAddr());
		System.out.println(bb);
	
		// DB에 글정보 저장		
		
		// BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(bb);
		
		// 리스트 페이지로 이동
		response.sendRedirect("boardList.jsp");
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>