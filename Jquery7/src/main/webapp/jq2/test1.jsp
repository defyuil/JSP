<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
 <script type="text/javascript">
    $(document).ready(function(){
    	
    	$('input').click(function(){
    		alert(' 클릭! (Jquery) ');
    	});
    	
    	//h2 태그 클릭 했을때
    	$('h2').click(function(){
    		 //alert('h2 클릭!');
    		 $(this).append("+");
    	});

    	// 이미지 변경하기
//     	$('img').mouseover(function(){
//     		$(this).attr('src','../jq1/2.jpg');
//     	});
    	
//     	$('img').mouseout(function(){
//     		$(this).attr('src','../jq1/1.jpg');
//     	});

		// 체이닝 기법 : [.연산자]를 사용하여 한번에 다양한 이벤트 처리
    	$('img').mouseover(function(){
    		$(this).attr('src','../jq1/2.jpg');
    	}).mouseout(function(){
    		$(this).attr('src','../jq1/1.jpg');
       	});
       	
       	
       	// 키보드 이벤트
       	$('textarea').keyup(function(){
       		// alert('키보드 입력!');
       		// 입력된 글자수 체크
       		var txtLength = $('textarea').val().length;
       		// alert(txtLength);
       		// 200-입력된 글자수 계산 => 화면 출력(h3내용을 변경)
       		var result = 200 - txtLength;
       		$('h3').html(result);
       		
       		if(result < 0){
       			$('h3').css('color','red');
       		}else{
       			$('h3').css('color','black');
       		}
       	});
       	


    	
    }); 
 </script>

</head>
<body>
	<h1>/jq2/test1.jsp</h1>
	
	<input type="button" value="버튼" onclick=" alert('클릭!'); ">
	<hr>
	
	<h2> head-0 </h2>
	<h2> head-1 </h2>
	<h2> head-2 </h2>
	
	<hr>
	<h2> 이미지에 마우스를 올렸을때, 이미지 변경
	     이미지에 마우스를 내였을때 원래 이미지로 변경</h2>
	<img src="../jq1/1.jpg">
	
	<hr>
	<h2> 키보드 이벤트 </h2>
	
	<h2> 자소서 200자 작성! (200자가 넘으면 카운트숫자를 빨강으로 변경,기본은 검정) </h2>
	<h3>200</h3>
	<textarea rows="5" cols="25"></textarea>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>