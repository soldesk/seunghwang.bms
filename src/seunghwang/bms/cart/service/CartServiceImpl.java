package seunghwang.bms.cart.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import seunghwang.bms.admin.domain.Admin;
import seunghwang.bms.book.domain.Book;
import seunghwang.bms.cart.dao.CartDao;
import seunghwang.bms.cart.dao.CartDaoImpl;
import seunghwang.bms.cart.domain.Cart;
import seunghwang.bms.login.domain.User;
import seunghwang.bms.order.domain.Order;

public class CartServiceImpl  implements CartService{
    private CartDao cartDao;
    
    public CartServiceImpl(){
        this.cartDao = new CartDaoImpl();
    }
    HttpSession session;
	User user;
	
    private String UserId(HttpServletRequest request, HttpServletResponse response) throws Exception{
		session= request.getSession();
        String bookId = request.getParameter("bookId");
        if(bookId != null){
	        Book book = cartDao.getBook(bookId);
	        if(book.getBookStock() == 0){
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('책이 품절되었습니다.');");
				out.println("history.back(-1);");
				out.println("</script>");			
				out.close();        	
	        }
        }
		if(session ==null || session.getAttribute("authUser")==null){
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 먼저 해주세요.');");
			out.println("location.href='../main.jsp'");
			out.println("</script>");			
			out.close();
		}else if(session.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ 
    		Admin admin = (Admin)session.getAttribute("authUser");
		    return admin.getAdminId();
		}else if(session.getAttribute("authUser")!=null) {
			User user = (User)session.getAttribute("authUser");
			return user.getUserId();
		}
System.out.println("user.getUserId()=="+user.getUserId());		
		return null;
	}
    
	public ActionForward addCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		request.setCharacterEncoding("UTF-8");		
		ActionForward forward = null;
        Cart cart = new Cart();
        String userId = UserId(request,response);
        String[] bookId= request.getParameterValues("bookId");

 System.out.println("userId=="+userId);  

		for(int i=0; i<bookId.length; i++ ){
			Book book= cartDao.getOrderBook(bookId[i]);
			
            cart.setBookId(book.getBookId());
            cart.setBookName(book.getBookName());
            cart.setBookImage(book.getBookImage());
            cart.setBookPrice(book.getBookPrice());
		    cart.setBookAmount(1);
		    cart.setTotalCost(book.getBookPrice());
		    cart.setUserId(userId);
		    cartDao.addCart(cart);
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('장바구니에 담으셨습니다.');");
		out.println("location.href='./listCart.ct';");
		out.println("</script>");			
		out.close();	
				
		return forward;
	}
	
	public ActionForward listCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward = new ActionForward();
		
		String userId = UserId(request,response);
		Cart cart = new Cart();
		
	       String pageNum = request.getParameter("num");
	        if (pageNum == null || pageNum.equals("")) {
	            pageNum = "1";
	        }
	        int pageSize = 3;
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;
	        int endRow = currentPage * pageSize;
	        int count=0;

	        cart.setUserId(userId);
	        cart.setStartRow(startRow);
	        cart.setEndRow(endRow);
	        
	        count = cartDao.cartCount(userId);
	        List<Cart> carts = cartDao.listCart(cart);
            
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageSize", new Integer(pageSize));
			request.setAttribute("carts", carts);  
			forward.setPath("./orderBasket.jsp");
		
		return forward;
	}
	
	public ActionForward delCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward = null;
		     
	        String num = request.getParameter("num");
	        if (num == null || num.equals("")) {
	        	num = "1";
	        }
		    String cartId = request.getParameter("cartId");
		    cartDao.delCart(cartId);
		     
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에서 삭제하셨습니다.');");
			out.println("location.href='./listCart.ct?num="+num+"';");
			out.println("</script>");			
			out.close();
		return forward;
	}
	
	public ActionForward deleteCartAction
	(HttpServletRequest request, HttpServletResponse response)	
	 throws Exception{
		ActionForward forward = null;
		     
	        String pageNum = request.getParameter("num");
	        int num=0;
	        if (pageNum == null || pageNum.equals("1")) {
	        	pageNum = "1";
	        	num = Integer.parseInt(pageNum);
	        }else{
	        	num = Integer.parseInt(pageNum);
	        	num--;
	        }
		    String[] cartId = request.getParameterValues("cartId");
		    for(int i=0; i<cartId.length; i++){
		         cartDao.delCart(cartId[i]);
		    }
		     
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에서 전체삭제하셨습니다.');");
			out.println("location.href='./listCart.ct?num="+num+"';");
			out.println("</script>");			
			out.close();
		return forward;
	}
}
