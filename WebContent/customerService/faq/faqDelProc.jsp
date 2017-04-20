<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDao" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqService" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqServiceImpl" %>
<%
	request.setCharacterEncoding("utf-8");
	FaqDao faqDao = new FaqDaoImpl();
	FaqService faqService = new FaqServiceImpl(faqDao);
	String faqIdStr= request.getParameter("faqId");
	int faqId = Integer.parseInt(faqIdStr);
	
	if(faqIdStr==null){
		faqIdStr=null;
	}else{
		faqService.delFaq(faqId);
	}
	response.sendRedirect("faqList.jsp");
%>