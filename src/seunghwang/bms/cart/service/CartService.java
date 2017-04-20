package seunghwang.bms.cart.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.cart.service.ActionForward;

public interface CartService {
	public ActionForward addCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward listCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward delCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
	
	public ActionForward deleteCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception;
}
