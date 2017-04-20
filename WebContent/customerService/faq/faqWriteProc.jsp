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
	
	String faqTitleName = request.getParameter("faqTitle");
	String faqCategoryName = request.getParameter("faqCategory");
	String faqContentName = request.getParameter("faqContent");
	
	if(faqTitleName==null || faqCategoryName==null || faqContentName==null){
		faqTitleName=null;
		faqCategoryName=null;
		faqContentName=null;
	}else{
		Faq faq = new Faq(faqCategoryName, faqTitleName, faqContentName, 0, "nomal");
		faqService.addFaq(faq);
	}
	response.sendRedirect("faqList.jsp");
%>