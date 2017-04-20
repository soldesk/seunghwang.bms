<%@page import="seunghwang.bms.util.SendMail"%>
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
	
	String inquiryIdStr = request.getParameter("inquiryId");
	String answerTitleName = request.getParameter("answerTitle");
	String answerContentName = request.getParameter("answerContent");
	String answerUserEmail = request.getParameter("userEmail");
	
	if(answerTitleName==null || answerContentName==null){
		answerTitleName=null;
		answerContentName=null;
	}else{
		Inquiry inquiry = new Inquiry();
		int inquiryId = Integer.parseInt(inquiryIdStr);
		inquiry.setInquiryId(inquiryId);
		inquiry.setInquiryAnswer(answerContentName);
		SendMail.sendInquiryAnswer(answerUserEmail, answerTitleName, answerContentName);
		inquiryService.answerInquiry(inquiry);
	}
	response.sendRedirect("inquiryList.jsp");
%>