package com.an.app.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* model..*Impl.get*(..))")
	public void getPointcut(){}
	@Pointcut("execution(* model..*Impl.*(..))")
	public void allPointcut(){}
	
	/*	public void AfterRPointcut(){}
	public void AfterTPointcut(){}
	public void AroundPointcut(){}*/

	
}
