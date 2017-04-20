package seunghwang.bms.order.service;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class OrderController extends HttpServlet{
	OrderService orderService = new OrderServiceImpl();
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
		 if(command.equals("/order/orderPayment.do")){  
			 forward=new ActionForward();
			 forward.setPath("./orderPayment.jsp");
		 }else if(command.equals("/order/getOrder.do")){
			 try {   
				 forward=orderService.getOrder(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/order/addOrder.do")){
			 try {
				 forward=orderService.addOrderAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/order/orderHistory.do")){
			 try {
				 forward=orderService.orderHistory(request, response);
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