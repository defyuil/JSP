<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
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
	<h1>./file/fileUploadPro.jsp</h1>
	
	<%
		// 1. cos.jar 라이브러리 설치 (프로젝트당 1번)
		// 2. 파일이 업로드되는 장소(upload 폴더) 생성
		// 3. 업로드 파일의 크기 제한(5mb)
		
		// 파일이 저장되는 장소(tomcat서버에 저장되는 장소)
		// => 가상주소
		String realPath = request.getRealPath("/upload");
	    System.out.println("realPath : "+realPath);
	    
	    // byte -> KB(1024byte) -> MB(1024KB) 
	    // 파일의 크기
	    int maxSize=5*1024*1024; //5MB
	    
	    // 파일업로드 => MultipartRequest 객체를 생성
	    MultipartRequest multi 
	         = new MultipartRequest(
	        		 request,
	        		 realPath,
	        		 maxSize,
	        		 "UTF-8",
	        		 new DefaultFileRenamePolicy()
	        		 );
	    
	    System.out.println(" 파일 업로드 성공! ");
	    
	    // 전달정보 처리(파라메터 name,msg)
	    // => request 처리 불가능
	    //String name = request.getParameter("name");
// 	    String msg = request.getParameter("msg");
		// => multi 객체 사용하여 처리
	    String name = multi.getParameter("name");
	    String msg = multi.getParameter("msg");
	    
	    // 업로드된 파일의 이름정보
	    // => 파라메터정보 처리 불가능
	    String fileName = multi.getParameter("file");
	    String fileName1 = multi.getFilesystemName("file");
	    // => 업로드시 파일의 이름(중복일경우 이름변경)
	    String fileName2 = multi.getOriginalFileName("file");
	    // => 업로드시 파일의 원본이름
		
	%>
	  <h2>전달정보 (name):<%=name %></h2>
	  <h2>전달정보 (msg):<%=msg %></h2>
	  <h2>전달정보 (fileName):<%=fileName %></h2>
	  <h2>전달정보 (fileName1):<%=fileName1 %></h2>
	  <h2>전달정보 (fileName2):<%=fileName2 %></h2>
	  
	  <hr>
	  
	  <h2> 파일 다운로드 </h2>
	  
	  <a href="../upload/<%=fileName1%>"><%=fileName1 %></a><br>
	  <!-- html5 제공하는 a태그 속성 -->
	  <a href="../upload/<%=fileName1%>" download><%=fileName1 %></a><br>
	  
	  다운로드(JSP):<a href="fileDownload.jsp?fileName=<%=fileName1 %>" ><%=fileName1 %></a>
	  
	
	
	
</body>
</html>