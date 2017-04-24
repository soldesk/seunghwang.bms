package seunghwang.bms.login.service;

import seunghwang.bms.Action.ActionForward;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface LoginService {
	public ActionForward loginSignInAction(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ActionForward loginSignOutAction(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ActionForward loginSignUpAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward findSameIdAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginFindPwChangeAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginFindIdACtion(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginFindPwAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginModifyPwAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginUserModifyAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginWithdrawlAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward loginMailCheckAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
