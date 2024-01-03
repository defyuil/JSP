<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 라이브러리 추가(CDN : Content Delivery Network) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//  append() 뒤에 추가 / prepend() 앞에 추가

		$('body').append(" 안녕하세요! ");
		$('body').append("<h2> 안녕하세요! </h2>");
		$('body').prepend(" <h2> 아이티윌 부산 </h2>");
		
		// div 태그에 작성된 내용 변경  (내용 -> 내용-0)
// 		$('div').html(function(idx,data){
// 			return data+" - "+idx;
// 		});
		$('div').append(function(idx,old){
			return " - "+idx;
		});
		
		var tableData = [
			{no : 1,name:"김학생",gender:"남"},
			{no : 2,name:"이학생",gender:"여"},
			{no : 3,name:"박학생",gender:"여"},
			{no : 4,name:"최학생",gender:"남"},
			{no : 5,name:"정학생",gender:"남"}			
		] ;
		
		
//		$('tr').append("<tr><td>"+tableData[0].no+"</td><td>"+tableData[0].name+"</td><td>"+tableData[0].gender+"</td></tr>");
		
		for(var i=0;i<tableData.length;i++){
			$('table').append("<tr><td>"+tableData[i].no+"</td><td>"+tableData[i].name+"</td><td>"+tableData[i].gender+"</td></tr>");
		}
		
		// $.each() : 선택한 요소를 순차적으로 접근할때 사용하는 메서드
		// $.each(순차적으로 접근할 대상(객체/배열),콜백함수);
		$.each(tableData,function(idx,item){
			//alert(idx +'/'+item);
			//console.log(item);
			$('table').append("<tr><td>"+item.no+"</td><td>"+item.name+"</td><td>"+item.gender+"</td></tr>");
		});
		
// 		$(tableData).each(function(){
// 		});

		// 이미지 파일의 사이즈가 다른경우 동일하게 통일
		// $('img').css('width',200);
		
		setInterval(function(){
			//console.log("A");
			$('#imgDiv').append( $('img').first() );
		},100);
		
	});
</script>
</head>
<body>
	<h1>test6.jsp</h1>
	
	<div> 내용 </div>
	<div> 내용 </div>
	<div> 내용 </div>
	
	
	<hr><hr>
	
	<table border="1">
	  <tr>
	     <td>no</td>
	     <td>name</td>
	     <td>gender</td>
	  </tr>
	
	</table>
	
	<hr><hr>
	<div id="imgDiv">
		<img src="1.jpg">
		<img src="2.jpg">
		<img src="3.jpg">
	</div>
	
	
	
	
	
	
	
</body>
</html>