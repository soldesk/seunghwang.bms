<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.inquiry.domain.Inquiry" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDao" %>
<%@ page import="seunghwang.bms.customerService.inquiry.dao.InquiryDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryService" %>
<%@ page import="seunghwang.bms.customerService.inquiry.service.InquiryServiceImpl" %>
<%
	request.setCharacterEncoding("utf-8");
	InquiryDao inquiryDao = new InquiryDaoImpl();
	InquiryService inquiryService = new InquiryServiceImpl(inquiryDao);
	
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
		Inquiry inquiry = new Inquiry("nomal", inquiryCategoryName, inquiryTitleName, inquiryContentName, userEmail, "");
		inquiryService.addInquiry(inquiry);
	}
	response.sendRedirect("inquiryList.jsp");
%>