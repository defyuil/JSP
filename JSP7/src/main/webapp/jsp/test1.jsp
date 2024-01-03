<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<!--  ctrl +F11 실행 -->
	
	
	<!-- HTML주석문 : ctrl shift / , \ -->
	<script type="text/javascript">
		// JS 주석문
	    /* JS 주석문 */
	</script>
	<%-- JSP 주석문 --%>
	<% 
	   //  JAVA(JSP) 주석문
	   /*  JAVA(JSP) 주석문 */
	%>
	
	<!-- int itwill;(HTML - X) -->
	<!-- 1. 선언문 -->
	<%!
	    // 자바코드 사용가능
		int itwill=100;
		// 메서드 선언O
	    public void methodA(){
			System.out.println(itwill);
	    }
		// 메서드 호출X
		//System.out.println(itwill);	
	%>
	<!-- 2. 스크립틀릿 -->
	<%
		int busan = 200; 	// 지역변수
		
		//메서드 호출O
		System.out.println(itwill);	
		System.out.println(busan);
	%>
	<!-- 3. 표현식 -->
	<%=itwill %><br>
	busan = <%=busan %> <br>
	
	
	
	
	
	
	
	

</body>
</html>