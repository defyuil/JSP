<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertPro.jsp</h1>
	
	<%
		// 한글처리 
		request.setCharacterEncoding("utf-8");
		// 전달정보(파라메터) 확인 , 저장
		// String id = request.getParameter("id"); (기존X)
		// => 액션태그 사용
	%>
		<!-- 자바빈 객체 생성 -->
		<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<!-- 전달정보(파라메터)를 자바빈에 저장 -->
		<jsp:setProperty property="*" name="mb" />
	<%
		System.out.println(mb.toString());    
	    
	    // 나이정보 계산
	    int bYear = Integer.parseInt(request.getParameter("bYear"));
		//System.out.println(bYear);
		
		Date today = new Date();
		//System.out.println( today );
// 		System.out.println( today.getYear()+1900 - bYear );
	
		mb.setAge( today.getYear() + 1900 - bYear  );
		mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(mb.toString());    
	
		// 전달된 데이터를 DB에 저장
		/***********************************************************************/
		// 디비연결정보 
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println(" 드라이버 로드 성공! ");
		// 2. 디비 연결
		Connection con 
		 = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" 디비연결 성공! ");
		// 3. sql구문 작성 & pstmt객체
		String sql 
		= "insert into itwill_member(id,pw,name,gender,age,email,regdate) values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// ??? 
		pstmt.setString(1, mb.getId());
		pstmt.setString(2, mb.getPw());
		pstmt.setString(3, mb.getName());
		pstmt.setString(4, mb.getGender());
		pstmt.setInt(5, mb.getAge());
		pstmt.setString(6, mb.getEmail());
		pstmt.setTimestamp(7, mb.getRegdate());
		
		// 4. sql 실행
		pstmt.executeUpdate();
		System.out.println(" 회원가입 성공! ");
		/***********************************************************************/
		// 로그인 페이지로 이동
		response.sendRedirect("loginForm.jsp");
	
	%>
	
	
	
	
	
</body>
</html>