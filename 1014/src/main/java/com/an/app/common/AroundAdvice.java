package com.an.app.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;
// @Aspect : pointcut과 advice의 결합  / 위빙처리 대상
// @Service :  수행의 대상이 되는 것 이라는 걸 알려주기 위해 붙임 

@Service
@Aspect
public class AroundAdvice {
	@Around("PointcutCommon.allPointcut()")
	public Object printLog(ProceedingJoinPoint pjp) throws Throwable {
		StopWatch sw = new StopWatch();
		System.out.println("메서드명 : "+pjp.getSignature().getName());
		sw.start();
		Object obj = pjp.proceed();
		sw.stop();
		
		System.out.println("실행소요시간 : "+sw.getTotalTimeMillis());
		return obj;
	}
}
