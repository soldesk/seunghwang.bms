package seunghwang.bms.order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OrderService {
	public ActionForward getOrder
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception; 
	
	public ActionForward addOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception; 
	
	public ActionForward orderHistory
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception; 
}
