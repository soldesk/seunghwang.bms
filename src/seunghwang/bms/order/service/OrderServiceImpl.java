package seunghwang.bms.order.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import seunghwang.bms.book.domain.Book;
import seunghwang.bms.login.domain.User;
import seunghwang.bms.order.dao.OrderDao;
import seunghwang.bms.order.dao.OrderDaoImpl;
import seunghwang.bms.order.domain.Order;

public class OrderServiceImpl implements OrderService{

    private OrderDao orderDao;
    HttpSession session;
	User user;
    public OrderServiceImpl(){
        this.orderDao = new OrderDaoImpl();
    }
    
	public ActionForward getOrder
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward=new ActionForward();
	
		String userId = UserId(request);
		String[] bookId= request.getParameterValues("bookId");
		
		User user = orderDao.getOrder(userId);  
		Book Book = new Book();
		for(int i=0; i<bookId.length; i++ ){
		  Book = orderDao.getOrderBook(bookId[i]);       
		  request.setAttribute("books["+i+"]", Book);
		  request.setAttribute("book_len", bookId.length);
		}
		
		request.setAttribute("user", user); 
		forward.setPath("./orderBook.jsp");
		return forward;
	}
	
	public ActionForward addOrderAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		request.setCharacterEncoding("UTF-8");		
		ActionForward forward = null;
        Order order = new Order();
        session = request.getSession();          
		int book_length = (int)session.getAttribute("book_length");
		
		boolean insertCheck= true;
		for(int i=0; i<book_length; i++ ){
			
			Book book = (Book)session.getAttribute("book_send["+i+"]");
			order.setBookId(book.getBookId());
			order.setBookName(book.getBookName());
            order.setBookPrice(book.getBookPrice());
            order.setBookImage(book.getBookImage());
            order.setBookAmount(1);
            order.setPaymentChoice(request.getParameter("paymentChoice"));
            order.setPaymentCost(book.getBookPrice());
            order.setOrderAddress(request.getParameter("subject_address"));
            order.setOrderName(request.getParameter("subject_name"));
            order.setOrderPhone(request.getParameter("subject_phone"));
            order.setOrderMemo(request.getParameter("subject_memo"));  
		    order.setOrderStatus("결제완료");
		    order.setUserId(request.getParameter("userId"));
		    
		    if(insertCheck){ //같은 아이디가 여러개 주문시 주문번호를 공유한다.
	    		orderDao.addOrder(order);
	    		insertCheck = false;		    		
		    }else{
		    	orderDao.addOrder2(order);
		    }
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('결제를 완료하셨습니다.');");
		out.println("location.href='../main.jsp';");
		out.println("</script>");			
		out.close();	
		
		return forward;
	}
	
	public ActionForward orderHistory
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward=new ActionForward();
		String userId = UserId(request);
        Order order = new Order();		
		
        String pageNum = request.getParameter("num");
        if (pageNum == null || pageNum.equals("")) {
            pageNum = "1";
        }
        int pageSize = 10;
        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * pageSize + 1;
        int endRow = currentPage * pageSize;
        int count=0;
                
        order.setUserId(userId);
        order.setStartRow(startRow);
        order.setEndRow(endRow);
        
        count = orderDao.orderCount(userId);
        List<Order> orders = orderDao.orderList(order);
           
        request.setAttribute("currentPage", new Integer(currentPage));
        request.setAttribute("startRow", new Integer(startRow));
        request.setAttribute("endRow", new Integer(endRow));
        request.setAttribute("count", new Integer(count));
        request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("orders", orders);  
		forward.setPath("./orderHistory.jsp");
		return forward;
	}
	private String UserId(HttpServletRequest request){
		session= request.getSession();
		user = (User)session.getAttribute("authUser"); 
		return user.getUserId();
	}
}  
