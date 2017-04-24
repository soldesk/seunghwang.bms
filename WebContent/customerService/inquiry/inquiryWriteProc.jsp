<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.inquiry.domain.Inquiry" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDao" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryService" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryServiceImpl" %>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	InquiryDao inquiryDao = new InquiryDaoImpl();
	InquiryService inquiryService = new InquiryServiceImpl(inquiryDao);
	HttpSession sess = request.getSession(false);
	
	String inquiryTitleName = request.getParameter("inquiryTitle");
	String userEmail1 = request.getParameter("userEmail");
	String userEmail2 = request.getParameter("userEmail2");
	String userEmail3 = request.getParameter("userEmail3");
	String userEmailAddr="";
	
	String inquiryCategoryName = request.getParameter("inquiryCategory");
	String inquiryContentName = request.getParameter("inquiryContent");
	
	
	if(userEmail2==null){
		userEmailAddr=userEmail3;
	}else{
		userEmailAddr=userEmail2;
	}
	String userEmail = userEmail1+"@"+userEmailAddr;
	
	if(inquiryTitleName==null || inquiryCategoryName==null || inquiryContentName==null){
		inquiryTitleName=null;
		inquiryCategoryName=null;
		inquiryContentName=null;
	}else{
		User user = (User)sess.getAttribute("authUser");
		Inquiry inquiry = new Inquiry(user.getUserId(), inquiryCategoryName, inquiryTitleName, inquiryContentName, userEmail, "");
		inquiryService.addInquiry(inquiry);
	}
	response.sendRedirect("inquiryList.jsp");
%>