<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>updatePro.jsp</h1>
		<%
		  // 한글처리 
		  request.setCharacterEncoding("UTF-8");
		  // 전달정보 저장(idx,name)
		  int idx =Integer.parseInt(request.getParameter("idx"));
		  String name = request.getParameter("name");
		
		%>
		<h2> 수정 정보 </h2>
		번호 : <%=idx %><br>
		이름 : <%=name %><br>
		
		 <%
			// DB 테이블의 정보를 수정
					  
			 	// 디비연결 정보 (상수)
				final String DRIVER = "com.mysql.cj.jdbc.Driver";
				final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
				final String DBID = "root";
				final String DBPW = "1234";
	
				// 1. 드라이버 로드
				 Class.forName(DRIVER);
				System.out.println(" 드라이버 로드 성공! ");
				// 2. 디비 연결
				Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
				System.out.println(" 디비연결 성공! ");
	
				// 3. sql 구문작성 & pstmt 객체
				String sql = "update itwill_member set name=? where idx = ?";
				PreparedStatement pstmt = con.prepareStatement(sql);

				// ???
				pstmt.setString(1, name);
				pstmt.setInt(2, idx);
	
				// 4. sql 구문실행
				pstmt.executeUpdate();
				System.out.println(" 회원정보(이름) 수정완료! ");
			%>
			
			
			<a href="select.jsp"> 결과 확인하기 </a>
		
		
		
		
		
		
</body>
</html>