<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fileWritePro.jsp</h1>
	
	<%
	  // 첨부파일 업로드
	  
	  // upload 폴더 생성 - 완료
	  String realPath = request.getRealPath("/upload");
	  System.out.println("realPath : "+realPath);
	  
	  // 파일의 크기
	  int maxSize = 5*1024*1024; // 5MB
	  
	  // MultipartRequest 객체 생성
	  MultipartRequest multi 
	     = new MultipartRequest(
	    		 request,
	    		 realPath,
	    		 maxSize,
	    		 "UTF-8",
	    		 new DefaultFileRenamePolicy()
	    		 );
	  
	  System.out.println(" 첨부파일 업로드 완료! ");
	  
	  
	  // 전달된 정보(파라메터)처리
	  %>
<%-- 	  <jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/> --%>
<%-- 	  <jsp:setProperty property="*" name="bb"/> --%>
	  <%
	  // 액션태그 사용 저장X
	  // 직접 자바빈 객체 생성 저장
	  BoardBean bb = new BoardBean();
	  bb.setName(multi.getParameter("name"));
	  bb.setSubject(multi.getParameter("subject"));
	  bb.setContent(multi.getParameter("content"));
	  bb.setPass(multi.getParameter("pass"));
	  bb.setFile(multi.getFilesystemName("file"));
	  
	  bb.setIp(request.getRemoteAddr());
	  
	  System.out.println(bb);
	  
	  //=> DB에 저장
	  // BoardDAO 객체 - 파일정보가 포함된 글정보를 저장하는 메서드		  
	  BoardDAO bdao = new BoardDAO();
	  bdao.insertBoard(bb);
	  
	  // 페이지 이동(boardList.jsp)
	  response.sendRedirect("boardList.jsp");
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>