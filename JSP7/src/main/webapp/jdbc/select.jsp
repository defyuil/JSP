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
	<h1>select.jsp</h1>

	<h2>데이터베이스에 저장된 정보를 조회</h2>

	<%
	// 디비연결 정보 (상수)
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
	System.out.println(" 디비 연결 성공! ");
	
	// 3. sql 구문 작성 & pstmt 객체
	String sql 
	//= "select * from itwill_member where idx = ?";
	= "select * from itwill_member";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// ???
	//pstmt.setInt(1, 7);		

	// 4. sql 구문 실행
	// 	pstmt.executeUpdate();  insert
	// 	pstmt.executeQuery();   select
	
	ResultSet rs = pstmt.executeQuery();
	System.out.println(" SQL 실행 완료! ");
	
	// 5. 데이터 처리( DB정보를 화면 출력 )
	
	// rs.next() : 레코드셋의 커서를 다음으로 이동
	//             데이터가 있는지 없는지 체크
	//             데이터가 있을때 true, 없을때 false
	
	// rs.getXXXX("컬럼명") : 가져올 데이터 타입에 맞는 메서드 호출
	// rs.getXXXX(인덱스번호) : 가져올 데이터 타입에 맞는 메서드 호출
	// => 인덱스를 사용한 방법이 처리속도가 빠르다
	
	
// 	while(rs.next()){ 
// 		//데이터 있을때 => 해당데이터 활성화
// 		// 테이블 데이터 -> 화면 출력
// 		out.println("번호 : "+ rs.getInt("idx")+"<br>");	
// 		out.println("이름 : "+ rs.getString("name")+"<br>");	
// 		out.println("성별 : "+ rs.getString("gender")+"<br>");	
// 		out.println("나이 : "+ rs.getInt("age")+"<br>");	
// 		out.println("주민번호 : "+ rs.getString("jumin")+"<hr>");	
// 	}
	
	
	
	%>

   <table border="1">
     <tr>
     	<td>번호</td>
     	<td>이름</td>
     	<td>성별</td>
     	<td>나이</td>
     	<td>주민번호</td>
     </tr>
     
     <%while(rs.next()){ %>
	     <tr>
	     	<td><%=rs.getInt("idx") %></td>
	     	<td><%=rs.getString("name") %></td>
	     	<td><%=rs.getString("gender") %></td>
	     	<td><%=rs.getInt("age") %></td>
	     	<td><%=rs.getString("jumin") %></td>
	     </tr>
     <%} %>
     
   </table>

















</body>
</html>