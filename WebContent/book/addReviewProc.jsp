<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.book.domain.Detail" %>
<%@ page import="seunghwang.bms.book.domain.Book" %>
<%@ page import="seunghwang.bms.book.domain.Category" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper" %>
<%@ page import="seunghwang.bms.book.dao.BookDao" %>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.BookService" %>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl" %>

<%@ page import="seunghwang.bms.review.dao.mapper.ReviewMapper" %>
<%@ page import="seunghwang.bms.review.domain.Review" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDao" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDaoImpl" %>
<%@ page import="seunghwang.bms.review.service.ReviewService" %>
<%@ page import="seunghwang.bms.review.service.ReviewServiceImpl" %>

<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>

<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<% 
	request.setCharacterEncoding("utf-8");
	String bookId = request.getParameter("bookId");	
	HttpSession sess = request.getSession(false);
	if (sess == null || sess.getAttribute("authUser") == null){ %><!--로그인 안됐을 시 -->
		<script>
			alert("로그인해주세요");
			location.href="../main.jsp";
		</script>	

<% }else if(sess.getAttribute("authUser")!=null) {
			
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);

	ReviewMapper reviewMapper = Configuration.getMapper(ReviewMapper.class);
	ReviewDao reviewDao = new ReviewDaoImpl(reviewMapper);
	ReviewService reviewService = new ReviewServiceImpl(reviewDao);
	
	User user = (User)sess.getAttribute("authUser");
		
	String bookName = request.getParameter("bookName");
	String userId = user.getUserId();
	String reviewTitle = request.getParameter("reviewTitle");
	String reviewContent = request.getParameter("reviewContent");
	String reviewId = "RN7";
	double reviewGrade = Integer.parseInt(request.getParameter("reviewGrade"));
	
	if(reviewTitle == null || reviewTitle.equals("") && 
			reviewContent == null || reviewContent.equals("")){
		%>
		<script>
			alert("리뷰 제목과 내용을 입력해주세요");
			location.href="../main.jsp";
		</script>	
	
<%}else{
		
	
	Review review = new Review(bookName, reviewTitle, 
			reviewContent, reviewGrade, new Date(04/04/2017), bookId, userId);
	
	reviewService.insertReview(review);
	
	response.sendRedirect("bookDetail.jsp?bookId="+bookId);	
}
}
%>