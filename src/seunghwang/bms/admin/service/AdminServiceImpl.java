package seunghwang.bms.admin.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.Action.ActionForward;
import seunghwang.bms.admin.dao.AdminDao;
import seunghwang.bms.admin.dao.AdminDaoImpl;
import seunghwang.bms.admin.domain.Page;
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

		
		forward.setPath("/admin/AdminUserListAction.admin");
		
		return forward;

	}

	public ActionForward AdminUserDelAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("삭제 들어옴 파라미터 값" +request.getParameter("userId"));
		
		loginDao.delUser(request.getParameter("userId"));
		
		System.out.println("삭제 됨");
		forward.setPath("/admin/AdminUserListAction.admin");
		return forward;
	}

	public ActionForward AdminUserSerchAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		 String serchType =request.getParameter("serchType");
		 String serchValue =request.getParameter("serchValue");
		 System.out.println(serchType);
		 System.out.println(serchValue);

		 Page myPage =null;
		 if(request.getParameter("currentPage") != null) {
				String currentPage = request.getParameter("currentPage");
				myPage = new Page(Integer.parseInt(currentPage));
	        }
		 else myPage = new Page();
		  
		 if(serchType!=null&&!serchType.equals("")) {	
			 if(serchType.equals("이름")) {
				 myPage.setSerchType("name");	 
			 }else if(serchType.equals("아이디")) {
				 myPage.setSerchType("id");
			 }else if(serchType.equals("전화번호")) {
				 myPage.setSerchType("phone");
			 }else if(serchType.equals("우편번호")) {
				 myPage.setSerchType("post");
			 }
			 myPage.setSerchValue(serchValue);
		 }
		 PageService pageService = new PageService(5, myPage);
		    
		 request.setAttribute("pageMaker", pageService);
		
			 
		 request.setAttribute("users", loginDao.getUsers(myPage));
		    	    
		 forward.setPath("/admin/user_manage.jsp");
		 return forward;

	}

	public ActionForward AdminUserModifyAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("userId"));
		User user = loginDao.getUser(request.getParameter("userId"));
		System.out.println(request.getParameter("userName"));
		System.out.println(user);
		if(request.getParameter("userName")!=null&& !request.getParameter("userName").equals("")) user.setUserName(request.getParameter("userName"));
		if(request.getParameter("userPw")!=null&& !request.getParameter("userPw").equals("")) user.setUserPw(request.getParameter("userPw"));
		if(request.getParameter("userAddress")!=null&& !request.getParameter("userAddress").equals("")) user.setUserAddress(request.getParameter("userAddress"));
		if(request.getParameter("userPost")!=null&& !request.getParameter("userPost").equals("")) user.setUserPost(request.getParameter("userPost"));
		if(request.getParameter("userPhone")!=null&& !request.getParameter("userPhone").equals("")) user.setUserPhone(request.getParameter("userPhone"));
		String userState = request.getParameter("userState");
		if(userState.equals("메일인증"))user.setUserState(4);
		else if(userState.equals("메일인증미완"))user.setUserState(1);
		System.out.println(user);	
		loginDao.modify(user);
		forward.setPath("/admin/AdminUserListAction.admin");
		return forward;
	}

	public ActionForward AdminUserListAction(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Page myPage =null;
	    System.out.println("도착");

/*		String currentPage = request.getParameter("currentPage");
*/	    if(request.getParameter("currentPage") != null) {
			String currentPage = request.getParameter("currentPage");
			myPage = new Page(Integer.parseInt(currentPage));
        }
	    else myPage = new Page();
	    PageService pageService = new PageService(5, myPage);
	    
	    request.setAttribute("pageMaker", pageService);
	
	    request.setAttribute("users", loginDao.getUsers(myPage));
	    
		forward.setPath("/admin/user_manage.jsp");
		return forward;

	}

	@Override
	public ActionForward AdminUserDetailAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(request.getParameter("userId"));
		
		User user = loginDao.getUser(request.getParameter("userId"));
		System.out.println(user);
		request.setAttribute("User", user);
		forward.setPath("/admin/user_manage_modify.jsp");
		return forward;
	}



	
}
	
	


