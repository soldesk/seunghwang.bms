package seunghwang.bms.login.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import seunghwang.bms.Action.ActionForward;
import seunghwang.bms.admin.dao.AdminDao;
import seunghwang.bms.admin.dao.AdminDaoImpl;
import seunghwang.bms.admin.domain.Admin;
import seunghwang.bms.login.dao.LoginDao;
import seunghwang.bms.login.dao.LoginDaoImpl;
import seunghwang.bms.login.domain.User;
import seunghwang.bms.util.SendMail;

public class LoginServiceImpl implements LoginService {
	LoginDao loginDao;
	AdminDao adminDao;
	ActionForward forward;
	
	public LoginServiceImpl() {	
		loginDao = new LoginDaoImpl();
		adminDao = new AdminDaoImpl();
		forward = new ActionForward(); 
	}
	
	public ActionForward loginSignInAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		forward.setPath("index.jsp");
		
		User user = loginDao.getUser(id);
		if (user == null) {
			Admin admin = adminDao.getAdmin(id);
			if (admin != null &&admin.pw(pw)) {
				request.getSession().setAttribute("authUser", admin);
				return forward;
			} else {
				request.setAttribute("alertMessage", "아이디가 맞지 않습니다.");
				return forward;
			}
		} else if (!user.pw(pw)) {
			System.out.println("비밀번호 오류");
			request.setAttribute("alertMessage", "아이디와 비밀번호를 확인해주세요");
			return forward;
		} else if(user.getUserState()<-1) {
			System.out.println("탈퇴한 회원입니다.");
			request.setAttribute("alertMessage", "탈퇴한 회원입니다.");
			return forward;
		}else if (user.getUserState()<2) {
			System.out.println("인증 안된 회원입니ㅏㄷ.");
			request.setAttribute("alertMessage", "이메일 인증이 되지 않았습니다.");
			return forward;
		}
		else {
			request.getSession().setAttribute("authUser", user);
			System.out.println("로그인 됌");
			return forward;
		}
		
	}

	public ActionForward loginSignOutAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(true);
		session.invalidate();
		System.out.println("세션 폐지 됨");

		forward.setPath("index.jsp");
		return forward;
	}

	public ActionForward loginSignUpAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			forward.setPath("/index.jsp");
			signUp(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("alertMessage", "회원가입이 실패했습니다. 고객센터로 연락주세요");
		}
		
		return forward;
	}

	public ActionForward findSameIdAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ActionForward loginFindPwChangeAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		forward.setPath("/index.jsp");
		LoginDao loginDao = new LoginDaoImpl();
		
		System.out.println("비밀번호 변경 실행");
		System.out.println(request.getParameter("yourId"));
	
    		String userId = request.getParameter("yourId");
        	User user = loginDao.getUser(userId);
    		user.setUserPw(request.getParameter("userPw"));
    		int result = loginDao.pwModify(user);
    		if (result == 1) {
    			request.setAttribute("alertMessage","성공 했습니다.");
    		}else {
    			request.setAttribute("alertMessage","실패했습니다.");
    		}
    		return forward;

	}

	public ActionForward loginFindIdACtion(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("아이디 찾기 실행");
		String userEmail;
		
			userEmail = request.getParameter("input_email");
			String id = loginDao.getFindId(userEmail);
			forward.setPath("/index.jsp");
			int result = SendMail.sendFindId(userEmail, id);
			switch (result) {
			case 1:
				request.setAttribute("alertMessage", "메일이 전송되었습니다..");
				break;
			case 2:
				request.setAttribute("alertMessage", "메일 전송 실패");
				break;
			}
			return forward;
	}

	public ActionForward loginFindPwAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("비밀번호수정 도착했습니다.");
    	forward.setPath("/index.jsp");
		LoginDao loginDao = new LoginDaoImpl();
    	String userId= request.getParameter("userId");
    	System.out.println(userId);
    	String userEmail = request.getParameter("userEmail");
    	System.out.println(userEmail);
    	User user = loginDao.getUser(userId);
    	
    	String pwURL =  "http://localhost/seunghwang.bms/login/login_findchange_pw.jsp?yourId="+ userId;
    	if(user==null || !user.getUserEmail().equals(userEmail)) {
    		System.out.println("입력 값을 확인 해주세요");
    		request.setAttribute("alertMessage","입력값을 확인해보세요");
    	}else {
    		int result = SendMail.sendFindPw(userEmail,pwURL);
    		switch(result) {
    			case 1: request.setAttribute("alertMessage","보내졌습니다."); break;
    			case 2: request.setAttribute("alertMessage","저장된 메일이 유요하지않습니다."); break;
    		}
    	}
    	return forward;
    	
    }
     

	public ActionForward loginModifyPwAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		forward.setPath("/index.jsp");
		LoginDao loginDao = new LoginDaoImpl();
		System.out.println("비밀번호 변경 실행");
		HttpSession session = request.getSession(false);
		User user = null;
		
		if (session == null || session.getAttribute("authUser") == null) {
			request.setAttribute("alertMessage","로그인 해주세요");
			return forward;
		} else {
			user = (User) session.getAttribute("authUser");
		}
		
		user.setUserPw(request.getParameter("userPw"));
		int result = loginDao.pwModify(user);
		if (result == 1) {
			request.setAttribute("alertMessage","성공 했습니다.");
		}
		return forward;
	}

	public ActionForward loginUserModifyAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		forward.setPath("/index.jsp");
    	System.out.println("수정합니다.");
    	String address = request.getParameter("userAddress1") + " " +request.getParameter("userAddress2");
    	    	
    	HttpSession session = request.getSession(false);
    	User user = null;
    	if (session == null || session.getAttribute("authUser") == null) {
    		request.setAttribute("alertMessage", "로그인 되어있지 않습니다.");
    		return forward;
    	} else {
    		 user = (User)session.getAttribute("authUser");
    	}
    	
    	user.setUserEmail(request.getParameter("userEmail"));
    	user.setUserPost(request.getParameter("userPost"));
    	user.setUserAddress(address);
    	int result = loginDao.modify(user);
    	if(result==1) {
    		request.setAttribute("alertMessage", "수정 성공했습니다..");
    	}else {
    		request.setAttribute("alertMessage", "수정 실패했습니다.");
    	}
    	
		return forward;

    }
		
	

	public ActionForward loginWithdrawlAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		forward.setPath("/signOut.login");
		
    	System.out.println("탈퇴돡");
    	HttpSession session = request.getSession(false); 
    	User user = (User) session.getAttribute("authUser");
    	System.out.println(user.toString());
    	if(!user.getUserPw().equals(request.getParameter("userPw"))) {
    		request.setAttribute("alertMessage", "비밀번호가 틀립니다");
        	return forward;
    	}
    	
    	user.setUserState(-2);
    	int result = loginDao.userStateChange(user);
    	
    	if(result==1) {
    		request.setAttribute("alertMessage", "성공 했습니다.");
    	}else {
    		request.setAttribute("alertMessage", "실패했습니다.");
    	}
    	
    	return forward;

		
	}

	public ActionForward loginMailCheckAction(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		forward.setPath("/index.jsp");
		User user = loginDao.getUser(request.getParameter("Id"));
		user.setUserState(4);
		int result = loginDao.userStateChange(user);
		if(result==1) request.setAttribute("alertMessage", "이메일 인증 되었습니다.");
		else if(result!=1) request.setAttribute("alertMessage", "이메일 인증 실패하였습니다.");
		return forward;
	}

	
	
	
	
	public void signUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		request.setCharacterEncoding("UTF-8");

		System.out.println("회원가입 호추되었습니ㅏㄷ.");
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userPhone = request.getParameter("userPhone");
		String userName = request.getParameter("userName");
		String userAddress = request.getParameter("userAddress1") + " " +  request.getParameter("userAddress2");
		String userEmail = request.getParameter("userEmail");
		String userPost = request.getParameter("userPost");
		int userState = 1;

		User signUpUser = new User(userId, userPw, userName, userPhone, userPost, userAddress, userEmail, userState,
				new Date());
		LoginDao loginDao = new LoginDaoImpl();
		int result = loginDao.signUp(signUpUser);
		if (result == 1) {
			SendMail.sendMailCheck(userEmail,"http://localhost:8081/seunghwang.bms/login/loginMailCheckAction.login?Id="+ userId );
			request.setAttribute("alertMessage", "회원가입 되었습니다. 메일을 인증을 해주세요");
		} else {
			request.setAttribute("alertMessage", "회원가입이 실패했습니다.");
		}

	}
}
