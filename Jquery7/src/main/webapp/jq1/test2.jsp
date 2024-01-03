<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	// document.fr.id  (JS)
	// $ ( 요소 선택자 ) $ ( input/#id ) (JQuery)

	$(document).ready(function() {
		alert(' 준비 끝 ! ');
		
		$('*').css('color','red');  // 모든요소 선택자
		$('h2').css('color','blue'); // 태그요소 선택자
		$('.t1').css('color','orange'); // 클래스요소 선택자
		$("#t2").css('color','green'); // 아이디요소 선택자
		
		// 클래스-아이디 속성의 차이점
		// => 중복여부, 클래스명은 여러개 사용가능
		
		$('#id').css('color','orange');
		
		// 속성탐색 선택자
		//$('input').css('color','pink');
		$('input[type=text]').css('color','pink');
		//$('input[type=password]').css('color','blue');
		$('input[type^=p]').css('color','blue');
		
		// 입력된 비밀번호를 저장하는 객체
		var tag = $('input[type=password]').val();
		console.log(tag);
		
		//alert('비밀번호 : '+tag);
		
		//$('tr').css('color','black');
		//$('td').css('color','black');
		$('tr:first td').css('color','black');
		
		// 홀수 행 - red 배경색
		// 짝수 행 - blue 배경색
		$('tr:odd').css('background','red');
		$('tr:even').css('background','blue');
			
		
	});
</script>
</head>
<body>
	<h1>test2.jsp</h1>
	
<!-- 	<form action="" name="fr"> -->
<!-- 		<input type="text" name="id" id="id"> -->
<!-- 	</form> -->
	
	<hr>
	
	<h2 class="t1" id="t2"> 제목 1 </h2>
	<h2 class="t1" id="t2"> 제목 2 </h2>
	
	<hr>
	
	<label>아이디 : </label> <input type="text" name="id" id="id"> <br>
	비밀번호 : <input type="password"  name="pass" id="pass" value="1234"> <br>
	
	<hr>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>성별</td>
		</tr>
		<tr>
			<td>1</td>
			<td>홍학생</td>
			<td>남</td>
		</tr>
		<tr>
			<td>2</td>
			<td>김학생</td>
			<td>여</td>
		</tr>
		<tr>
			<td>3</td>
			<td>이학생</td>
			<td>남</td>
		</tr>
	
	</table>
	
	
	
	
</body>
</html>