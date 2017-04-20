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
	String inquiryIdStr= request.getParameter("inquiryId");
	String inquiryTitleName = request.getParameter("inquiryTitle");
	String userEmail1 = request.getParameter("userEmail");
	String userEmail2 = request.getParameter("userEmail2");
	String userEmail3 = request.getParameter("userEmail3");
	String userEmailAddr="";
	
	if(userEmail2==null){
		userEmailAddr=userEmail3;
	}else{
		userEmailAddr=userEmail2;
	}
	
	String userEmail = userEmail1+"@"+userEmailAddr;
	
	String inquiryCategoryName = request.getParameter("inquiryCategory");
	String inquiryContentName = request.getParameter("inquiryContent");
	
	if(inquiryIdStr==null){
		inquiryIdStr=null;
	}else{
		Inquiry inquiry = new Inquiry();
		int inquiryId = Integer.parseInt(inquiryIdStr);
		inquiry.setInquiryId(inquiryId);
		inquiry.setInquiryTitle(inquiryTitleName);
		inquiry.setUserEmail(userEmail);
		inquiry.setInquiryCategory(inquiryCategoryName);
		inquiry.setInquiryContent(inquiryContentName);
		inquiryService.modInquiry(inquiry);
	}
	response.sendRedirect("inquiryList.jsp");
%>