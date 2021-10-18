package com.an.app.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {
	
	@Before("PointcutCommon.getPointcut()")
	public void printLog() {
		System.out.println("����������� ���۵˴ϴ�.");
	}
}
