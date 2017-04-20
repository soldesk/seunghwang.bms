package seunghwang.bms.admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.cart.service.ActionForward;

public interface AdminOrderService {
	public ActionForward listOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward getOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward delOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward updateOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward deleteOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
}  
