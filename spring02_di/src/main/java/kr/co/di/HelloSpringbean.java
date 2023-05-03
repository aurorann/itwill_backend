package kr.co.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import ch.qos.logback.core.Context;

public class HelloSpringbean {

	public static void main(String[] args) {
		// 스프링 빈
		
		ApplicationContext context = new ClassPathXmlApplicationContext("springbean.xml");
		
		IHello hello=null;
		hello=(IHello) context.getBean("msgEN");//스프링 빈 객체생성
		hello.sayHello("TOM");
		

	}//main end

}//class end
