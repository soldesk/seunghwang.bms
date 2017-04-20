<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="seunghwang.bms.book.domain.Book"%>
<%@ page import="seunghwang.bms.book.domain.Detail" %>
<%@ page import="seunghwang.bms.book.dao.mapper.BookMapper"%>
<%@ page import="seunghwang.bms.book.dao.mapper.DetailMapper" %>
<%@ page import="seunghwang.bms.config.Configuration"%>
<%@ page import="seunghwang.bms.book.dao.BookDao"%>
<%@ page import="seunghwang.bms.book.dao.BookDaoImpl"%>
<%@ page import="seunghwang.bms.book.service.BookService"%>
<%@ page import="seunghwang.bms.book.service.BookServiceImpl"%>
<%@ page import="seunghwang.bms.book.dao.DetailDao" %>
<%@ page import="seunghwang.bms.book.dao.DetailDaoImpl" %>
<%@ page import="seunghwang.bms.book.service.DetailService" %>
<%@ page import="seunghwang.bms.book.service.DetailServiceImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	BookMapper bookMapper = Configuration.getMapper(BookMapper.class);
	BookDao bookDao = new BookDaoImpl(bookMapper);
	BookService bookService = new BookServiceImpl(bookDao);
	
	DetailMapper detailMapper = Configuration.getMapper(DetailMapper.class);
	DetailDao detailDao = new DetailDaoImpl(detailMapper);
	DetailService detailService = new DetailServiceImpl(detailDao);
	
	String bookId = request.getParameter("bookId");
	
	bookService.deleteBook(bookId);
	detailService.deleteDetail(bookId);
	response.sendRedirect("bookManage.jsp");
%>

