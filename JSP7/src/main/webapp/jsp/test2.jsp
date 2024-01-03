<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>
	
	<h2>JAVA/JSP 사용해서 정보 출력</h2>
	
	<%
		//자바코드 사용하기위해서 
		// 스크립틀릿 사용해야한다.
		String[] arr = {"JAVA","JSP","JS","WEB","DB"};
	
		System.out.println(arr[1]);
		
		// JAVA	 JSP  JS  WEB  DB 출력
		for(int i=0;i<arr.length;i++){
			System.out.print(arr[i]+" ");
		}
		
		for(int i=0;i<arr.length;i++){
			//out.print(" HTML코드 작성 ");
			out.print(arr[i]+" ");
		}
		%>
		
		<%
		    //jsp
			for(int i=0;i<arr.length;i++){
		    //jsp
	    %>	
			<h1> 안녕! <%=arr[i] %> </h1>
	    <%		
	       //jsp
			}		
	       //jsp
	    %>
	 	 <hr>
	 	 <h2> JSP 코드 사용 </h2>
	 	 <table border="1">
	 	 <%
	 	 	for(int i=0;i<5;i++){
	 	 %>	
	 	 	<tr>
	     		<td><%=i+1 %></td>
	     		<td><%=arr[i] %></td>
	     	</tr>	
	 	 <% 		
	 	 	}	 	 
	 	 %>	 	 
	 	 </table>
	
	     <hr>
	 	 <h2> HTML 코드 사용 </h2>
	     <table border="1">
	     	<tr>
	     		<td>1</td>
	     		<td>JAVA</td>
	     	</tr>
	     	<tr>
	     		<td>2</td>
	     		<td>JSP</td>
	     	</tr>
	     	<tr>
	     		<td>3</td>
	     		<td>JS</td>
	     	</tr>
	     	<tr>
	     		<td>4</td>
	     		<td>WEB</td>
	     	</tr>
	     	<tr>
	     		<td>5</td>
	     		<td>DB</td>
	     	</tr>
	     	
	     </table>
	     
	
	
	
	
	
	
	
</body>
</html>