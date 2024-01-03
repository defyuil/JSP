package com.itwillbs.ex;


public class MainClass {
	
	// sum -> 전달인자 3개, 총합 결과를 리턴
	public static int sum(int k,int e,int m) {
		return k+e+m;
	}
	public static int sum(Student s) {
		return s.getKor()+s.getEng()+s.getMath();
	}
	
	
	// avg -> 전달인자 3개, 평균 결과 출력
	public static void avg(int k,int e,int m) {
		System.out.println(" 평균 : "+(k+e+m)/3.0);
	}
	// 총점 사용해서 평균을 계산메서드(오버로딩)
	public static void avg(int sum) {
		System.out.println(" 평균 : "+(sum)/3.0);
	}
	
	public static void main(String[] args) {
		
		// 1. 변수
		String name = "홍길동";
		int kor = 88;
		int eng = 79;
		int math = 98;
		
		// "'이름'의 총점 : 00점, 평균 :00점"
		System.out.println(name+"의 총점 : "+(kor+eng+math)
				               +"점, 평균 : "+((kor+eng+math)/3.0)+"점");
		
		// 2. 메서드
		System.out.print(name+"의 총점 : "+sum(kor,eng,math)+"점, ");
		avg(kor, eng, math);
		
		avg( sum(kor,eng,math) );
		
		// 3. 객체 - 클래스 (학생 점수저장하는) 
		// 학생의 정보를 객체로 생성 -> 총점,평균 계산
		Student kim = new Student();
		
		//kim.kor = 100;
		kim.setKor(100);
		kim.setEng(60);
		kim.setMath(77);
		
		System.out.println("총점(객체) : "+ sum(kim.getKor(), kim.getEng(), kim.getMath()) );
		
		System.out.println("총점(객체) : "+ sum(kim) );
		
		
		// 4. 객체 - 기능분리 (총점,평균)
		
		// 계산기 필요함
		Calculator cal = new Calculator();
		
		System.out.println( cal.sum(kim) );
		
		cal.avg( cal.sum(kim) );
		
		
		Student kim2 = new Student();
		kim2.setKor(100);
		kim2.setEng(60);
		kim2.setMath(77);
		
		cal.sum(kim2);
		
		
//		int a;
//		System.out.println(a);
		
	}

}
