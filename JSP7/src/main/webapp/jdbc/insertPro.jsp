<%@page import="java.sql.PreparedStatement"%>
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
	<h1>/jdbc/insertPro.jsp</h1>
	
	<!-- 전달정보 저장 -->
	<%
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
	
	   //전달정보(파라메터) 저장
	   String name = request.getParameter("name");
	   String gender = request.getParameter("gender");
	   int age = Integer.parseInt(request.getParameter("age"));
	   
	   String ju1 = request.getParameter("ju1");
	   String ju2 = request.getParameter("ju2");
	   
	   String jumin = ju1+"-"+ju2;
	%>
	
	이름 :<%=name %><br>
	성별 :<%=gender %><br>
	나이 :<%=age %><br>
	주민번호 : <%=ju1 %>-<%=ju2 %><br>
	주민번호 : <%=jumin %><br>
	
	<h2> 전달받은 정보를 DB(Mysql)로 전달 </h2>
	
	<%
		// 디비연결 정보 (상수)
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println(" 드라이버로드 성공! ");
		// 2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" 디비연결 성공! ");

		// 3. sql구문 작성 & stmt 객체
// 		String sql 
// 		="insert into itwill_member(idx,name,gender,age,jumin) values(null,'"+name+"','"+gender+"',"+age+",'"+jumin+"')";
		
		String sql 
		="insert into itwill_member(idx,name,gender,age,jumin) values(null,?,?,?,?)";
		//Statement stmt = con.createStatement();
		PreparedStatement pstmt = con.prepareStatement(sql) ;
		
		// ??? - 정보 추가 ( ? 개수 == setXXX 개수 )
		// pstmt.setXXXXX( ?의 위치 , 저장하는 데이터값 );
		//         XXXXX (내가 저장하려는 데이터 타입)
		
		pstmt.setString(1, name);
		pstmt.setString(2, gender);
		pstmt.setInt(3, age);
		pstmt.setString(4, jumin);

		// 4. SQL 실행
		//stmt.executeUpdate(sql);
		pstmt.executeUpdate();
		// 실행의 결과가 테이블에 변화를 주는경우 executeUpdate() 사용
		
		System.out.println("회원정보 저장완료!");
		%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>