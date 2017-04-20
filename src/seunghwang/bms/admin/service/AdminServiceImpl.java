package seunghwang.bms.admin.service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.Action.ActionForward;
import seunghwang.bms.admin.dao.AdminDao;
import seunghwang.bms.admin.dao.AdminDaoImpl;
import seunghwang.bms.login.dao.LoginDao;
import seunghwang.bms.login.dao.LoginDaoImpl;
import seunghwang.bms.login.domain.User;

public class AdminServiceImpl implements AdminService{
	LoginDao loginDao;
	AdminDao adminDao;
	ActionForward forward;
	
	public AdminServiceImpl() {	
		loginDao = new LoginDaoImpl();
		adminDao = new AdminDaoImpl();
		forward = new ActionForward(); 
	}
	
	public ActionForward AdminUserAddAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");

		System.out.println("회원가입 호출되었습니다.");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userPhone = request.getParameter("userPhone");
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress1") + " " +  request.getParameter("userAddress2");
		String userEmail = request.getParameter("userEmail");
		String userPost = request.getParameter("userPost");
		int userState = 4;

		User signUpUser = new User(userId, userPw, userName, userPhone, userPost, userAddress, userEmail, userState,
				new Date());
		LoginDao loginDao = new LoginDaoImpl();
		int result = loginDao.signUp(signUpUser);
		if (result == 1) {
			
			request.setAttribute("alertMessage", "회원 추가되었습니다.");
			
		} else {
			request.setAttribute("alertMessage", "회원추가 실패했습니다.");
		}

		
		forward.setPath("/admin/user_manage.jsp");
		
		return forward;

	}

	public ActionForward AdminUserDelAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ActionForward AdminUserSerchAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ActionForward AdminUserModifyAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		
		return null;
	}

	public ActionForward AdminUserListAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		
		forward.setPath("/admin/user_manage.jsp");
		
		return forward;

	}

	
}
	
	


