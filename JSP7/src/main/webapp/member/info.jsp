<%@page import="java.sql.ResultSet"%>
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
	<h1>info.jsp</h1>

	<h2>내정보 보기</h2>

	<%
	// 로그인 세션확인 
	String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}

	// 내정보(DB)를 화면에 출력
	// 디비연결정보 
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	// 1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println(" 드라이버 로드 성공! ");
	// 2. 디비연결
	Connection con =
	  DriverManager.getConnection(DBURL, DBID, DBPW);
	// 3. SQL 구문 작성 & pstmt 객체
	String sql = "select * from itwill_member where id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// ???
	pstmt.setString(1, id);
	
	// 4. SQL 실행
	ResultSet rs = pstmt.executeQuery();
	// 5. 데이터 처리
	if(rs.next()){
		// 내정보 화면에 출력
		%>
		 <h3>아이디 : <%=rs.getString("id") %></h3>
		 <h3>이름 : <%=rs.getString("name") %></h3>
		 <h3>성별 : <%=rs.getString("gender") %></h3>
		 <h3>나이 : <%=rs.getInt("age") %></h3>
		 <h3>이메일 : <%=rs.getString("email") %></h3>
		 <h3>회원가입일 : <%=rs.getTimestamp("regdate") %></h3>
		<%		
	}
	%>
	
	
	<h2><a href="main.jsp">메인페이지로...</a></h2>
	




</body>
</html>