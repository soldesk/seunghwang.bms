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
	int inquiryId = Integer.parseInt(inquiryIdStr);
	
	if(inquiryIdStr==null){
		inquiryIdStr=null;
	}else{
		
		inquiryService.delInquiry(inquiryId);
	}
	response.sendRedirect("inquiryList.jsp");
%>