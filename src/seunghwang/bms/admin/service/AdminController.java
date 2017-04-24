package seunghwang.bms.admin.service;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.Action.ActionForward;
public class AdminController extends HttpServlet {
	public AdminController() {}

	AdminService adminService = new AdminServiceImpl();

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		System.out.println(command);
		if(command.equals("/admin/adminUserAdddAction.admin")){
			try {
				forward=adminService.AdminUserAddAction(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/admin/AdminUserListAction.admin")){
			try {			System.out.println("asdasdad");	
				forward=adminService.AdminUserListAction(request, response);
			} catch (Exception e) {
				e.printStackTrace();	
			}
		}else if(command.equals("/admin/AdminUserDetailAction.admin")){
			try {			
			forward=adminService.AdminUserDetailAction(request, response);
		} catch (Exception e) {
			e.printStackTrace();	
			}
		}else if(command.equals("/admin/AdminUserDelAction.admin")){
			try {		
			forward=adminService.AdminUserDelAction(request, response);
		} catch (Exception e) {
			e.printStackTrace();	
			}
		}else if(command.equals("/admin/AdminUserModifyAction.admin")){
			try {		
			forward=adminService.AdminUserModifyAction(request, response);
		} catch (Exception e) {
			e.printStackTrace();	
			}
		}else if(command.equals("/AdminUserSerchAction.admin")){
			try {		
			forward=adminService.AdminUserSerchAction(request, response);
		} catch (Exception e) {
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

