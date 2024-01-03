<%@page import="java.sql.Statement"%>
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
	<h1>insert.jsp (SQL구문 실행)</h1>
	
	<%
		// 0. 드라이버(라이브러리) 설치
		
		// 디비연결 정보 (상수)
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
	    System.out.println(" 드라이버 로드성공! ");
		
		// 2. 디비 연결
		Connection con =
		DriverManager.getConnection(DBURL, DBID , DBPW);
	    System.out.println(" 디비 연결성공! ");
	    System.out.println(" con : "+con);
	    
	    // 3. sql구문 작성 & stmt 객체 생성
	    // Statement - SQL구문을 실행하게 하는 객체
	    Statement stmt = con.createStatement();
	    
	    // sql구문에는 ; 제거해야함
	    String sql 
	     = "insert into itwill_member(idx,name,gender,age,jumin) values(null,'김학생','W',43,'000101-7894561')";
	    
	    // 4. sql 실행
	    stmt.executeUpdate(sql);
	    
	    System.out.println(" 정상 실행 완료! ");
	    
	%>













	
	
	
	
</body>
</html>