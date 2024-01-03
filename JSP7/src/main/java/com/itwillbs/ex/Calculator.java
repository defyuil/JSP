package com.itwillbs.ex;

/**
 * 학생의 정보를 전달받아서 총점, 평균을 계산하는 계산기
 */
public class Calculator {

	// 계산하는 기능만 필요 => 메서드
	// sum -> 전달인자 3개, 총합 결과를 리턴
	public int sum(int k, int e, int m) {
		return k + e + m;
	}

	public int sum(Student s) {
		return s.getKor() + s.getEng() + s.getMath();
	}

	// avg -> 전달인자 3개, 평균 결과 출력
	public void avg(int k, int e, int m) {
		System.out.println(" 평균 : " + (k + e + m) / 3.0);
	}

	// 총점 사용해서 평균을 계산메서드(오버로딩)
	public void avg(int sum) {
		System.out.println(" 평균 : " + (sum) / 3.0);
	}

}
