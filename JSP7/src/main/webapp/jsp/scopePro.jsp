<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>scopePro.jsp</h1>
	
	<%
		String id = request.getParameter("id");
	%>	
	
	아이디(파라메터) : <%=id %><hr>
	
	<h2> 영역객체 생성 </h2>
	<%
	    // 해당페이지에서만 사용가능
		pageContext.setAttribute("p", "pageValue!");
		request.setAttribute("r", "requestValue!");
		session.setAttribute("s", "sessionValue!");
		application.setAttribute("a", "applicationValue");	
	%>
	
	
	<h2> 영역객체 사용 </h2>
	page영역값 : <%=pageContext.getAttribute("p") %><br>
	page영역값 : <%=pageContext.getAttribute("p2") %><br>
	request영역값 : <%=request.getAttribute("r") %><br>
	session영역값 : <%=session.getAttribute("s") %><br>
	application영역값 : <%=application.getAttribute("a") %><br>
	
	<hr>
	<h2> 페이지 이동시 영역객체 사용 </h2>
	
	<h2>1. HTML코드 : a태그 </h2>
	<h3>  전달가능 데이터 : 파라메터, session, application </h3>
	<a href="scopeAction.jsp?id=<%=id%>&pw=1234">a태그 페이지 이동</a>
	
	<h2>2. JavaScript코드 : location.href </h2>
	<h3>  전달가능 데이터 : 파라메터, session, application </h3>
	<script type="text/javascript">
// 		alert("js코드 페이지이동!");
<%-- 		location.href="scopeAction.jsp?id=<%=id%>&pw=1234";	 --%>
	</script>
	
	<h2>3. JSP코드 : response.sendRedirect()</h2>
	<h3>  전달가능 데이터 : 파라메터, session, application </h3>
	<%
	    //JSP 파일 실행순서
	    // JSP(java) => HTML => JavaScript
	    // * JSP코드,JS코드 페이지 이동처리는 둘중에 하나만 사용
		//response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
	%>
	
	<!--
	     포워딩(forward) 이동방식의 특징
	     1) request영역정보 전달가능
	     2) 주소 변경X, 화면 변경O
	 -->	
	<h2>4. 액션태그 : forward </h2>
	<h3>  전달가능 데이터 : 파라메터, request, session, application </h3>
	<jsp:forward page="scopeAction.jsp?id=<%=id %>&pw=1234"/>
	
	
	
	
	
	
</body>
</html>