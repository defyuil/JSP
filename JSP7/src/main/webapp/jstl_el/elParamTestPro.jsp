<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>elParamTestPro.jsp</h1>
		
		<h2> elParamTest.jsp 페이지에서 전달된 정보 출력하기 </h2>
		<%
		    // 한글처리 
		    request.setCharacterEncoding("UTF-8");
			// 전달해준 정보 저장(id,name,age)
// 			String id = request.getParameter("id");
// 			String name = request.getParameter("name");
// 			int age = Integer.parseInt(request.getParameter("age"));			
		%>		
		<h3>JSP 코드</h3>
		<p>
<%-- 			아이디 : <%=id %><br> --%>
<%-- 			이름 : <%=name %><br> --%>
<%-- 			나이 : <%=age %><br>		 --%>
		</p>
		<h3>EL 코드</h3>
		<p>
			아이디 : ${param.id }<br>
			이름 : ${param.name }<br>
			나이 : ${param.age }<br>		
			나이 +100 : ${param.age + 100 }<br>		
			EL 표현식은 자동으로 정수데이터를 형변환 한다
		</p>
		
		<hr>
		<h2> 중복된 이름의 파라메터 정보를 저장 </h2>
		<% 
		    // 중복된 데이터를 처리X
			String foods1 = request.getParameter("foods");
			String foods2 = request.getParameter("foods");
			String[] foods = request.getParameterValues("foods");
		%>
		<h3> JSP </h3>
		음식1 : <%=foods1 %> <br>
		음식2 : <%=foods2 %> <br>
		
		음식1 : <%=foods[0] %> <br>
		음식2 : <%=foods[1] %> <br>
		
		<h3> EL </h3>
		
		음식1 : ${param.foods } <br>
		음식2 : ${param.foods } <br>
		
		음식 : ${paramValues.foods }<br>
		음식1 : ${paramValues.foods[0] }<br>
		음식2 : ${paramValues.foods[1] }<br>
		
		<hr>
		<%
		  String[] hobbys = request.getParameterValues("hobbys");
		
		  if(hobbys != null){
			  for(int i=0;i<hobbys.length;i++){
				  %>
				  	취미 : <%=hobbys[i] %><br>
				  <%		  
			  }
		  }
		%>
		<hr>
		* EL표현식은 + JSP 반복문 사용 불가능 => JSTL-foreach구문 <br>
		
		취미 : ${paramValues.hobbys[0] }<br>
		취미 : ${paramValues.hobbys[1] }<br>
		취미 : ${paramValues.hobbys[2] }<br>
		
		
		
		
		
		

</body>
</html>