<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.itwillbs.dto.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  	// model1 방식으로 게시판 글정보 조회
  	// 1. 드라이버 로드
  	Class.forName("com.mysql.cj.jdbc.Driver");
  	// 2. 디비연결
  	Connection con =
  	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
  	// 3. sql 작성 (select)& pstmt 객체
  	String sql = "select bno,subject,name,date,readcount from itwill_board";
  	PreparedStatement pstmt = con.prepareStatement(sql);
  	// 4. sql 실행
  	ResultSet rs = pstmt.executeQuery();  	
  	// 5. 데이터 처리  	
	//ArrayList boardList = new ArrayList();
  	JSONArray boardList = new JSONArray();
  	while(rs.next()){
		// rs -> DTO -> list  		
  		//BoardDTO dto = new BoardDTO();
		
// 		dto.setBno(rs.getInt("bno"));
// 		dto.setName(rs.getString("name"));
// 		dto.setSubject(rs.getString("subject"));
// 		dto.setDate(rs.getDate("date"));
// 		dto.setReadcount(rs.getInt("readcount"));

		JSONObject dto = new JSONObject();
		dto.put("bno", rs.getInt("bno"));
		dto.put("name", rs.getString("name"));
		dto.put("subject", rs.getString("subject"));
		//dto.put("date", rs.getDate("date").toString());
		dto.put("date", rs.getDate("date")+"");
		dto.put("readcount", rs.getInt("readcount"));
		
		boardList.add(dto);
  	}  	
  %>
  <%=boardList %>