package seunghwang.bms.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import seunghwang.bms.admin.dao.AdminOrderDao;
import seunghwang.bms.admin.dao.AdminOrderDaoImpl;
import seunghwang.bms.admin.domain.AdminOrder;
import seunghwang.bms.cart.service.ActionForward;

public class AdminOrderServiceImpl implements AdminOrderService{

    private AdminOrderDao adminOrderDao;
    
    public AdminOrderServiceImpl(){
        this.adminOrderDao = new AdminOrderDaoImpl();
    }
      
	public ActionForward listOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward= new ActionForward();
		
			AdminOrder order = new AdminOrder();
		
	       String pageNum = request.getParameter("num");
	        if (pageNum == null || pageNum.equals("")) {
	            pageNum = "1";
	        }
	        int pageSize = 10;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count=0;
	        
	        order.setSearchTitle(request.getParameter("searchTitle"));
	        order.setSearchContent(request.getParameter("searchContent"));	        
	        order.setStartRow(startRow);
	        order.setEndRow(endRow);
	        
	        count = adminOrderDao.adminOrderCount(order);
	        List<AdminOrder> adminorder = adminOrderDao.listAdminOrder(order);

	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageSize", new Integer(pageSize));
	        request.setAttribute("adminorder", adminorder);;
		forward.setPath("./orderManage.jsp");  
		return forward;   
	}
	
	public ActionForward getOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward= new ActionForward();
		String orderId = request.getParameter("orderId");
		
		List<AdminOrder> adminorder = adminOrderDao.getAdminOrder2(orderId);
		AdminOrder order = adminOrderDao.getAdminOrder1(orderId);
		
		request.setAttribute("order", order);
		request.setAttribute("adminorder", adminorder);		
		forward.setPath("./orderManageModify.jsp");
		return forward;
	}
	
	public ActionForward delOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward= new ActionForward();
		AdminOrder order = new AdminOrder();
		String orderId = request.getParameter("orderId");
		String bookId = request.getParameter("bookId");
		
		order.setOrderId(orderId);
		order.setBookId(bookId);
		
        adminOrderDao.delOrder(order);
		
		forward.setPath("./getOrder.ag");
		return forward;
	}
	
	public ActionForward updateOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward= new ActionForward();
		AdminOrder order = new AdminOrder();
		request.setCharacterEncoding("UTF-8");
		String orderId = request.getParameter("orderId");
		String orderAddress = request.getParameter("orderAddress");
		String orderName = request.getParameter("orderName");

		String[] bookId = request.getParameterValues("bookId");
		String[] bookName = request.getParameterValues("bookName");
		String[] bookAmount = request.getParameterValues("bookAmount");
		String[] bookPrice = request.getParameterValues("bookPrice");
		String paymentChoice = request.getParameter("paymentChoice");
		
		for(int i=0; i<bookId.length; i++){
	    	order.setOrderId(orderId);
	    	order.setBookId(bookId[i]);
	    	order.setBookName(bookName[i]);
	    	order.setBookAmount(Integer.parseInt(bookAmount[i]));
	    	order.setBookPrice(Integer.parseInt(bookPrice[i]));
	    	order.setOrderStatus(request.getParameter("orderStatus"+i));
	  
	    	adminOrderDao.updateOrder2(order);
	    }
	    
		order.setOrderId(orderId);
		order.setOrderAddress(orderAddress);
		order.setOrderName(orderName);
		order.setPaymentChoice(paymentChoice);
		
        adminOrderDao.updateOrder1(order);
		
		forward.setPath("./getOrder.ag");
		return forward;
	}
	
	public ActionForward deleteOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward= new ActionForward();
		String orderId = request.getParameter("orderId");

		adminOrderDao.deleteOrder(orderId);
		
		forward.setPath("./listOrder.ag");
		return forward;
	}
}
