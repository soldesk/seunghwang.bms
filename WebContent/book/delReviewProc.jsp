<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.config.Configuration" %>
<%@ page import="seunghwang.bms.review.dao.mapper.ReviewMapper" %>
<%@ page import="seunghwang.bms.review.domain.Review" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDao" %>
<%@ page import="seunghwang.bms.review.dao.ReviewDaoImpl" %>
<%@ page import="seunghwang.bms.review.service.ReviewService" %>
<%@ page import="seunghwang.bms.review.service.ReviewServiceImpl" %>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%	
	request.setCharacterEncoding("utf-8");

	HttpSession sess = request.getSession(false);
	if (sess == null || sess.getAttribute("authUser") == null){ %><!--로그인 안됐을 시 -->
	<script>
		alert("로그인해주세요");
		location.href="../main.jsp";
	</script>	
<%}else{ 
 	
	ReviewMapper reviewMapper = Configuration.getMapper(ReviewMapper.class);
	ReviewDao reviewDao = new ReviewDaoImpl(reviewMapper);
	ReviewService reviewService = new ReviewServiceImpl(reviewDao);
	User user = (User)sess.getAttribute("authUser");
	
	String userId = user.getUserId();
	String reviewId = request.getParameter("reviewId");
	String bookId = request.getParameter("bookId");
	String ReUserId = request.getParameter("userId");
		
	if(userId.equals(ReUserId)){
	
	reviewService.deleteReview(reviewId);	
	response.sendRedirect("bookDetail.jsp?bookId="+bookId);	
	}
}
%>

