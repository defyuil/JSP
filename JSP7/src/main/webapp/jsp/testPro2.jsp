<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro2.jsp</h1>

	전달정보 출력(파라메터)
	<br>

	<%
	// 폼태그 정보전송(post방식) -> 한글처리 (인코딩설정)
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
// 	String hobby1 = request.getParameter("hobby");
// 	String hobby2 = request.getParameter("hobby");
	String[] hob = request.getParameterValues("hobby");
	%>

	이름 :
	<%=name%><br>
    이름+100 :
	<%=name + 100%><br>
	 나이 :
	<%=age%><br>
	 나이+100 :
	<%=age + 100%><br>
	 성별 :
	<%=gender%><br>
	
<!-- 	 취미 : -->
<%-- 	<%=hob[0]%><br> --%>
<!-- 	 취미 : -->
<%-- 	<%=hob[1]%><br> --%>
	<%
	   if(hob != null){ // 배열이 있을때
		for(int i=0;i<hob.length;i++){
	%>
		 취미 : <%=hob[i] %><br>		
	<%	
		}
	   }
	%>
	 
	<%
		String subject = request.getParameter("subject");
	%>
	과목 : <%=subject %><br>
	 
	 









</body>
</html>