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
	String faqTitleName = request.getParameter("faqTitle");
	String faqCategoryName = request.getParameter("faqCategory");
	String faqContentName = request.getParameter("faqContent");
	
	if(faqIdStr==null){
		faqIdStr=null;
	}else{
		Faq faq = new Faq();
		int faqId = Integer.parseInt(faqIdStr);
		faq.setFaqId(faqId);
		faq.setFaqTitle(faqTitleName);
		faq.setFaqCategory(faqCategoryName);
		faq.setFaqContent(faqContentName);
		faqService.modFaq(faq);
	}
	response.sendRedirect("faqList.jsp");
%>