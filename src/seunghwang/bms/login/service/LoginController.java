package seunghwang.bms.login.service;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.Action.ActionForward;
public class LoginController extends HttpServlet {
	public LoginController() {}
	
	public LoginService loginService = new LoginServiceImpl();
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{
	
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 System.out.println(command);
		 if(command.equals("/index.login")){
			 forward=new ActionForward();
			 forward.setPath("/index.jsp");
		 }else if(command.equals("/signin.login")){
			 try {
				forward=loginService.loginSignInAction(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }else if(command.equals("/login/LoginWithdrawal.login")) {
			 try {
				 forward=loginService.loginWithdrawlAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/signOut.login")) {
			 try {
				 forward=loginService.loginSignOutAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/LoginFindId.login")) {
			 try {
				 forward=loginService.loginFindIdACtion(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/loginFindPwAction.login")) {
			 try {
				 forward=loginService.loginFindPwAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/loginFindPwChangeAction.login")) {
			 try {
				 forward=loginService.loginFindPwChangeAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/loginSignUpAction.login")) {
			 try {
				 forward=loginService.loginSignUpAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/loginUserModifyAction.do")) {
			 try {
				 forward=loginService.loginUserModifyAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/loginModifyPwAction.login")) {
			 try {
				 forward=loginService.loginModifyPwAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/login/loginMailCheckAction.login")) {
			 try {
				 forward=loginService.loginMailCheckAction(request, response);
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 if(forward != null){
			 if(forward.isRedirect()){
				 response.sendRedirect(forward.getPath());
		 }else{
			 RequestDispatcher dispatcher=
				 request.getRequestDispatcher(forward.getPath());
			 dispatcher.forward(request, response);
		 }	 
		 }
	}
}