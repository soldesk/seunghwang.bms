package seunghwang.bms.admin.service;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.cart.service.ActionForward;

public class AdminOrderController extends HttpServlet{
	AdminOrderService adminOrderService = new AdminOrderServiceImpl();
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 if(command.equals("/admin/listOrder.ag")){
			 try {     
				 forward = adminOrderService.listOrderAction(request, response);
			 } catch (Exception e) {  
				 e.printStackTrace();  
			 }
		 }else if(command.equals("/admin/getOrder.ag")){
			 try {
				 forward = adminOrderService.getOrderAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/admin/delOrder.ag")){
			 try {
				 forward=adminOrderService.delOrderAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/admin/updateOrder.ag")){
			 try {
				 forward=adminOrderService.updateOrderAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/admin/deleteOrder.ag")){
			 try {
				 forward=adminOrderService.deleteOrderAction(request, response);
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