package com.itwillbs.ex;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;

public class TestApp {
	public static void main(String[] args) {
		
		// "안녕!, 아이티윌" 메세지 출력
		
		//System.out.println("안녕!, 아이티윌");
		
		//MessageBean.sayHello("아이티윌2");
		
		// "안녕!, 아이티윌" 메세지 출력
		// => MessageBean 객체 생성, 기능sayHello 호출
		// => TestApp 클래스는 MessageBean클래스(객체)를 필요로한다.
		// => TestApp 클래스는 MessageBean클래스(객체)를 의존하고 있다.
		//            [의존관계]
		
		// => 의존관계 구현(직접 구현 - 강한결합)
		MessageBean mb = new MessageBean();
		mb.sayHello("아이티윌");
		
		// 메세지 출력
//		MsgBeanImpl mbi = new MsgBeanImpl(); (강한결합)
		MsgBean mbi = new MsgBeanImpl(); // (약한결합(1) )
		mbi.sayHello("아이티윌");
		
		// 메세지 출력 ( 약한결합(2) - 의존관계 주입 )
		// 의존 객체를 직접생성X -> 생성된 객체(스프링)를 주입(전달)
		
		// 외부파일(xml)에 있는 객체정보를 가져오기 (스프링과 연결) 
		// => 애노테이션을 사용한 처리
		BeanFactory fac 
		 = new XmlBeanFactory(new FileSystemResource("springBeans.xml"));
		
		// 객체 정보를 가져오기(객체 주입-DI)
		//MsgBean mb2 = (MsgBean)fac.getBean("msgBean");
		MsgBean mb2 = fac.getBean("msgBean",MsgBean.class);
		mb2.sayHello(" ITWILL ");
		
		
		
		
		
	}
}

