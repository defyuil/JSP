package com.itwillbs.ex;


/**
 *  학생의 점수 kor,eng,math 정보 저장하는 객체 
 */
public class Student {
	
	private int kor;
	private int eng;
	private int math;
	
	// public Student() {	}
	// => 기본생성자 포함
	// => 컴파일러가 기본생성자를 자동으로 생성
	//    ( 오버로딩된 생성자가 있을경우 제외)
	// public Student(int k,int e,int m) {	}
	
	// alt shift s + r
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	
	
	
}
