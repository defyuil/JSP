<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//$('h2').css('color','red');
		var c = $('h2').css('color');
		
		alert(" 결과 : "+c); // rgn(0,0,0)-검정색
		
		// 글자색 파랑으로 변경
		// => 요소에 속성 하나를 적용
		$('h2').css('color','blue');
		
		c = $('h2').css('color');
		
		alert(" 결과 : "+c); // rgn(0,0,255)-파랑색
		
		//$('h2').css('color','blue','red'); (x)
		
		// h2태그의 글자색 빨,주,노 순서대로 설정
		
// 		$('h2').css('color','yellow');
// 		$('h2:odd').css('color','orange');
// 		$('h2:first').css('color','red');
		var colorArr = [ 'red','orange','yellow' ];
		
		// 각 요소별 각각에 다른 속성을 적용 
// 		$('h2').css('color',function(index,value){
// 			  //alert(index+"/"+value);
// 			  // 0 1 2  / rgb(0,0,255)
// 			 // return "red";
// 			  return colorArr[index];
// 		});
// 		$('h2').css('color',function(idx){
// 			  alert(idx);
// 			  // 0 1 2  / rgb(0,0,255)
// 			  return colorArr[idx];
// 		});		
		
		//$('h2').css('background','black');
		//$('h2').css('background','rgb(0,0,0)');
		//$('h2').css('background','#4287f5');
		
		// 하나의 요소에 여러개의 속성을 적용
		//  글자색,배경색 변경
		$('h2').css({
			color : function(idx,value){
				return colorArr[idx];
			},
			background :'black'
		});

		
	});
</script>

</head>
<body>
	<h1>test3.jsp</h1>
	
	<h2> head-0 </h2>
	<h2> head-1 </h2>
	<h2> head-2 </h2>
	<h2> head-3 </h2>

</body>
</html>