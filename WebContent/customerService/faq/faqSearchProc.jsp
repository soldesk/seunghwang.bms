<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDao" %>
<%@ page import="seunghwang.bms.customerService.faq.dao.FaqDaoImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqService" %>
<%@ page import="seunghwang.bms.customerService.faq.service.FaqServiceImpl" %>
<%@ page import="seunghwang.bms.customerService.faq.domain.Faq" %>
<%@ page import="java.util.List" %>
<%
	request.setCharacterEncoding("utf-8");
	FaqDao faqDao = new FaqDaoImpl();
	FaqService faqService = new FaqServiceImpl(faqDao);
	String searchFaqTitle = request.getParameter("searchFaqTitle");
	
	List<Faq> faqs = faqService.searchFaqs(searchFaqTitle);
	
	request.setAttribute("searchFaqs", faqs);
%>
<jsp:forward page="faqList.jsp"/>