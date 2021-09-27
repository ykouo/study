package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 추상클래스 생성 
	// 강제성을 주기위해 :request와response를 받아야함 
	ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
