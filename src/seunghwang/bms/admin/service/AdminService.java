package seunghwang.bms.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.Action.ActionForward;

public interface AdminService {
	public ActionForward AdminUserAddAction(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ActionForward AdminUserDelAction(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ActionForward AdminUserSerchAction(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ActionForward AdminUserModifyAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward AdminUserListAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ActionForward AdminUserDetailAction(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
