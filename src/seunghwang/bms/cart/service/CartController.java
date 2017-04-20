package seunghwang.bms.cart.service;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

import seunghwang.bms.cart.service.CartService;
import seunghwang.bms.cart.service.CartServiceImpl;
public class CartController extends HttpServlet{
	CartService cartService = new CartServiceImpl();
	
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException{
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length());
		 ActionForward forward=null;
	     if(command.equals("/order/addCart.ct")){
			 try {      
				 forward=cartService.addCartAction(request, response);
			 } catch (Exception e) {  
				 e.printStackTrace();
			 }
		 }else if(command.equals("/order/listCart.ct")){
			 try {
				 forward=cartService.listCartAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/order/delCart.ct")){
			 try {  
				 forward=cartService.delCartAction(request, response);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
		 }else if(command.equals("/order/deleteCart.ct")){
			 try {  
				 forward=cartService.deleteCartAction(request, response);
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